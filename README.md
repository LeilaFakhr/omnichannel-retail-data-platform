# Omnichannel Retail Analytics Data Platform

An end-to-end retail analytics and analytics engineering project demonstrating how raw retail data can be transformed into validated, structured, and analysis-ready datasets for business reporting and decision-making.

The project combines **Python, Pandas, SQL, Snowflake, data quality validation, dimensional modeling, and Power BI** to demonstrate an analytics engineering workflow from raw data generation through data modeling and business analysis.

---

## Project Overview

Retail organizations generate data across multiple channels and operational systems, including customers, products, orders, and sales transactions.

This project simulates an omnichannel retail environment where raw transactional and master data is transformed into a structured analytical model.

The platform supports analysis of:

- Sales and revenue performance
- Product performance
- Customer behavior
- Category performance
- Sales channel performance
- Profitability
- Trends over time

The focus is on demonstrating the complete analytics engineering workflow rather than only building a dashboard.

---

# Business Scenario

The simulated retail company operates across multiple sales channels and maintains data related to:

- Customers
- Products
- Orders
- Order items
- Sales transactions

Business stakeholders need reliable analytical data to:

- Monitor revenue and sales performance
- Identify high-performing products
- Compare sales channels
- Analyze customer value
- Understand category performance
- Monitor profitability
- Identify trends over time

The objective is to build a simplified analytics platform that transforms raw retail data into trusted, business-ready analytical datasets.

---

# Architecture

The project follows a layered analytics architecture using Python and Snowflake.

```text
                    Python / Pandas
                          │
                          ▼
                   Raw CSV Data
                          │
                          ▼
                Data Quality Validation
                          │
                          ▼
                 Snowflake RAW_DATA
                          │
                          ▼
                  Snowflake STAGING
                          │
                          ▼
                   Snowflake MART
                          │
             ┌────────────┼────────────┐
             │            │            │
             ▼            ▼            ▼
       Dimensions     FACT_SALES   SALES_SUMMARY
             │            │            │
             └────────────┼────────────┘
                          │
                          ▼
                    SQL Analysis
                          │
                          ▼
                      Power BI
                          │
                          ▼
                  Business Insights