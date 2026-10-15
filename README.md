# Superstore Sales and Performance Analytics

Retail analytics project combining SQL, Python, and Power BI to explore sales, profitability, customer segments, regions, product categories, and discounts.

## Project components

| File | Purpose |
|---|---|
| `Superstore.csv` | Transaction-line dataset |
| `superstore_analysis.ipynb` | Python EDA |
| `superstore_analysis.sql` | SQL business queries |
| `Superstore Sales Dashboard.pbix` | Power BI dashboard |

## Verified dataset profile

The following counts and aggregates have been recalculated from the repository's current `Superstore.csv`:

| Metric | Result |
|---|---:|
| Rows | 9,994 |
| Columns | 21 |
| Unique orders | 5,009 |
| Unique customers | 793 |
| Unique products | 1,862 |
| Quantity sold | 37,873 |
| Missing cells | None observed across the 21 columns |

## Key results

| KPI | Result |
|---|---:|
| Total sales | $2,297,200.86 |
| Total profit | $286,397.02 |
| Profit margin (profit ÷ sales) | 12.47% |
| Loss-making transaction lines | 1,871 (18.72% of rows) |

### Category and regional observations

- **Technology** recorded $836,154.03 in sales and $145,454.95 in profit (17.40% margin).
- **Furniture** recorded $741,999.80 in sales and $18,451.27 in profit (2.49% margin).
- **West** recorded $725,457.82 in sales and $108,418.45 in profit.
- **Texas** recorded $170,188.05 in sales and a loss of $25,729.36 (−15.12% margin).
- **Tables** recorded a loss of $17,725.48 (−8.56% margin), while **Bookcases** recorded a loss of $3,472.56 (−3.02% margin).

These are descriptive observations from the dataset, not causal claims about why the differences occurred.

## Workflow

1. Profile `Superstore.csv` for data types, missing values, dates, and key identifiers.
2. Inspect notebook cleaning and aggregation steps.
3. Define sales, profit, order count, and margin consistently.
4. Run SQL queries to compare products, regions, segments, and discounts.
5. Open and refresh the Power BI file, then reconcile the report's measures against the CSV aggregates.
6. Review outlier and loss-making line items before suggesting operational action.

## Tech stack

SQL, Python, pandas, Jupyter Notebook, and Power BI.

## Reproduce

- Use Python/Jupyter to run `superstore_analysis.ipynb`.
- Run `superstore_analysis.sql` using the database engine and setup documented in that file.
- Open `Superstore Sales Dashboard.pbix` in Power BI Desktop and verify its source connection.

The CSV aggregates above were recalculated, but the SQL script and Power BI dashboard were not executed or refreshed during this review. Treat dashboard parity as unverified until cross-checking the output.

## Limitations

- The analysis is descriptive and does not prove that discounts caused losses.
- Dataset provenance and redistribution terms should be documented.
- Confirm that SQL and Power BI use the same filters and KPI definitions as the CSV calculations.

## Skills demonstrated

Data cleaning and profiling, sales and profit KPIs, SQL analysis, Python EDA, geographic/product comparisons, and BI reporting.

## Author

Sahil Gaikwad · [GitHub](https://github.com/sahil2003-ai) · [LinkedIn](https://www.linkedin.com/in/sahil-gaikwad-a76b7224a/)
