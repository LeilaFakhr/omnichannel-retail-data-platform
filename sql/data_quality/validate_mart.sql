-- ============================================================
-- Retail Analytics Data Platform
-- MART Layer Data Quality Validation
-- ============================================================
--
-- Purpose:
-- Validate the integrity and business logic of the MART layer
-- before the data is consumed by Power BI.
--
-- Tests included:
-- 1. Duplicate customers
-- 2. Duplicate products
-- 3. Fact table grain
-- 4. Orphan customers
-- 5. Orphan products
-- 6. Revenue calculation
-- 7. Profit calculation
--
-- Expected result:
-- Duplicate / orphan / invalid-record queries should return
-- no rows, and calculation checks should return 0.
-- ============================================================


-- ============================================================
-- TEST 1: Duplicate Customers
-- Expected: No results
-- ============================================================

SELECT
    customer_id,
    COUNT(*) AS row_count
FROM RETAIL_ANALYTICS.MART.DIM_CUSTOMER
GROUP BY customer_id
HAVING COUNT(*) > 1;


-- ============================================================
-- TEST 2: Duplicate Products
-- Expected: No results
-- ============================================================

SELECT
    product_id,
    COUNT(*) AS row_count
FROM RETAIL_ANALYTICS.MART.DIM_PRODUCT
GROUP BY product_id
HAVING COUNT(*) > 1;


-- ============================================================
-- TEST 3: Fact Table Grain
--
-- Grain:
-- One row per order item.
--
-- Expected: No results
-- ============================================================

SELECT
    order_item_id,
    COUNT(*) AS row_count
FROM RETAIL_ANALYTICS.MART.FACT_SALES
GROUP BY order_item_id
HAVING COUNT(*) > 1;


-- ============================================================
-- TEST 4: Referential Integrity - Customers
--
-- Every customer in FACT_SALES should exist in DIM_CUSTOMER.
--
-- Expected: 0
-- ============================================================

SELECT
    COUNT(*) AS orphan_customers
FROM RETAIL_ANALYTICS.MART.FACT_SALES fs

LEFT JOIN RETAIL_ANALYTICS.MART.DIM_CUSTOMER dc
    ON fs.customer_id = dc.customer_id

WHERE dc.customer_id IS NULL;


-- ============================================================
-- TEST 5: Referential Integrity - Products
--
-- Every product in FACT_SALES should exist in DIM_PRODUCT.
--
-- Expected: 0
-- ============================================================

SELECT
    COUNT(*) AS orphan_products
FROM RETAIL_ANALYTICS.MART.FACT_SALES fs

LEFT JOIN RETAIL_ANALYTICS.MART.DIM_PRODUCT dp
    ON fs.product_id = dp.product_id

WHERE dp.product_id IS NULL;


-- ============================================================
-- TEST 6: Revenue Calculation
--
-- Business rule:
-- gross_sales = quantity * unit_price
--
-- Expected: 0 incorrect rows
-- ============================================================

SELECT
    COUNT(*) AS incorrect_revenue_rows
FROM RETAIL_ANALYTICS.MART.FACT_SALES

WHERE ABS(
    gross_sales - (quantity * unit_price)
) > 0.01;


-- ============================================================
-- TEST 7: Profit Calculation
--
-- Business rule:
-- gross_profit = gross_sales - total_cost
--
-- Expected: 0 incorrect rows
-- ============================================================

SELECT
    COUNT(*) AS incorrect_profit_rows
FROM RETAIL_ANALYTICS.MART.FACT_SALES

WHERE ABS(
    gross_profit - (gross_sales - total_cost)
) > 0.01;