from pprint import pprint
from sqlite3 import Connection, Cursor
from typing import Type, Tuple, List
from tables import Table, Column, TABLES, User, Product, Brand, CartItem, Orders, OrderItem
from tabulate import tabulate


# What the create_table query generates
# query = f"""
#         CREATE TABLE IF NOT EXISTS {User} (
#             {User.user_id}      {User.user_id.dtype}        {User.user_id.constraints},
#             {User.user_name}    {User.user_name.dtype}      {User.user_name.constraints},
#             {User.is_customer}  {User.is_customer.dtype}    {User.is_customer.constraints},
#             {User.password}     {User.password.dtype}       {User.password.constraints},
#             {User.house_num}    {User.house_num.dtype}      {User.house_num.constraints},
#             {User.locality}     {User.locality.dtype}       {User.locality.constraints},
#             {User.city}         {User.city.dtype}           {User.city.constraints},
#             {User.state}        {User.state.dtype}          {User.state.constraints},
#             {User.pin_code}     {User.pin_code.dtype}       {User.pin_code.constraints},
#             {User.gender}       {User.gender.dtype}         {User.gender.constraints},
#         );
#     """


def add_triggers(con: Connection):
    triggers = [f"""CREATE TRIGGER remove_product_from_carts
                    AFTER DELETE ON {Product}
                    FOR EACH ROW
                    BEGIN
                        DELETE FROM {CartItem}
                        WHERE {CartItem.product_id} = OLD.{Product.id};
                    END;
                """,
                f"""CREATE TRIGGER insert_into_order_item_and_delete_cart_items
                    AFTER INSERT ON Orders
                    FOR EACH ROW
                    BEGIN
                        UPDATE Product
                        SET quantity = quantity - (SELECT CartItem.quantity
                                                   FROM CartItem
                                                   WHERE CartItem.user_id = NEW.user_id
                                                   AND CartItem.product_id = Product.id)
                        WHERE id IN (SELECT CartItem.product_id
                                     FROM CartItem
                                     WHERE CartItem.user_id = NEW.user_id);
                    
                        INSERT INTO OrderItem (user_id, order_id, product_id, quantity)
                        SELECT CartItem.user_id, NEW.id, CartItem.product_id, CartItem.quantity
                        FROM CartItem
                        WHERE CartItem.user_id = NEW.user_id;
                        
                        DELETE FROM CartItem WHERE user_id = NEW.user_id;
                    END;
                    """, ]

    for t in triggers:
        con.execute(t).fetchall()


def initialize_metadata_for_table(cls: Type[Table]):
    for name in cls.__dict__:
        attribute = getattr(cls, name)
        if isinstance(attribute, Column):
            if attribute.name == "":
                attribute.name = name

            attribute.full = f"{cls.__name__}.{attribute}"


def transact(con: Connection, query: List[str]) -> bool:
    try:
        con.execute("BEGIN TRANSACTION")
        for q in query:
            con.executescript(q)
        con.execute("COMMIT")
        return True
    except con.Error:
        con.execute("ROLLBACK")
        return False


def add_product(con: Connection, params: str):
    query = f"INSERT INTO {Product} ({Product.name}, {Product.description}, {Product.price}, {Product.brand_id}) VALUES {params};"

    if not transact(con, [query]):
        print("Failed to add product")


def place_order(con: Connection, user_id: int):
    query = f"INSERT INTO Orders (user_id) VALUES ({user_id});"
    con.execute(query)


def initialize_metadata_for_all_tables():
    for table_class in TABLES:
        initialize_metadata_for_table(table_class)


# ('Amit Singh', 'A-123', 'Connaught Place', 'New Delhi', 'Delhi', 110001, 'India', 'M')
def insert_user(con: Connection, params: str) -> Cursor:
    query = f"INSERT INTO {User}"
    query += f" ({User.username}, {User.house_num}, {User.locality}, {User.city}, {User.state}, {User.pin_code}, {User.country}, {User.gender}) "
    query += f"VALUES {params};"
    return con.execute(query)


def insert_brand(con: Connection, name: str) -> Cursor:
    query = f"INSERT INTO {Brand} ({Brand.name}) VALUES ('{name}');"
    return con.execute(query)


def insert_product(con: Connection, params: str) -> Cursor:
    query = f"INSERT INTO {Product} ({Product.name}, {Product.description}, {Product.price}, {Product.brand_id}, {Product.quantity}) VALUES {params};"
    return con.execute(query)


