# 🏬 Superstore Sales & Performance Analytics

> A comprehensive retail analytics project uncovering sales trends, profitability insights, customer behavior patterns, and discount impacts using SQL, Python, and Power BI dashboards.

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Python](https://img.shields.io/badge/python-3.8+-blue.svg)](https://www.python.org/)
[![SQL](https://img.shields.io/badge/SQL-MySQL%2FPostgreSQL-orange.svg)](#)
[![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow.svg)](#)

## 📋 Overview

This project provides an end-to-end analysis of superstore retail data using a **multi-tool approach**. By combining **SQL analytics**, **Python data science**, and **Power BI visualizations**, this project delivers actionable insights into sales performance, profitability drivers, and opportunities for optimization.

### Key Metrics
- **Dataset Records**: 9,994 retail transactions
- **Customers Analyzed**: 793 unique customers
- **Products Tracked**: 1,850+ product variants
- **Regions Covered**: 50+ states, 4 major regions
- **Segments**: Consumer, Corporate, Home Office

## 🗂️ Project Structure

```
Superstore-Sales-Performance-Analysis/
├── Superstore.csv                    # Raw dataset (9,994 transaction records)
├── superstore_analysis.ipynb         # Python analysis with EDA & visualizations
├── superstore_analysis.sql           # SQL queries for KPIs and business insights
├── Superstore Sales Dashboard.pbix  # Power BI dashboard with 4 interactive pages
└── README.md                         # Project documentation
```

## 📊 Dataset Overview

The dataset contains **9,994 transaction records** with **21 features** covering complete retail operations:

| Column | Description | Type |
|--------|-------------|------|
| **Order ID** | Unique transaction identifier | String |
| **Order Date** | Transaction date | Date |
| **Ship Date** | Delivery date | Date |
| **Ship Mode** | Shipping method (Standard, Second Class, etc.) | Categorical |
| **Customer ID** | Unique customer identifier | String |
| **Customer Name** | Customer name | String |
| **Segment** | Customer segment (Consumer, Corporate, Home Office) | Categorical |
| **Country / Region / State / City** | Geographic location | Categorical |
| **Product ID** | Unique product identifier | String |
| **Product Name** | Product description | String |
| **Category** | Product category (Furniture, Office Supplies, Technology) | Categorical |
| **Sub-Category** | Product subcategory (Tables, Chairs, Phones, etc.) | Categorical |
| **Sales** | Transaction revenue (USD) | Numeric |
| **Quantity** | Units sold | Integer |
| **Discount** | Discount percentage applied | Numeric |
| **Profit** | Net profit (Sales - Cost) | Numeric |

## 🔍 Key Findings & Business Insights

### 1. **Sales Performance by Category**
- **Technology**: Highest revenue driver (~$828K)
- **Furniture**: Mid-tier performer (~$742K)
- **Office Supplies**: Steady volume (~$719K)
- **Insight**: Technology shows highest profit margins despite lower volume than Office Supplies.

### 2. **Regional Performance Analysis**
- **West Region**: Strongest performer (~25% of total sales)
- **East Region**: Second largest (~23%)
- **Central & South**: Growing markets with optimization opportunities
- **Insight**: Geographic expansion in emerging regions can boost overall profitability.

### 3. **Customer Segmentation Trends**
- **Consumer**: 50.1% of transactions (high volume, lower margin)
- **Corporate**: 32.5% of transactions (stable, medium margin)
- **Home Office**: 17.4% of transactions (low volume, growing segment)
- **Insight**: Home Office segment shows highest growth potential and profitability.

### 4. **Discount Impact on Profitability**
- **No Discount**: ~15% average profit margin
- **5-10% Discount**: ~12% average profit margin
- **20%+ Discount**: ~2% average profit margin or losses
- **Insight**: Aggressive discounting erodes profitability significantly; selective discounting recommended.

### 5. **Shipping Mode Efficiency**
- **Standard Class**: Most popular (59% of orders), ~7 days average
- **Second Class**: 19% of orders, ~4 days average
- **First Class**: 15% of orders, ~2 days average
- **Same Day**: 7% of orders, premium pricing opportunity
- **Insight**: Standard Class has best cost efficiency; premium shipping underutilized.

### 6. **Product Profitability**
- **Top Profit Products**: Copiers, Machines, Chairs
- **Loss-Making Products**: Tables, Binders, Fasteners (~40% loss rate)
- **Insight**: Product portfolio optimization critical; consider discontinuing or repricing loss-makers.

## 📈 SQL Analysis (`superstore_analysis.sql`)

Comprehensive SQL queries covering:

### Global KPIs
```sql
-- Total Sales, Profit, Orders, Customers, Products, Profit Margin
SELECT 
  ROUND(SUM(Sales), 2) as total_sales,
  ROUND(SUM(Profit), 2) as total_profit,
  ROUND(SUM(Profit) / SUM(Sales) * 100, 2) as profit_margin
FROM superstore;
```

### Regional Performance
- Sales & profit by region, state, city
- Regional growth analysis
- Top performing states

### Segment Analysis
- Consumer, Corporate, Home Office performance
- Segment-wise profitability
- Customer lifetime value by segment

### Category & Product Analysis
- Top/bottom 10 products by profit
- Category profitability trends
- Product recommendation engine data

### Customer Analytics
- Top/bottom customers by profit
- Customer concentration risk
- Repeat purchase analysis

### Discount & Margin Impact
- Profitability by discount band
- Loss-making transactions
- Margin compression analysis

### Time Series Analysis
- Monthly sales & profit trends
- Seasonal patterns
- Year-over-year growth

**Total Queries**: 15+ comprehensive analytical queries

## 🐍 Python Analysis (`superstore_analysis.ipynb`)

### Analysis Pipeline

1. **Data Loading & Preprocessing**
   - Load Superstore.csv (9,994 records)
   - Data type conversion (dates, numerics)
   - Missing value handling
   - Outlier detection and treatment

2. **Exploratory Data Analysis (EDA)**
   - Statistical summaries (mean, median, std dev)
   - Distribution analysis
   - Correlation matrix (sales, profit, discount)
   - Missing data assessment

3. **Sales Analysis**
   - Sales trends over time
   - Seasonal pattern identification
   - Category performance comparison
   - Regional sales breakdown

4. **Profitability Study**
   - Profit margin analysis by category
   - Customer profitability segmentation
   - Discount sensitivity analysis
   - Loss-making product identification

5. **Customer Behavior**
   - Customer segmentation (K-means clustering)
   - RFM analysis (Recency, Frequency, Monetary)
   - Customer lifetime value prediction
   - Churn risk indicators

6. **Visualizations**
   - Time series plots (sales, profit trends)
   - Categorical comparisons (bar, box plots)
   - Scatter plots (discount vs profit)
   - Heatmaps (correlation matrix)
   - Geographic visualizations (state-level analysis)

### Required Libraries
```bash
pip install pandas numpy matplotlib seaborn plotly scikit-learn jupyter
```

## 📨 Power BI Dashboard (`Superstore Sales Dashboard.pbix`)

### Dashboard Pages

**Page 1: Executive Summary**
- Key Performance Indicators (KPIs)
- Total Sales, Profit, Orders, Customer Count
- Monthly Sales Trend Chart
- Top 10 Customers by Revenue
- Sales Distribution by Segment

**Page 2: Sales Insights**
- Sales by Geographic Region (map visualization)
- Sales by State & City (top performers)
- Shipping Mode Performance
- Top 15 Products by Revenue
- Sales Trend with Forecast

**Page 3: Profit Insights**
- Profit by Segment (pie chart)
- Profit by Category & Sub-Category
- Top & Bottom 10 Products by Profit
- Profit Margin by Category
- Profit Trend Analysis

**Page 4: Discounts & Customer Behavior**
- Discount Trend Over Time
- Discount vs. Profit Correlation
- Top Customers (with discount info)
- Discount Distribution Analysis
- Customer Segment Comparison

### Interactive Features
- Slicers for Year, Region, Segment, Category
- Drill-down capabilities
- Hover tooltips with detailed metrics
- Dynamic filtering across all visuals

## 🚀 How to Run

### Option 1: SQL Analysis
```sql
-- Create database
CREATE DATABASE superstore_db;
USE superstore_db;

-- Import data
LOAD DATA INFILE 'Superstore.csv' INTO TABLE superstore
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

-- Run analysis queries
SOURCE superstore_analysis.sql;
```

### Option 2: Python Analysis (Jupyter Notebook)
```bash
# Install dependencies
pip install pandas numpy matplotlib seaborn plotly scikit-learn

# Launch Jupyter
jupyter notebook superstore_analysis.ipynb

# Run all cells for complete analysis
```

### Option 3: Power BI Dashboard
```
1. Open Superstore Sales Dashboard.pbix in Power BI Desktop
2. Click "Transform Data" to refresh connections
3. Navigate through dashboard pages
4. Use slicers to filter by Region, Segment, Category
5. Export reports as needed
```

## 💡 Business Recommendations

### 1. **Optimize Discount Strategy**
   - Implement tiered discounting based on customer segment
   - Reduce discounts on high-margin products (Copiers, Machines)
   - Use strategic discounts for volume growth, not profitability

### 2. **Product Portfolio Management**
   - Discontinue or reprice loss-making items (Tables, Binders, Fasteners)
   - Expand Technology and Furniture categories
   - Cross-sell opportunities in profitable sub-categories

### 3. **Regional Expansion**
   - Increase investment in West & East regions (proven performers)
   - Develop market penetration strategy for Central & South regions
   - Geographic targeting for Home Office segment growth

### 4. **Customer Retention**
   - Focus on Corporate segment (highest profit)
   - Develop Home Office segment (fastest growth)
   - Implement loyalty programs for repeat customers

### 5. **Shipping Optimization**
   - Promote Same Day & First Class for premium customers
   - Optimize Standard Class costs through logistics partnerships
   - Leverage shipping mode data for delivery time SLAs

## 📁 File Descriptions

| File | Size | Purpose |
|------|------|----------|
| `Superstore.csv` | ~1.5 MB | Raw transaction dataset (9,994 rows) |
| `superstore_analysis.ipynb` | ~2.5 MB | Jupyter notebook with Python EDA & ML |
| `superstore_analysis.sql` | ~25 KB | 15+ SQL queries for KPI analysis |
| `Superstore Sales Dashboard.pbix` | ~5 MB | Power BI dashboard with 4 pages |
| `README.md` | This file | Complete project documentation |

## 🛠️ Tools & Technologies

| Category | Tools |
|----------|-------|
| **Data Processing** | Python (Pandas, NumPy) |
| **Data Visualization** | Matplotlib, Seaborn, Plotly, Power BI |
| **Database** | SQL (MySQL, PostgreSQL, SQLite) |
| **Machine Learning** | Scikit-learn (clustering, classification) |
| **Analysis Platform** | Jupyter Notebook |
| **BI/Reporting** | Microsoft Power BI |
| **Data Format** | CSV, XLSX |

## 📊 Performance Metrics

- **Overall Profit Margin**: ~13%
- **Average Order Value**: ~$230
- **Customer Retention**: Variable by segment
- **Top Region Performance**: West (~$725K sales)
- **Discount Impact**: -3% profit margin per 10% discount
- **Loss Rate**: ~11% of orders operate at loss

## 🎯 Future Enhancements

- [ ] Predictive sales forecasting with ARIMA/Prophet
- [ ] Customer churn prediction model
- [ ] Dynamic pricing optimization algorithm
- [ ] Inventory management optimization
- [ ] Real-time dashboard with API integration
- [ ] RFM segmentation with automated targeting
- [ ] Supply chain cost analysis
- [ ] Market basket analysis for cross-selling

## 📝 License

MIT License - Feel free to use this project for personal and commercial purposes.

## 👤 Author

**Sahil Gaikwad**
- GitHub: [@sahil2003-ai](https://github.com/sahil2003-ai)
- LinkedIn: [Sahil Gaikwad](https://linkedin.com)
- Portfolio: [Data Science Projects](https://github.com/sahil2003-ai)

## 🙏 Acknowledgments

- Dataset: Superstore Sales Dataset
- Tools: Python, SQL, Power BI
- Inspiration: Retail analytics best practices

## ⭐ Show Your Support

If this project helped you with your analytics work, please consider giving it a **star**! Your support motivates me to create more comprehensive projects.

---

**Last Updated**: January 2026 | **Version**: 2.0 | **Status**: Active Development
