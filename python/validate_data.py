import pandas as pd
products = pd.read_csv("data/raw/products.csv")
orders = pd.read_csv("data/raw/orders.csv")
order_items = pd.read_csv("data/raw/order_items.csv")
print("Products:", products.shape)
print("Orders:", orders.shape)
print("Order Items:", order_items.shape)
print(products.head())
print(orders.head())
print(order_items.head())
print("\nMissing values:")
print(products.isnull().sum())
print(orders.isnull().sum())
print(order_items.isnull().sum())
print("\nDuplicate checks:")

print(
    "Duplicate products:",
    products["product_id"].duplicated().sum()
)

print(
    "Duplicate orders:",
    orders["order_id"].duplicated().sum()
)

print(
    "Duplicate order items:",
    order_items["order_item_id"].duplicated().sum()
)
print("\nRevenue validation:")

calculated_total = (
    order_items["quantity"] *
    order_items["unit_price"]
)

difference = (
    calculated_total -
    order_items["total_price"]
)

print(
    "Incorrect revenue rows:",
    (difference.abs() > 0.01).sum()
)
print("\nRelationship validation:")

missing_orders = (
    ~order_items["order_id"].isin(orders["order_id"])
).sum()

missing_products = (
    ~order_items["product_id"].isin(products["product_id"])
).sum()


print(
    "Order items with missing orders:",
    missing_orders
)

print(
    "Order items with missing products:",
    missing_products
)