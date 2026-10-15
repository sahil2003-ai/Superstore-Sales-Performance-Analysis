# Superstore Sales and Performance Analytics

A retail analytics project using SQL, Python, and Power BI to examine sales, profit, customer segments, regions, categories, and discount patterns.

![Python](https://img.shields.io/badge/Python-Analysis-blue) ![SQL](https://img.shields.io/badge/SQL-Analytics-blue) ![Power%20BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811)

## Contents
- [Overview](#overview)
- [Business Questions](#business-questions)
- [Dataset](#dataset)
- [Workflow](#workflow)
- [Results and Metrics](#results-and-metrics)
- [Technology Stack](#technology-stack)
- [Repository Structure](#repository-structure)
- [Run the Project](#run-the-project)
- [Limitations and Next Steps](#limitations-and-next-steps)

## Overview
This project analyzes a Superstore transaction dataset to compare sales and profitability across products, categories, customer segments, and regions. It combines Python EDA, SQL queries, and a Power BI dashboard.

## Business Questions
- How do sales and profit vary across categories and regions?
- Which product groups contribute to sales but show weaker profit?
- How do discounts and customer segments relate to the recorded results?
- Do SQL and Power BI measures reconcile with the source CSV?

## Dataset
Source file: `Superstore.csv`.

| Metric | Value |
|---|---:|
| Rows | 9,994 |
| Columns | 21 |
| Unique orders | 5,009 |
| Unique customers | 793 |
| Unique products | 1,862 |
| Total quantity | 37,873 |
| Missing cells | 0 |

## Workflow
1. Load and profile `Superstore.csv`.
2. Inspect data types, missing values, and key identifiers.
3. Calculate sales, profit, margin, and loss-making line metrics.
4. Compare results across categories, products, segments, and regions.
5. Run the SQL analysis.
6. Refresh the Power BI report and reconcile its measures with CSV calculations.

## Results and Metrics

| Metric | Recalculated result |
|---|---:|
| Total sales | $2,297,200.86 |
| Total profit | $286,397.02 |
| Profit margin (profit ÷ sales) | 12.47% |
| Loss-making transaction lines | 1,871 (18.72% of rows) |
| Technology sales | $836,154.03 |
| Technology profit | $145,454.95 |
| Furniture sales | $741,999.80 |
| Furniture profit | $18,451.27 |
| West region sales | $725,457.82 |
| West region profit | $108,418.45 |
| Texas sales | $170,188.05 |
| Texas profit | −$25,729.36 |
| Tables profit | −$17,725.48 |
| Bookcases profit | −$3,472.56 |

Technology's calculated profit margin is 17.40%; Furniture's is 2.49%. Texas has a calculated profit margin of −15.12%. These findings are descriptive and do not establish why a category or region performed differently.

The figures were recalculated from the CSV. SQL and Power BI were not independently executed/refreshed in this review, so dashboard parity remains unverified.

## Technology Stack
- Python and pandas for data profiling and EDA
- Jupyter Notebook for reproducible analysis
- SQL for grouped business queries
- Power BI for interactive reporting

## Repository Structure
```text
Superstore-Sales-Performance-Analysis/
├── Superstore.csv
├── superstore_analysis.ipynb
├── superstore_analysis.sql
├── Superstore Sales Dashboard.pbix
└── README.md
```

## Run the Project
- Run `superstore_analysis.ipynb` from top to bottom.
- Load `Superstore.csv` into your SQL engine and run `superstore_analysis.sql` after confirming the SQL dialect.
- Open `Superstore Sales Dashboard.pbix` in Power BI Desktop and refresh its source.
- Compare the same date filters and formulas across all tools.

## Limitations and Next Steps
- Document the dataset's original source and license.
- Reconcile SQL and Power BI values against the CSV calculations.
- Add genuine screenshots from the refreshed report.
- Examine discount patterns without assuming that discounts cause losses.
- Include data dictionary and metric definitions.

## Skills Demonstrated
Retail analytics, data cleaning, sales and profit metrics, SQL aggregation, Python EDA, Power BI reporting, and cross-tool validation.

## Author
**Sahil Gaikwad** · [GitHub](https://github.com/sahil2003-ai) · [LinkedIn](https://www.linkedin.com/in/sahil-gaikwad-a76b7224a/)
