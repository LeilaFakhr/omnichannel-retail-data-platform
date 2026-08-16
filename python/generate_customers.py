import pandas as pd
import random

# Number of customers to create
NUMBER_OF_CUSTOMERS = 500

# Sample names
names = [
    "John Smith",
    "Emma Brown",
    "Michael Lee",
    "Sophia Wilson",
    "David Taylor",
    "Olivia Martin"
]

# Sample countries
countries = [
    "Canada",
    "USA",
    "UK",
    "Australia"
]

customers = []

# Generate customer records
for i in range(1, NUMBER_OF_CUSTOMERS + 1):

    customer = {
        "customer_id": f"C{i:04d}",
        "name": random.choice(names),
        "country": random.choice(countries),
        "age": random.randint(20, 65),
        "total_orders": random.randint(1, 20),
        "total_spent": round(random.uniform(50, 2000), 2)
    }

    customers.append(customer)

# Convert to DataFrame
df = pd.DataFrame(customers)

# Save as CSV
df.to_csv("data/raw/customers.csv", index=False)

print("Customer data created successfully!")
print(df.head())