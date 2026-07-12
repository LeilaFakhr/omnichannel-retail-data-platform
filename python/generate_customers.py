print("========================================")
print(" Welcome to the Omnichannel Retail Analytics Platform")
print("========================================")

print("\nGenerating customer dataset...\n")

customers = [
    {
        "customer_id": 1001,
        "first_name": "Emma",
        "city": "Toronto",
        "province": "Ontario"
    },
    {
        "customer_id": 1002,
        "first_name": "Liam",
        "city": "Vancouver",
        "province": "British Columbia"
    }
]

for customer in customers:
    print(customer)

print("\nCustomer dataset generated successfully!")