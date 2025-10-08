🏬 Superstore Sales & Performance Dashboard

This project analyzes sales, profit, orders, discounts, and customer behavior using SQL, Python, and Power BI. The goal is to uncover insights into profitability, regional performance, product trends, and discount impacts.

📂 Project Structure
├── Superstore.csv               # Raw Superstore dataset

├── superstore_analysis.ipynb    # Jupyter Notebook for Python-based analysis & visualization

├── superstore_analysis.sql      # SQL scripts for KPIs and deep analysis

├── Screenshot (91).png          # Power BI Dashboard contains Executive Summary, Sales Insights, Profit Insights, Discounts & Customer Behavior 

└── README.md                    # Project documentation

🗂 Dataset

The dataset (Superstore.csv) contains retail transaction-level data with columns such as:

Order ID, Order Date, Ship Date, Ship Mode

Customer ID, Customer Name, Segment, Region, State, City

Product ID, Category, Sub-Category, Product Name

Sales, Quantity, Discount, Profit

📊 SQL Analysis

File: superstore_analysis.sql

Key analysis queries

superstore_analysis

:

Global KPIs – Sales, Profit, Orders, Customers, Products, Profit Margin

Region Performance – Sales & Profit by Region

Segment Performance – Consumer, Corporate, Home Office

Category & Sub-Category – Sales & Profit by product hierarchy

Product Analysis – Top & bottom 10 products by profit

Customer Analysis – Top & bottom 10 customers by profit

Ship Mode Performance – Orders, Sales, Profit by shipping type

Geography Insights – Top 10 states & cities by sales

Discount Impact – Discount bands vs sales & profitability

Loss-Making Lines/Orders – Identifying unprofitable transactions

Time Series – Monthly sales & profit trends

Category-Subcategory Pivot Prep – For dashboard integration

🐍 Python Analysis

File: superstore_analysis.ipynb

Key steps:

Data loading & preprocessing (pandas)

Exploratory Data Analysis (EDA)

Sales & profit trend analysis over time

Customer segmentation & contribution analysis

Product-level profitability study

Discount sensitivity analysis

Visualizations using matplotlib, seaborn, and plotly

📊 Power BI Dashboard

Screenshots included:

Executive Summary: KPIs, Monthly Sales Trend, Top Customers, Segment Sales Share

Sales Insights: Sales by state, shipping mode analysis, top products driving revenue

Profit Insights: Segment-wise profit share, top products by profit, low-margin categories

Discounts & Customer Behavior: Discounts trend, top customers benefiting, discount distribution

🚀 How to Run
1️⃣ SQL

Run queries from superstore_analysis.sql in PostgreSQL / MySQL / SQLite after creating the superstore database.

2️⃣ Python
jupyter notebook superstore_analysis.ipynb


Dependencies:

pip install pandas matplotlib seaborn plotly

3️⃣ Power BI

Import Superstore.csv into Power BI

Recreate or explore dashboards as shown in the screenshots

📌 Future Improvements

Predictive modeling for sales forecasting and profitability optimization

Customer segmentation with RFM analysis

Integration with real-time sales data streams

Deployment of Power BI dashboards for interactive business use

📷 Dashboard Preview

Executive Summary


Sales Insights


Profit Insights


Discounts & Customer Behavior


⚡ Author: Sahil gaikwad
📅 Date: September 2025
