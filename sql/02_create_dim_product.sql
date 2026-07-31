-- Create Product Dimension

CREATE OR REPLACE TABLE dim_product AS

SELECT

    product_id,
    SKU,
    product_name,
    category,
    color,
    material,
    collection,
    size,
    cost,
    unit_price

FROM products;