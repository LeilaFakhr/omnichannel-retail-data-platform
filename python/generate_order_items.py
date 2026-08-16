import pandas as pd
import random

NUMBER_OF_ITEMS = 3000

# Load existing orders and products
orders_df = pd.read_csv("data/raw/orders.csv")
products_df = pd.read_csv("data/raw/products.csv")

# Available order and product IDs
order_ids = orders_df["order_id"].tolist()
product_ids = products_df["product_id"].tolist()

# Create a lookup for product prices
product_prices = dict(
    zip(products_df["product_id"], products_df["unit_price"])
)

order_items = []

for i in range(1, NUMBER_OF_ITEMS + 1):

    order_id = random.choice(order_ids)

    product_id = random.choice(product_ids)

    quantity = random.randint(1, 5)

    # Use the product's actual unit price
    unit_price = product_prices[product_id]

    total_price = round(quantity * unit_price, 2)

    item = {
        "order_item_id": f"OI{i:06d}",
        "order_id": order_id,
        "product_id": product_id,
        "quantity": quantity,
        "unit_price": unit_price,
        "total_price": total_price
    }

    order_items.append(item)

df = pd.DataFrame(order_items)

print(df.head())

df.to_csv("data/raw/order_items.csv", index=False)

print("Order items generator completed successfully!")