import pandas as pd
import random
NUMBER_OF_ITEMS = 3000
order_ids = [
    f"O{i:06d}"
    for i in range(1, 1001)
]


product_ids = [
    f"P{i:04d}"
    for i in range(1, 201)
]
order_items = []
for i in range(1, NUMBER_OF_ITEMS + 1):

    order_id = random.choice(order_ids)

    product_id = random.choice(product_ids)

    quantity = random.randint(1, 5)

    unit_price = round(random.uniform(20, 450), 2)

    item = {
        "order_item_id": f"OI{i:06d}",
        "order_id": order_id,
        "product_id": product_id,
        "quantity": quantity,
        "unit_price": unit_price,
        "total_price": round(quantity * unit_price, 2)
    }

    order_items.append(item)
    df = pd.DataFrame(order_items)

print(df.head())

df.to_csv("data/raw/order_items.csv", index=False)

print("Order items generator completed successfully!")   
