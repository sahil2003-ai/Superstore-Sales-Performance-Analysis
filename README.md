# Superstore Sales and Performance Analytics

> Retail analytics project combining SQL, Python, and Power BI to explore sales, profitability, customer segments, regions, and discounts.

![Status](https://img.shields.io/badge/Status-Portfolio--Project-blue)

## 📌 Table of Contents

- [Overview](#overview)
- [Problem Statement](#problem-statement)
- [Objectives](#objectives)
- [Features](#features)
- [Dataset](#dataset)
- [Tech Stack](#tech-stack)
- [Project Workflow](#project-workflow)
- [Repository Structure](#repository-structure)
- [Installation](#installation)
- [Usage](#usage)
- [Results and Insights](#results-and-insights)
- [Screenshots](#screenshots)
- [Challenges and Solutions](#challenges-and-solutions)
- [Limitations](#limitations)
- [Future Improvements](#future-improvements)
- [What I Learned](#what-i-learned)
- [Author](#author)
- [License](#license)

## 📖 Overview

Retail analytics project combining SQL, Python, and Power BI to explore sales, profitability, customer segments, regions, and discounts. This README documents the intended workflow and the files available in the repository. Verify all outputs against the current code and data before using them as evidence.

## 🎯 Problem Statement

Retail stakeholders need reliable measures to compare performance across products, regions, and customer groups.

## 🎯 Objectives

- Validate retail data and KPI definitions.
- Analyze sales and profitability patterns.
- Communicate verified findings through a Power BI dashboard.

## ✨ Features

- Superstore.csv dataset.
- SQL analysis and Python notebook.
- Power BI dashboard in PBIX format.

## 📂 Dataset

I recalculated the figures below directly from the repository's `Superstore.csv` contents.

| Dataset check | Recalculated result |
|---|---:|
| Rows | 9,994 |
| Columns | 21 |
| Non-empty cells | All 21 columns have values in all 9,994 rows |
| Unique orders | 5,009 |
| Unique customers | 793 |
| Unique products | 1,862 |
| Quantity sold | 37,873 |

**Fields:** order/customer details, order and ship dates, shipping mode, geography, product/category, sales, quantity, discount, and profit. This is a descriptive analysis; there is no modelling target.

**Source/license:** Document the original dataset publisher and reuse terms before redistributing the CSV.

## 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| SQL | Business queries and grouped metrics |
| Python/pandas | EDA and validation |
| Power BI | Interactive dashboard |
| Jupyter Notebook | Analysis |

## 🔄 Project Workflow

1. Inspect Superstore.csv for data types, dates, missing values, and duplicates.
2. Review superstore_analysis.ipynb and validate the cleaning steps.
3. Define sales, profit, order count, and margin formulas clearly.
4. Run superstore_analysis.sql to compare products, regions, segments, and discounts.
5. Open Superstore Sales Dashboard.pbix and verify filters, measures, and data connection.
6. Cross-check key metrics across SQL, Python, and Power BI.
7. Write three to five findings tied to reproducible evidence.

## 🗂️ Repository Structure

```text
Superstore-Sales-Performance-Analysis/
├── Superstore.csv
├── superstore_analysis.ipynb
├── superstore_analysis.sql
└── Superstore Sales Dashboard.pbix
└── README.md
```

The list above highlights known project files and folders; inspect the repository for the complete current structure.

## ⚙️ Installation

### Prerequisites

- Install the tools listed in the Tech Stack that apply to this project.
- For Python projects, use a Python version compatible with the dependencies actually imported by the code.
- For Power BI projects, use Power BI Desktop.

### Setup

Requires a SQL engine compatible with the query file, Python/Jupyter with notebook dependencies, and Power BI Desktop. Check notebook imports before installing packages.

Do not run generic commands that do not match the files in this repository. Confirm the data paths, database dialect, and package versions before execution.

## ▶️ Usage

Run SQL and notebook after confirming paths and schema; open the PBIX in Power BI Desktop and refresh its data.

## 📊 Results and Insights

### Recalculated business KPIs

These values were recalculated directly from the current CSV, rather than copied from notebook output.

| KPI | Result |
|---|---:|
| Total sales | $2,297,200.86 |
| Total profit | $286,397.02 |
| Profit margin (total profit ÷ total sales) | 12.47% |
| Quantity sold | 37,873 |
| Distinct orders | 5,009 |
| Distinct customers | 793 |
| Distinct products | 1,862 |
| Loss-making order lines | 1,871 (18.72% of rows) |

### Findings

- **Technology** generated the highest category sales ($836,154.03) and profit ($145,454.95), with a 17.40% margin.
- **Furniture** generated $741,999.80 in sales but only $18,451.27 profit, a 2.49% margin.
- **West** led regional sales ($725,457.82) and profit ($108,418.45); **Central** had the lowest regional margin at 7.92%.
- **Texas** had $170,188.05 in sales but a loss of $25,729.36 (−15.12% margin).
- The **Tables** sub-category lost $17,725.48 (−8.56% margin); **Bookcases** lost $3,472.56 (−3.02% margin).

These are descriptive patterns in this dataset, not causal claims. The product/customer-level aggregates use the dataset's recorded sales and profit fields.

### SQL repair and validation status

The SQL script has been repaired to use PostgreSQL consistently, create a `superstore_raw` staging table, import `Superstore.csv` with a `psql \\copy` command, and build the normalized `ss` view from the staging table instead of incorrectly selecting from itself. It truncates the staging table before reimporting, so rerunning it does not append duplicate rows. Run it from the repository root against an existing PostgreSQL database: `psql -d YOUR_DATABASE -f superstore_analysis.sql`.

The CSV metrics above have been independently recalculated, but the SQL script has **not** been executed against a live PostgreSQL instance in this review. After importing the CSV, compare the SQL KPI output to this table as the final cross-check.

## 🖼️ Screenshots

No image files were confirmed for this repository during this update. If you have screenshots, upload them into an `images/` folder, then embed each real path here with a short caption. Do not use placeholder image paths.

## 🧩 Challenges and Solutions

| Challenge | Solution / validation approach |
|---|---|
| Consistent KPI definitions across tools | Document formulas and reconcile key totals between SQL, Python, and Power BI. |

## ⚠️ Limitations

- CSV aggregations were recalculated directly, but SQL execution against PostgreSQL has not yet been independently run.
- The analysis is descriptive and cannot establish that discounts caused losses.
- The source dataset publisher/license should be documented.
- Reconcile Power BI measures with the recalculated KPI table before claiming dashboard parity.

## 🚀 Future Improvements

- [ ] Add dashboard screenshots and data provenance.
- [ ] Document KPI definitions and query explanations.
- [ ] Publish verified insights and data-quality checks.

## 📚 What I Learned

- Retail KPI design and profitability analysis.
- Cross-validation of analytical outputs.

## 👤 Author

**Sahil Gaikwad**

- GitHub: [sahil2003-ai](https://github.com/sahil2003-ai)
- LinkedIn: [Sahil Gaikwad](https://www.linkedin.com/in/sahil-gaikwad-a76b7224a/)

## 📄 License

Check dataset terms and repository license before redistribution.
