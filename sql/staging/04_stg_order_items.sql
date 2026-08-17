-- ============================================================
-- Retail Analytics Data Platform
-- STAGING: Order Items
-- ============================================================
--
-- Purpose:
-- Create a standardized staging table from the RAW order-item data.
--
-- Source:
-- RETAIL_ANALYTICS.RAW_DATA.ORDER_ITEMS
--
-- Target:
-- RETAIL_ANALYTICS.STAGING.STG_ORDER_ITEMS
-- ============================================================

CREATE OR REPLACE TABLE RETAIL_ANALYTICS.STAGING.STG_ORDER_ITEMS AS

SELECT
    order_item_id,
    order_id,
    product_id,
    quantity,
    unit_price,
    total_price

FROM RETAIL_ANALYTICS.RAW_DATA.ORDER_ITEMS;