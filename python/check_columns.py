import pandas as pd

files = [
    "customers_clean.csv",
    "products_clean.csv",
    "orders_clean.csv",
    "order_items_clean.csv"
]

for file in files:
    df = pd.read_csv(f"../data/processed/{file}")
    print(f"\n{file}")
    print(df.columns.tolist())