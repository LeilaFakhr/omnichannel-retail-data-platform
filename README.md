# Omnichannel Retail Analytics Data Platform

An end-to-end retail analytics project demonstrating how raw retail data can be transformed into validated, structured, and analysis-ready data for business reporting and decision-making.

The project combines **Python, Pandas, SQL, Snowflake, data quality validation, dimensional modeling, and Power BI** to demonstrate an analytics engineering workflow from raw data generation to business insights.

---

## Project Overview

Retail organizations generate data across multiple channels and operational systems, including customers, products, orders, and sales transactions.

This project simulates a retail analytics environment where raw transactional data is transformed into a structured analytical model and used to answer business questions related to:

* Sales and revenue performance
* Customer behavior
* Product performance
* Category performance
* Order activity
* Trends over time

The focus is on demonstrating the complete analytics workflow rather than only building a dashboard.

---

## Business Scenario

The simulated retail company operates across multiple sales channels and maintains data related to:

* Customers
* Products
* Orders
* Order items
* Sales transactions

Business stakeholders need reliable analytical data to understand sales performance, identify high-performing products, analyze customer value, and monitor trends over time.

The objective of this project is to build a simplified analytics platform that transforms raw retail data into trusted analytical datasets for reporting and business analysis.

---

## Architecture

```text
                Python / Pandas
                       │
                       ▼
                Raw Retail Data
                   CSV Files
                       │
                       ▼
             Data Validation & QA
                       │
                       ▼
              Processed Data
                       │
                       ▼
                   Snowflake
                       │
                       ▼
              SQL Data Modeling
                       │
             ┌─────────┴─────────┐
             ▼                   ▼
       Dimension Tables       Fact Table
             │                   │
             └─────────┬─────────┘
                       ▼
                 Sales Summary
                       │
                       ▼
                    Power BI
                       │
                       ▼
              Business Insights
```

---

# Technologies

| Technology       | Purpose                                              |
| ---------------- | ---------------------------------------------------- |
| **Python**       | Data generation, processing, validation and analysis |
| **Pandas**       | Data manipulation and transformation                 |
| **SQL**          | Data modeling, transformation and analytical queries |
| **Snowflake**    | Cloud data warehouse and analytical data environment |
| **Power BI**     | Interactive reporting and data visualization         |
| **Git / GitHub** | Version control and project documentation            |

---

# Data Pipeline

## 1. Data Generation

Python and Pandas are used to generate realistic retail datasets for the project.

The generated datasets include:

* Customers
* Products
* Orders
* Order Items

Using generated data provides a controlled environment for demonstrating data engineering and analytics concepts without using confidential business information.

---

## 2. Raw Data

The generated datasets are stored as CSV files under the `data/raw/` directory.

Example datasets include:

```text
customers.csv
products.csv
orders.csv
order_items.csv
```

These datasets represent the raw transactional and master data used throughout the project.

---

## 3. Data Validation and Quality Checks

Data quality validation is performed before downstream analytical processing.

The validation process includes checks for:

* Missing values
* Duplicate records
* Data consistency
* Revenue calculation accuracy
* Valid product and customer relationships
* Order and order-item consistency

The goal is to identify data quality issues before they affect analytical results and reporting.

The validation logic is implemented in Python and can be found in:

```text
python/validate_data.py
```

---

# Snowflake Data Warehouse

Snowflake is used as the cloud data warehouse environment for the analytical workflow.

The project includes working with Snowflake database and schema structures and organizing retail data for downstream SQL analysis and modeling.

The warehouse layer provides an environment for:

* Storing retail datasets
* Organizing data into schemas
* Running SQL transformations
* Creating analytical models
* Supporting BI reporting

---

# SQL Data Modeling

The analytical model uses a **star schema** design.

The purpose of the model is to separate transactional measures from descriptive business attributes and provide a structure that is easier to query and use in BI tools.

The SQL modeling scripts are located in:

```text
sql/
```

---

## Fact Table

### Fact_Sales

`Fact_Sales` represents the central sales transaction table.

Key fields include:

* Order ID
* Customer ID
* Product ID
* Order Date
* Quantity
* Revenue

The fact table contains the measures used for sales and revenue analysis.

---

## Dimension Tables

### Dim_Customer

Contains customer-level descriptive information used for customer analysis.

Examples include:

* Customer ID
* Customer attributes
* Customer-related analytical attributes

---

### Dim_Product

Contains product-level information used for product and category analysis.

Examples include:

* Product ID
* Product name
* Category
* Price
* Product attributes

---

### Dim_Date

Provides time-related attributes for analyzing sales trends.

Examples include:

* Date
* Year
* Quarter
* Month
* Month Name
* Day

---

## Analytical Sales Summary

The project also includes a sales summary model that supports higher-level business analysis.

The SQL modeling workflow includes:

```text
Dim_Customer
      │
      │
      ▼
Dim_Date ───────► Fact_Sales ◄─────── Dim_Product
                       │
                       ▼
                Sales Summary
```

This structure provides a foundation for reporting and analytical queries.

