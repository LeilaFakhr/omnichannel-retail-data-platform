import pandas as pd
import random

# Number of customers we want to create
number_of_customers = 100

# Sample data
names = [
    "John Smith", "Emma Brown", "Michael Lee", 
    "Sophia Wilson", "David Taylor", "Olivia Martin"
]

countries = [
    "Canada", "USA", "UK", "Australia"
]

customers = []

# Generate customer records
for customer_id in range(1, number_of_customers + 1):
    customer = {
        "customer_id": customer_id,
        "name": random.choice(names),
        "country": random.choice(countries),
        "age": random.randint(20, 65),
        "total_orders": random.randint(1, 20),
        "total_spent": round(random.uniform(50, 2000), 2)
    }

    customers.append(customer)


# Convert to DataFrame
df = pd.DataFrame(customers)

# Save as CSV file
df.to_csv("customers.csv", index=False)

print("Customer data created successfully!")
print(df.head())