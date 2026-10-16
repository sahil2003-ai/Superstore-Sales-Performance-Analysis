# Superstore Sales & Performance Analytics

An end-to-end retail analytics project exploring sales, profit, orders, customer segments, products, discounts and regional performance using **Python, SQL and Power BI**. The repository includes the source CSV, an exploratory Jupyter notebook, a PostgreSQL-oriented SQL analysis script and a Power BI dashboard.

<p align="left">
  <img src="https://img.shields.io/badge/Python-pandas%20%7C%20EDA-3776AB?logo=python&logoColor=white" alt="Python and pandas" />
  <img src="https://img.shields.io/badge/SQL-PostgreSQL-336791?logo=postgresql&logoColor=white" alt="SQL PostgreSQL" />
  <img src="https://img.shields.io/badge/BI-Power%20BI-F2C811?logo=powerbi&logoColor=black" alt="Power BI" />
  <img src="https://img.shields.io/badge/Notebook-Jupyter-F37626?logo=jupyter&logoColor=white" alt="Jupyter Notebook" />
</p>

## Project overview

This project turns transaction-level Superstore records into business-facing analysis. It examines how sales and profitability differ by category, sub-category, region, customer segment, product, ship mode and discount level. The goal is to identify where revenue is concentrated, where profits are comparatively weak, and which questions a business team could investigate further.

### At a glance

| Component | Included in this repository |
|---|---|
| Source data | `Superstore.csv` |
| Python analysis | `superstore_analysis.ipynb` |
| SQL business queries | `superstore_analysis.sql` |
| Dashboard | `Superstore Sales Dashboard.pbix` |
| Analysis topics | Sales, profit, margin, orders, customers, products, geography, discounts and trends |

## Dataset

**File:** [`Superstore.csv`](Superstore.csv)

The notebook reads this file with the `ISO-8859-1` encoding. The existing profiling output reports **9,994 rows and 21 columns**, with no missing values in the inspected fields.

| Dataset metric | Value |
|---|---:|
| Transaction rows | 9,994 |
| Columns | 21 |
| Unique orders | 5,009 |
| Unique customers | 793 |
| Unique products | 1,862 |
| Total quantity sold | 37,873 |
| Missing cells in the notebook's profile | 0 |
| Distinct regions | 4 |
| Product categories | 3 |
| Product sub-categories | 17 |
| Order-date unique values | 1,237 |

### Main fields

| Field | Meaning |
|---|---|
| `Row ID` | Row-level identifier |
| `Order ID` | Order identifier |
| `Order Date`, `Ship Date` | Order and shipment dates |
| `Ship Mode` | Shipping method |
| `Customer ID`, `Customer Name` | Customer identifiers and names |
| `Segment` | Customer segment |
| `Country`, `City`, `State`, `Postal Code`, `Region` | Geographic dimensions |
| `Product ID`, `Product Name` | Product identifiers and descriptions |
| `Category`, `Sub-Category` | Product hierarchy |
| `Sales` | Recorded sales amount |
| `Quantity` | Units per line |
| `Discount` | Recorded discount |
| `Profit` | Recorded profit or loss |

## Key results

The metrics below are based on the existing notebook output and the README's CSV-recalculated figures. They are descriptive summaries of this dataset, not proof that a particular business factor caused a result.

### Overall performance

| Metric | Result |
|---|---:|
| Total sales | **$2,297,200.86** |
| Total profit | **$286,397.02** |
| Overall profit margin (profit ÷ sales) | **12.47%** |
| Total quantity sold | **37,873** |
| Unique orders | **5,009** |
| Unique customers | **793** |
| Unique products | **1,862** |
| Loss-making transaction lines | **1,871 (18.72% of rows)** |

**Metric definition:** overall profit margin is calculated as total profit divided by total sales. “Loss-making transaction lines” counts individual rows with negative recorded profit; it does not count distinct loss-making orders.

### Sales and profit by category

| Category | Sales | Profit | Approx. profit margin |
|---|---:|---:|---:|
| Technology | $836,154.03 | $145,454.95 | 17.40% |
| Furniture | $741,999.80 | $18,451.27 | 2.49% |
| Office Supplies | $719,047.03 | $122,490.80 | 17.04% |

**Observation:** Technology has the highest recorded sales and profit among the three categories. Furniture has substantial sales but a much lower profit margin than Technology and Office Supplies, making it a useful area for more detailed sub-category and discount analysis.

### Regional performance

| Region | Sales | Profit | Approx. profit margin |
|---|---:|---:|---:|
| West | $725,457.82 | $108,418.45 | 14.94% |
| East | $678,781.24 | $91,522.78 | 13.49% |
| Central | $501,239.89 | $39,706.36 | 7.92% |
| South | $391,721.91 | $46,749.43 | 11.93% |

**Observation:** The West region leads the provided regional summary in both sales and profit. The Central region has the lowest profit margin in this comparison and could warrant deeper review by product mix, discounting and order characteristics.

### Examples of profitability risks

| Segment | Sales | Profit | Approx. margin |
|---|---:|---:|---:|
| Furniture | $741,999.80 | $18,451.27 | 2.49% |
| Texas | $170,188.05 | -$25,729.36 | -15.12% |
| Tables sub-category | — | -$17,725.48 | — |
| Bookcases sub-category | — | -$3,472.56 | — |

These are starting points for investigation, not recommendations to immediately change prices or discontinue products. Further analysis should account for order mix, discount levels, product costs, seasonality and other potential explanations.

## Analysis workflow

