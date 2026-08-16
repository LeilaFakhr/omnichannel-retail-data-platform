import pandas as pd
import os


# File locations
RAW_PATH = "../data/raw/"
PROCESSED_PATH = "../data/processed/"


# Create processed folder if it does not exist
os.makedirs(PROCESSED_PATH, exist_ok=True)


def load_data():
    customers = pd.read_csv(
        RAW_PATH + "customers.csv"
    )

    products = pd.read_csv(
        RAW_PATH + "products.csv"
    )

    orders = pd.read_csv(
        RAW_PATH + "orders.csv"
    )

    order_items = pd.read_csv(
        RAW_PATH + "order_items.csv"
    )

    return customers, products, orders, order_items


def transform_data(customers, products, orders, order_items):

    # Remove duplicates
    customers = customers.drop_duplicates()
    products = products.drop_duplicates()
    orders = orders.drop_duplicates()
    order_items = order_items.drop_duplicates()


    # Convert dates
    orders["order_date"] = pd.to_datetime(
        orders["order_date"]
    )


    # Remove missing values
    customers = customers.dropna()
    products = products.dropna()
    orders = orders.dropna()
    order_items = order_items.dropna()


    return customers, products, orders, order_items



def save_data(customers, products, orders, order_items):

    customers.to_csv(
        PROCESSED_PATH + "customers_clean.csv",
        index=False
    )

    products.to_csv(
        PROCESSED_PATH + "products_clean.csv",
        index=False
    )

    orders.to_csv(
        PROCESSED_PATH + "orders_clean.csv",
        index=False
    )

    order_items.to_csv(
        PROCESSED_PATH + "order_items_clean.csv",
        index=False
    )



if __name__ == "__main__":

    print("Starting ETL process...")

    customers, products, orders, order_items = load_data()

    customers, products, orders, order_items = transform_data(
        customers,
        products,
        orders,
        order_items
    )

    save_data(
        customers,
        products,
        orders,
        order_items
    )

    print("ETL completed successfully!")