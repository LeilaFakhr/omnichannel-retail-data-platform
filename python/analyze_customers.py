import pandas as pd

# Load customer data
df = pd.read_csv("customers.csv")

# Show first 5 rows
print("First 5 customers:")
print(df.head())


# Total number of customers
total_customers = len(df)

print("\nTotal Customers:")
print(total_customers)


# Average spending
average_spending = df["total_spent"].mean()

print("\nAverage Customer Spending:")
print(round(average_spending, 2))


# Customers by country
country_count = df["country"].value_counts()

print("\nCustomers by Country:")
print(country_count)


# Top 5 customers by spending
top_customers = df.sort_values(
    by="total_spent",
    ascending=False
).head(5)

print("\nTop 5 Customers:")
print(top_customers)

# Calculate Average Order Value

df["average_order_value"] = (
    df["total_spent"] / df["total_orders"]
)

print("\nAverage Order Value:")
print(df["average_order_value"].mean())


# Top customers by Average Order Value

top_aov = df.sort_values(
    by="average_order_value",
    ascending=False
).head(5)

print("\nTop Customers by Average Order Value:")
print(top_aov[
    ["name", "country", "total_orders", "total_spent", "average_order_value"]
])