1. **Load and profile data** — inspect shape, data types, summary statistics and missing values.
2. **Explore distributions** — examine sales and profit distributions and category-level performance.
3. **Compare business dimensions** — aggregate sales and profit by category and region.
4. **Query with SQL** — build repeatable summaries for categories, sub-categories, products, customers, shipping modes, locations, discounts and dates.
5. **Report with Power BI** — use the included `.pbix` file to explore the business measures interactively.
6. **Validate definitions** — compare the same formulas, filters and date handling between Python, SQL and Power BI.

## Python analysis

Notebook: [`superstore_analysis.ipynb`](superstore_analysis.ipynb)

The existing notebook covers:

- Dataset loading and dimensionality check
- Data types, null-value profiling and descriptive statistics
- Sales and profit distributions
- Sales/profit totals by category
- Sales/profit totals by region
- Tabular summary outputs to support interpretation

Libraries used in the notebook include **pandas**, **Matplotlib** and **Seaborn**. The notebook also imports `sqlite3`; the SQL file in the repository is written for PostgreSQL/psql, so use the SQL script with a compatible PostgreSQL setup rather than assuming it is SQLite syntax.

## SQL analysis

Script: [`superstore_analysis.sql`](superstore_analysis.sql)

The SQL script is designed around a raw staging table and views that rename columns and parse order/ship dates. It includes business queries for:

- Global KPIs: sales, profit, quantity, distinct orders, customers, products and profit margin
- Counts and percentages of loss-making transaction rows
- Region and customer-segment performance
- Category and sub-category profitability
- Top and bottom products by profit
- Top and bottom customers by profit
- Shipping-mode performance
- State and city comparisons
- Profitability by discount band
- Negative-profit line items and loss-making orders
- Monthly sales, profit and margin trends

### SQL setup notes

The file uses PostgreSQL-specific constructs such as `\\copy`, `TO_DATE`, `DATE_TRUNC`, and `CREATE OR REPLACE VIEW`. Run it from a PostgreSQL/psql environment and confirm the working directory and CSV path before loading. The script truncates its staging table before import, so do not point it at a production table with data you need to preserve.

**Validation status:** the metrics presented in this README were taken from saved notebook outputs and the project's CSV-level calculations. I have not independently executed this SQL script against a live PostgreSQL database or refreshed the Power BI file during this review.

## Power BI dashboard

Dashboard file: [`Superstore Sales Dashboard.pbix`](Superstore%20Sales%20Dashboard.pbix)

The Power BI report is included as a native `.pbix` artifact for review in Power BI Desktop. Refresh it against the intended CSV/data source and verify the relationships, filters, date table and measure definitions before treating its displayed results as reconciled with the Python figures.

**Screenshots:** The repository currently contains the CSV, notebook, SQL script and `.pbix` dashboard file, but no separate dashboard screenshots or image directory. GitHub cannot render the `.pbix` binary as an inline picture, so this README does not embed fabricated or unrelated screenshots. To add visual previews, export screenshots from the refreshed report to an `images/` folder and reference those files here.

## Repository structure

```text
Superstore-Sales-Performance-Analysis/
├── Superstore.csv
├── superstore_analysis.ipynb
├── superstore_analysis.sql
├── Superstore Sales Dashboard.pbix
└── README.md
```

## Run the project

### 1. Clone the repository

```bash
git clone https://github.com/sahil2003-ai/Superstore-Sales-Performance-Analysis.git
cd Superstore-Sales-Performance-Analysis
```

### 2. Install Python dependencies

Create a virtual environment, then install the libraries used in the notebook:

```bash
python -m venv .venv
```

Activate it:

```bash
# Windows PowerShell
.venv\\Scripts\\Activate.ps1

# macOS / Linux
source .venv/bin/activate
```

Install packages:

```bash
pip install pandas matplotlib seaborn jupyter
```

### 3. Run the notebook

```bash
jupyter notebook superstore_analysis.ipynb
```

Run cells from top to bottom. Keep `Superstore.csv` in the repository root, since the notebook loads that relative path.

### 4. Run the SQL analysis

Use a PostgreSQL database and psql. Create/select a project database, ensure `Superstore.csv` is accessible to the psql client from the working directory, and then execute the SQL script:

```bash
psql -d your_database_name -f superstore_analysis.sql
```

The script creates and truncates the `superstore_raw` staging table and builds views for analysis. Review the SQL header comments and database permissions before execution.

### 5. Open Power BI

Open `Superstore Sales Dashboard.pbix` in Power BI Desktop, set the correct data source if prompted, refresh the report and validate totals against the CSV.

## Limitations and next steps

- Document the original dataset source and its license/provenance.
- Add exported screenshots of each Power BI page so the repository can show a visual preview.
- Reconcile Power BI measures and SQL results against the same CSV, with matching filters and formulas.
- Add monthly trend results and top/bottom product/customer tables to the report after running the latest analysis.
- Examine whether discount patterns vary by category and sub-category; association alone does not prove discounts caused losses.
- Add a data dictionary and documented definitions for each KPI.
- Add a reproducible environment file with pinned versions of Python packages.
- Automate data quality checks for missing values, unique IDs and unexpected categories.

## Skills demonstrated

**Data analytics:** data profiling, exploratory data analysis, KPI calculation, profitability analysis, trend exploration  
**SQL:** PostgreSQL, views, aggregation, CASE statements, date parsing, CTEs, business queries  
**Python:** pandas, Matplotlib, Seaborn, Jupyter Notebook  
**BI & reporting:** Power BI, business metrics, dashboard validation, insight communication

## Author

**Sahil Gaikwad**  
[GitHub](https://github.com/sahil2003-ai) · [LinkedIn](https://www.linkedin.com/in/sahil-gaikwad-a76b7224a/)