def add_product_to_cart(con: Connection, params: str):
    list_params = params.strip().strip("(").strip(")").split(", ")
    quantity = int(list_params[-1])
    product_id = list_params[0]
    available_qty = \
        con.execute(f"SELECT {Product.quantity} FROM {Product} WHERE {Product.id} = {product_id};").fetchone()[0]

    cur_qty = con.execute(
        f"SELECT {CartItem.quantity} FROM {CartItem} WHERE {CartItem.user_id} = {list_params[1]} AND {CartItem.product_id} = {product_id};").fetchall()

    print("Current quantity is ")
    if len(cur_qty) != 0:
        cur_qty = cur_qty[0][0]
        new_qty = cur_qty + quantity
        if new_qty >= available_qty:
            print("More than available quantity!")
            query = f"UPDATE {CartItem} SET {CartItem.quantity} = {available_qty} WHERE {CartItem.product_id} = {product_id};"
        else:
            query = f"UPDATE {CartItem} SET {CartItem.quantity} = {cur_qty + quantity} WHERE {CartItem.product_id} = {product_id};"
        return con.execute(query)

    if available_qty >= int(quantity):
        query = f"INSERT INTO {CartItem} ({CartItem.product_id}, {CartItem.user_id}, {CartItem.quantity}) VALUES {params};"
        return con.execute(query)
    else:  # quantity to add in cart is more than quantity available:
        print("More than available quantity!")
        new_params = "(" + f"{list_params[0]}, {list_params[1]}, {available_qty}" + ")"
        query = f"INSERT INTO {CartItem} ({CartItem.product_id}, {CartItem.user_id}, {CartItem.quantity}) VALUES {new_params};"
        return con.execute(query)


def insert_cart_item(con: Connection, params: str) -> Cursor:
    query = f"INSERT INTO {CartItem} ({CartItem.product_id}, {CartItem.user_id}, {CartItem.quantity}) VALUES {params};"
    return con.execute(query)


def create_table(con: Connection, table: Type[Table]) -> Cursor:
    query = f"CREATE TABLE IF NOT EXISTS {table} (\n\t"
    query += ",\n\t".join(f"{col} {col.dtype} {col.constraints}" for col in table.columns())
    query += "\n);"
    return con.execute(query)


def search_product_by_name(con: Connection, product_name: str) -> Cursor | None:  # | TODO | None
    params_list = product_name.split()
    if len(params_list) == 0:
        print("Empty string entered")
        return None

    for i in range(len(params_list)):
        params_list[i] = f"%{params_list[i]}%"

    query = f"SELECT * FROM {Product} WHERE {Product.name} LIKE '{params_list[0]}'"
    for i in range(1, len(params_list)):
        query += f"AND {Product.name} LIKE '{params_list[i]}'"

    query += ";"
    return con.execute(query)


def remove_product_having_id(con: Connection, product_id: int) -> Cursor | None:  # TODO | None
    query = f"DELETE FROM {Product} WHERE {Product.id} = {product_id};"
    return con.execute(query)


def print_table(con: Connection, table: Type[Table], raw_data=None):
    if raw_data is None:
        query = f"SELECT * FROM {table}"
        cur = con.execute(query)
        raw_data = cur.fetchall()

    for i in range(len(raw_data)):
        raw_data[i] = list(raw_data[i])
        for j in range(len(raw_data[i])):
            raw_data[i][j] = str(raw_data[i][j])

    print(tabulate(raw_data, headers=table.colnames(), tablefmt="rounded_grid"))
    return


def refresh_user_cart(con: Connection) -> Cursor:
    print("refreshing user cart")
    query = f"""UPDATE CartItem
                SET quantity = (SELECT MIN(CartItem.quantity, Product.quantity)
                                FROM Product
                                WHERE CartItem.product_id = Product.id)
                WHERE EXISTS (SELECT 1
                              FROM Product
                              WHERE CartItem.product_id = Product.id);"""

    query = f"""DELETE FROM CartItem
                WHERE quantity = 0;"""

    return con.execute(query)


def product_exists_in_cart(con, user_id, product_id):
    query = f"SELECT * FROM {CartItem} WHERE {CartItem.user_id} = {user_id} AND {CartItem.product_id} = {product_id};"
    print(query)
    a = con.execute(query).fetchall()
    return len(a) > 0


def remove_cart_item(con, user_id, product_id):
    query = f"""DELETE FROM cartitem WHERE user_id = {user_id} AND product_id = {product_id};"""
    con.execute(query)


def show_user_cart(con: Connection, user_id: int) -> tuple[list[str], Cursor]:
    query = f"SELECT {Product.name}, {Product}.{Product.id}, {Product.price}, {CartItem}.{CartItem.quantity}, {Product.price} * {CartItem}.{CartItem.quantity} AS total\n"
    query += f"FROM {CartItem}\n"
    query += f"INNER JOIN {Product} ON {Product}.{Product.id} = {CartItem.product_id}\n"
    query += f"WHERE {CartItem}.{CartItem.user_id} = {user_id};"
    headers = [Product.name.name, Product.id.name, Product.price.name, CartItem.quantity.name, "total"]
    print(query)
    return headers, con.execute(query)


def search_user_by_id_pass(con: Connection, user_id: int, password: str) -> Cursor:
    query = f"SELECT * FROM {User} WHERE {User.id} = {user_id} AND {User.password} LIKE '{password}';"
    return con.execute(query)


def print_tables(con: Connection):
    for table in TABLES:
        print_table(con, table)


def create_tables(con: Connection):
    for table in TABLES:
        print("creating table!")
        create_table(con, table)
