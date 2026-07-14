import pandas as pd
import random
from datetime import datetime, timedelta
NUMBER_OF_ORDERS = 1000
customer_ids = [
    f"C{i:04d}"
    for i in range(1, 501)
]
payment_methods = [
    "Credit Card",
    "Debit Card",
    "PayPal",
    "Shop Pay",
    "Gift Card"
]
order_statuses = [
    "Delivered",
    "Shipped",
    "Processing",
    "Cancelled",
    "Returned"
]
sales_channels = [
    "Online",
    "Store"
]
orders = []
for i in range(1, NUMBER_OF_ORDERS + 1):

    order_id = f"O{i:06d}"

    customer_id = random.choice(customer_ids)

    order_date = datetime.today() - timedelta(
        days=random.randint(0, 365)
    )

    payment_method = random.choice(payment_methods)

    order_status = random.choice(order_statuses)

    sales_channel = random.choice(sales_channels)

    order = {
        "order_id": order_id,
        "customer_id": customer_id,
        "order_date": order_date.strftime("%Y-%m-%d"),
        "payment_method": payment_method,
        "order_status": order_status,
        "sales_channel": sales_channel
    }

    orders.append(order)
    df = pd.DataFrame(orders)

print(df.head())

df.to_csv("data/raw/orders.csv", index=False)

print("Orders generator completed successfully!")