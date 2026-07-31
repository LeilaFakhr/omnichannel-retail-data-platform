-- Create Customer Dimension

CREATE OR REPLACE TABLE dim_customer AS

SELECT

    customer_id,
    name,
    country,
    age

FROM customers;