---

# SQL Analysis

SQL is used to analyze the modeled retail data and answer business questions.

Analytical areas include:

### Sales Performance

* Total revenue
* Order volume
* Monthly sales
* Revenue trends
* Average order value

### Product Performance

* Top-performing products
* Product revenue
* Product contribution
* Product performance by category

### Customer Analysis

* Customer purchasing behavior
* Highest-value customers
* Customer revenue contribution
* Customer-level sales analysis

### Category Analysis

* Revenue by category
* Category performance
* Product performance across categories

---

# Power BI Dashboard

Power BI is used to visualize the analytical data and provide an interactive reporting layer.

The dashboard focuses on key retail performance indicators and trends.

## Dashboard Areas

### Sales Performance

* Revenue
* Orders
* Sales trends
* Monthly performance

### Product Performance

* Top products
* Product revenue
* Product contribution

### Customer Analysis

* Customer purchasing behavior
* High-value customers
* Customer revenue contribution

### Category Performance

* Revenue by category
* Category comparison
* Category trends

---

## Key KPIs

The dashboard includes metrics such as:

* Total Revenue
* Total Orders
* Average Order Value
* Customer Count
* Product Performance
* Category Revenue

The dashboard is designed to allow users to move from high-level KPIs into more detailed sales and customer analysis.

---

# Business Questions

The project is designed to answer questions such as:

### Sales

* What are the overall sales and revenue trends?
* How does revenue change over time?
* How many orders are being generated?
* What is the average order value?

### Products

* Which products generate the highest revenue?
* Which products have the strongest sales performance?
* How does product performance vary by category?

### Customers

* Who are the highest-value customers?
* Which customers contribute the most revenue?
* How does customer purchasing behavior vary?

### Categories

* Which categories generate the most revenue?
* Which categories perform best?
* How does product performance vary across categories?

---

# Data Quality Approach

Data quality is considered as part of the analytical workflow rather than only at the reporting stage.

The project includes validation logic for:

* Missing values
* Duplicate records
* Revenue calculations
* Product relationships
* Customer relationships
* Order and order-item consistency

This helps ensure that analytical results are based on consistent and validated data.

---

# Project Structure

```text
omnichannel-retail-data-platform/
│
├── data/
│   ├── raw/
│   │   ├── customers.csv
│   │   ├── products.csv
│   │   ├── orders.csv
│   │   └── order_items.csv
│   │
│   └── processed/
│
├── python/
│   ├── generate_customers.py
│   ├── generate_products.py
│   ├── generate_orders.py
│   ├── generate_order_items.py
│   ├── analyze_customers.py
│   ├── customer_dashboard.py
│   └── validate_data.py
│
├── sql/
│   ├── 01_create_dim_customer.sql
│   ├── 02_create_dim_product.sql
│   ├── 03_create_fact_sales.sql
│   ├── 04_create_dim_date.sql
│   └── 05_create_sales_summary.sql
│
├── powerbi/
│   ├── Retail_Analytics_Dashboard.pbix
│   └── screenshots/
│
├── documentation/
│   ├── project overview
│   ├── learning journal
│   └── Git documentation
│
└── README.md
```

---

# Key Skills Demonstrated

## Data & Analytics

* Data analysis
* Data transformation
* Data validation
* Data quality
* KPI development
* Business analysis
* Analytical problem solving

## Analytics Engineering

* SQL data modeling
* ETL / ELT concepts
* Cloud data warehousing
* Snowflake
* Dimensional modeling
* Star schema design
* Fact and dimension tables
* Analytical data preparation

## Business Intelligence

* Power BI
* Dashboard development
* KPI reporting
* Data visualization
* Business-focused reporting

## Programming & Development

* Python
* Pandas
* Git
* GitHub

---

# Project Outcomes

This project demonstrates a complete analytics workflow:

```text
Raw Retail Data
       ↓
Python Data Generation
       ↓
Data Validation
       ↓
Snowflake
       ↓
SQL Data Modeling
       ↓
Fact & Dimension Tables
       ↓
Analytical Sales Summary
       ↓
Power BI
       ↓
Business Insights
```

The resulting analytical environment provides a foundation for analyzing retail sales, customers, products, and categories while demonstrating practical concepts used in modern analytics engineering.

---

# Future Improvements

Potential next steps include:

* Build automated ETL/ELT pipelines
* Introduce a dedicated transformation layer in Snowflake
* Implement incremental data loading
* Implement Slowly Changing Dimensions (SCD)
* Add automated data quality testing
* Add pipeline orchestration
* Implement scheduled Power BI refresh
* Add inventory analytics
* Add marketing campaign analysis
* Add customer segmentation
* Introduce CI/CD practices for data workflows

---

# Key Learning

The project provided practical experience across the analytics engineering lifecycle:

**Python → Data Validation → SQL → Snowflake → Data Modeling → Power BI → Business Insights**

It also demonstrates the connection between the technical data layer and the business reporting layer, showing how raw operational data can be transformed into structured analytical information for decision-making.
