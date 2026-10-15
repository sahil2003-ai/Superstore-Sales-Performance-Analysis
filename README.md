# Superstore Sales and Performance Analytics

> A retail analytics project using SQL, Python, and Power BI to examine sales, profit, customer segments, regions, categories, and discount patterns.

![Python](https://img.shields.io/badge/Python-Analysis-blue)
![SQL](https://img.shields.io/badge/SQL-Analytics-blue)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow)

## 📌 Table of Contents

- [Overview](#-overview)
- [Problem Statement](#-problem-statement)
- [Objectives](#-objectives)
- [Features](#-features)
- [Dataset](#-dataset)
- [Tech Stack](#-tech-stack)
- [Project Workflow](#-project-workflow)
- [Repository Structure](#-repository-structure)
- [Installation](#-installation)
- [Usage](#-usage)
- [Results and Insights](#-results-and-insights)
- [Screenshots](#-screenshots)
- [Challenges and Solutions](#-challenges-and-solutions)
- [Limitations](#-limitations)
- [Future Improvements](#-future-improvements)
- [What I Learned](#-what-i-learned)
- [Author](#-author)
- [License](#-license)

## 📖 Overview

This project explores a Superstore retail transaction dataset and calculates sales and profitability metrics across products, categories, customer segments, and geography. It combines Python EDA, SQL queries, and a Power BI dashboard.

## 🎯 Problem Statement

Sales volume alone does not show whether a business is profitable. Retail teams need consistent measures of revenue, profit, margin, and loss-making transactions to identify where further investigation is warranted.

## 🎯 Objectives

- Profile the data and validate record quality.
- Calculate sales, profit, and profit margin.
- Compare product, category, region, and customer-segment performance.
- Reconcile Python, SQL, and Power BI metrics.

## ✨ Features

- Dataset profiling and descriptive analysis.
- Sales and profit aggregation by category and geography.
- Identification of loss-making transaction lines and products.
- Dashboard-based reporting with cross-tool validation as a follow-up task.

## 📂 Dataset

Source file: `Superstore.csv`.

| Metric | Verified value |
|---|---:|
| Rows | 9,994 |
| Columns | 21 |
| Unique orders | 5,009 |
| Unique customers | 793 |
| Unique products | 1,862 |
| Total quantity | 37,873 |
| Missing cells | 0 |

The dataset contains transaction dates, customer/order identifiers, geographic dimensions, product information, quantity, sales, discounts, and profit. Dataset source URL and reuse terms should be documented before redistribution.

## 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| Python / pandas | Data profiling and EDA |
| SQL | Grouped business queries |
| Jupyter Notebook | Reproducible analysis |
| Power BI | Interactive reporting |

## 🔄 Project Workflow

1. Load and profile `Superstore.csv`.
2. Inspect data types, missing values, and key identifiers.
3. Calculate sales, profit, margin, and loss-line metrics.
4. Compare results across categories, products, and regions.
5. Review SQL query definitions.
6. Refresh the Power BI report and reconcile its measures with the CSV calculations.

## 🗂️ Repository Structure

```text
Superstore-Sales-Performance-Analysis/
├── Superstore.csv
├── superstore_analysis.ipynb
├── superstore_analysis.sql
├── Superstore Sales Dashboard.pbix
└── README.md
```

## ⚙️ Installation

### Prerequisites

- Python and Jupyter Notebook
- SQL database compatible with the script
- Power BI Desktop for the PBIX report

### Setup

```bash
git clone https://github.com/sahil2003-ai/Superstore-Sales-Performance-Analysis.git
cd Superstore-Sales-Performance-Analysis
python -m venv .venv
```

Activate the environment and install pandas plus the libraries imported by the notebook. A root-level `requirements.txt` was not identified in the repository inventory.

## ▶️ Usage

- Open and run `superstore_analysis.ipynb` from top to bottom.
- Load the CSV into your SQL engine and execute `superstore_analysis.sql` after confirming its dialect.
- Open `Superstore Sales Dashboard.pbix` in Power BI Desktop and refresh its data source.

## 📊 Results and Insights

### Key Findings

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

Technology's calculated profit margin is 17.40%; Furniture's is 2.49%. Texas has a calculated profit margin of −15.12%. These are descriptive findings and do not establish why a category or region performed differently.

### Evaluation

The figures above were recalculated from the current CSV. SQL and Power BI were not independently executed/refreshed in this review, so dashboard parity remains unverified.

## 🖼️ Screenshots

The repository includes a Power BI report file. A rendered screenshot was not independently validated here; add screenshots captured from the actual report pages.

## 🧩 Challenges and Solutions

| Challenge | Approach |
|---|---|
| Sales and profit can be confused | Define margin as total profit divided by total sales |
| Loss-making records can be overlooked by aggregate totals | Examine transaction lines and product-level aggregates |
| Results can differ between tools | Reconcile filters, date ranges, and formulas across Python, SQL, and Power BI |

## ⚠️ Limitations

- The analysis is descriptive; it does not prove discounts cause losses.
- Power BI and SQL outputs need reconciliation with the recalculated CSV values.
- Dataset provenance and license should be recorded.

## 🚀 Future Improvements

- [ ] Validate SQL results against the Python metrics.
- [ ] Refresh and reconcile every Power BI measure.
- [ ] Add screenshots and a concise executive summary.
- [ ] Investigate discount, shipping, and product interactions without making causal claims.

## 📚 What I Learned

- Building consistent business KPIs from transaction-level data.
- Combining SQL, Python, and BI reporting.
- Interpreting profitability alongside sales volume.
- Communicating descriptive findings without overstating causality.

## 👤 Author

**Sahil Gaikwad**

- GitHub: [sahil2003-ai](https://github.com/sahil2003-ai)
- LinkedIn: [Sahil Gaikwad](https://www.linkedin.com/in/sahil-gaikwad-a76b7224a/)

## 📄 License

Check the repository for its actual license and document the dataset's original source and reuse terms before redistribution.
