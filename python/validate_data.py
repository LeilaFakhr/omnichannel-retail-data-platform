import pandas as pd

# Load data
products = pd.read_csv("data/raw/products.csv")
customers = pd.read_csv("data/raw/customers.csv")
orders = pd.read_csv("data/raw/orders.csv")
order_items = pd.read_csv("data/raw/order_items.csv")


# --------------------------------------------------
# 1. Data volume
# --------------------------------------------------

print("\n=== DATA VOLUME ===")

print("Customers:", customers.shape)
print("Products:", products.shape)
print("Orders:", orders.shape)
print("Order Items:", order_items.shape)


# --------------------------------------------------
# 2. Missing values
# --------------------------------------------------

print("\n=== MISSING VALUES ===")

print("\nCustomers:")
print(customers.isnull().sum())

print("\nProducts:")
print(products.isnull().sum())

print("\nOrders:")
print(orders.isnull().sum())

print("\nOrder Items:")
print(order_items.isnull().sum())


# --------------------------------------------------
# 3. Duplicate checks
# --------------------------------------------------

print("\n=== DUPLICATE CHECKS ===")

print(
    "Duplicate customers:",
    customers["customer_id"].duplicated().sum()
)

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


# --------------------------------------------------
# 4. Revenue validation
# --------------------------------------------------

print("\n=== REVENUE VALIDATION ===")

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


# --------------------------------------------------
# 5. Quantity and price validation
# --------------------------------------------------

print("\n=== VALUE VALIDATION ===")

print(
    "Invalid quantities:",
    (order_items["quantity"] <= 0).sum()
)

print(
    "Invalid unit prices:",
    (order_items["unit_price"] < 0).sum()
)

print(
    "Invalid total prices:",
    (order_items["total_price"] < 0).sum()
)


# --------------------------------------------------
# 6. Relationship validation
# --------------------------------------------------

print("\n=== RELATIONSHIP VALIDATION ===")

missing_orders = (
    ~order_items["order_id"].isin(orders["order_id"])
).sum()

missing_products = (
    ~order_items["product_id"].isin(products["product_id"])
).sum()

missing_customers = (
    ~orders["customer_id"].isin(customers["customer_id"])
).sum()

print(
    "Order items with missing orders:",
    missing_orders
)

print(
    "Order items with missing products:",
    missing_products
)

print(
    "Orders with missing customers:",
    missing_customers
)


# --------------------------------------------------
# 7. Order status validation
# --------------------------------------------------

print("\n=== ORDER STATUS VALIDATION ===")

valid_statuses = {
    "Delivered",
    "Shipped",
    "Processing",
    "Cancelled",
    "Returned"
}

invalid_statuses = (
    ~orders["order_status"].isin(valid_statuses)
).sum()

print(
    "Invalid order statuses:",
    invalid_statuses
)