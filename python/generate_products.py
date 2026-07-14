
import pandas as pd
import random

NUMBER_OF_PRODUCTS = 200
categories = [
    "Bags",
    "Wallets",
    "Jackets",
    "Sweats",
    "Activewear",
    "Accessories"
]

colors = [
    "Black",
    "Brown",
    "Tan",
    "White",
    "Grey",
    "Navy",
    "Olive",
    "Lavender",
    "Burgundy",
    "Sage Green",
    "Dusty Pink",
    "Forest Green",
    "Cream"
]

materials = [
    "Leather",
    "Cotton",
    "Canvas",
    "Wool",
    "Polyester",
    "Recycled Fabric"
]

collections = [
    "Spring 2025",
    "Summer 2025",
    "Fall 2025",
    "Winter 2025",
    "Spring 2026"
]
product_catalog = {
    "Bags": [
        "Leather Backpack",
        "Canvas Tote",
        "Crossbody Bag",
        "Weekender Duffel",
        "Mini Backpack",
        "Leather Satchel"
    ],

    "Wallets": [
        "Zip Wallet",
        "Card Holder",
        "Bifold Wallet",
        "Passport Wallet",
        "Travel Wallet",
        "Coin Purse"
    ],

    "Jackets": [
        "Leather Jacket",
        "Bomber Jacket",
        "Denim Jacket",
        "Quilted Jacket",
        "Puffer Jacket",
        "Rain Jacket"
    ],

    "Sweats": [
        "Pullover Hoodie",
        "Zip Hoodie",
        "Crewneck Sweatshirt",
        "Jogger Sweatpants",
        "Fleece Hoodie",
        "Relaxed Sweatpants"
    ],

    "Activewear": [
        "Performance Leggings",
        "Training Shorts",
        "Sports Bra",
        "Performance T-Shirt",
        "Running Jacket",
        "Training Hoodie"
    ],

    "Accessories": [
        "Leather Belt",
        "Knit Scarf",
        "Wool Beanie",
        "Leather Gloves",
        "Keychain",
        "Baseball Cap"
    ]
}
size_options = {
    "Bags": ["One Size"],
    "Wallets": ["One Size"],
    "Accessories": ["One Size"],
    "Jackets": ["XS", "S", "M", "L", "XL"],
    "Sweats": ["XXS", "XS", "S", "M", "L", "XL"],
    "Activewear": ["XXS","XS", "S", "M", "L", "XL"]
}
price_ranges = {
    "Bags": (120, 350),
    "Wallets": (40, 120),
    "Jackets": (180, 450),
    "Sweats": (70, 140),
    "Activewear": (50, 120),
    "Accessories": (20, 90)
}
products = []

for i in range(1, NUMBER_OF_PRODUCTS + 1):

    category = random.choice(categories)
    product_name = random.choice(product_catalog[category])
    color = random.choice(colors)
    material = random.choice(materials)
    collection = random.choice(collections)
    size = random.choice(size_options[category])

    min_price, max_price = price_ranges[category]

    unit_price = round(random.uniform(min_price, max_price), 2)

    cost = round(unit_price * random.uniform(0.4, 0.7), 2)

    product_id = f"P{i:04d}"
    sku = f"SKU-{i:04d}"

    product = {
        "product_id": product_id,
        "SKU": sku,
        "product_name": product_name,
        "category": category,
        "color": color,
        "material": material,
        "collection": collection,
        "size": size,
        "cost": cost,
        "unit_price": unit_price
    }

    products.append(product)

df = pd.DataFrame(products)

print(df.head())

df.to_csv("data/raw/products.csv", index=False)

print("Product generator completed successfully!")