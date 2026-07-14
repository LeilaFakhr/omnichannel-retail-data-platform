import pandas as pd
import matplotlib.pyplot as plt


# Load data
df = pd.read_csv("customers.csv")


# Count customers by country
country_count = df["country"].value_counts()


# Create bar chart
plt.figure(figsize=(8,5))

country_count.plot(
    kind="bar"
)


# Add title and labels
plt.title("Customers by Country")
plt.xlabel("Country")
plt.ylabel("Number of Customers")


# Show chart
plt.tight_layout()
plt.show()