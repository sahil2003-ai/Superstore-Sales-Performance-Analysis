-- Superstore Sales Analysis (PostgreSQL / psql)
-- Prerequisite: run this script from the repository root, where Superstore.csv exists.
-- The CSV is imported into a raw staging table with its original headers.
-- Run this script only once on a fresh database, or truncate the staging table before re-importing.

CREATE TABLE IF NOT EXISTS superstore_raw (
  "Row ID" INTEGER,
  "Order ID" TEXT,
  "Order Date" TEXT,
  "Ship Date" TEXT,
  "Ship Mode" TEXT,
  "Customer ID" TEXT,
  "Customer Name" TEXT,
  "Segment" TEXT,
  "Country" TEXT,
  "City" TEXT,
  "State" TEXT,
  "Postal Code" INTEGER,
  "Region" TEXT,
  "Product ID" TEXT,
  "Category" TEXT,
  "Sub-Category" TEXT,
  "Product Name" TEXT,
  "Sales" NUMERIC(12,3),
  "Quantity" INTEGER,
  "Discount" NUMERIC(8,4),
  "Profit" NUMERIC(12,4)
);

-- Re-import deterministically so rerunning does not duplicate rows.
TRUNCATE TABLE superstore_raw;
\\copy superstore_raw FROM 'Superstore.csv' WITH (FORMAT csv, HEADER true)

DROP VIEW IF EXISTS ss_dates;
DROP VIEW IF EXISTS ss;

CREATE OR REPLACE VIEW ss AS
SELECT
  "Row ID"        AS row_id,
  "Order ID"      AS order_id,
  "Order Date"    AS order_date_str,
  "Ship Date"     AS ship_date_str,
  "Ship Mode"     AS ship_mode,
  "Customer ID"   AS customer_id,
  "Customer Name" AS customer_name,
  "Segment"       AS segment,
  "Country"       AS country,
  "City"          AS city,
  "State"         AS state,
  "Postal Code"   AS postal_code,
  "Region"        AS region,
  "Product ID"    AS product_id,
  "Category"      AS category,
  "Sub-Category"  AS sub_category,
  "Product Name"  AS product_name,
  "Sales"         AS sales,
  "Quantity"      AS quantity,
  "Discount"      AS discount,
  "Profit"        AS profit
FROM superstore_raw;

CREATE OR REPLACE VIEW ss_dates AS
SELECT
  s.*,
  TO_DATE(order_date_str, 'MM/DD/YYYY') AS order_date,
  TO_DATE(ship_date_str,  'MM/DD/YYYY') AS ship_date
FROM ss s;

SELECT COUNT(*) AS row_count FROM ss;
SELECT * FROM ss LIMIT 5;

/*===============================================================
=            1) Global KPIs                                     
===============================================================*/
-- Total Sales, Profit, Quantity, Orders, Customers, Products
SELECT
  ROUND(SUM(sales), 2)   AS total_sales,
  ROUND(SUM(profit), 2)  AS total_profit,
  SUM(quantity)          AS total_quantity,
  COUNT(DISTINCT order_id)    AS total_orders,
  COUNT(DISTINCT customer_id) AS total_customers,
  COUNT(DISTINCT product_id)  AS unique_products,
  CASE WHEN SUM(sales) = 0 THEN NULL
       ELSE ROUND(SUM(profit) / SUM(sales), 4) END AS profit_margin
FROM ss;

-- Profitability health check (how many rows/orders losing money?)
SELECT
  SUM(CASE WHEN profit < 0 THEN 1 ELSE 0 END) AS loss_rows,
  COUNT(*) AS total_rows,
  ROUND(100.0 * SUM(CASE WHEN profit < 0 THEN 1 ELSE 0 END) / COUNT(*), 2) AS pct_rows_loss
FROM ss;

/*===============================================================
=            2) Region Performance                              =
===============================================================*/
-- Sales & Profit by Region
SELECT
  region,
  ROUND(SUM(sales), 2)   AS sales,
  ROUND(SUM(profit), 2)  AS profit,
  CASE WHEN SUM(sales) = 0 THEN NULL
       ELSE ROUND(SUM(profit) / SUM(sales), 4) END AS profit_margin
FROM ss
GROUP BY region
ORDER BY sales DESC;

/*===============================================================
=            3) Segment Performance                             =
===============================================================*/
SELECT
  segment,
  ROUND(SUM(sales), 2)  AS sales,
  ROUND(SUM(profit), 2) AS profit,
  CASE WHEN SUM(sales) = 0 THEN NULL
       ELSE ROUND(SUM(profit) / SUM(sales), 4) END AS profit_margin
FROM ss
GROUP BY segment
ORDER BY sales DESC;

/*===============================================================
=            4) Category & Sub-Category                         =
===============================================================*/
-- Category-level
SELECT
  category,
  ROUND(SUM(sales), 2)  AS sales,
  ROUND(SUM(profit), 2) AS profit,
  CASE WHEN SUM(sales) = 0 THEN NULL
       ELSE ROUND(SUM(profit) / SUM(sales), 4) END AS profit_margin
FROM ss
GROUP BY category
ORDER BY sales DESC;

-- Sub-Category-level
SELECT
  category,
  sub_category,
  ROUND(SUM(sales), 2)  AS sales,
  ROUND(SUM(profit), 2) AS profit,
  CASE WHEN SUM(sales) = 0 THEN NULL
       ELSE ROUND(SUM(profit) / SUM(sales), 4) END AS profit_margin
FROM ss
GROUP BY category, sub_category
ORDER BY category, sales DESC;

/*===============================================================
=            5) Product Analysis (Top/Bottom)                    =
===============================================================*/
-- Top 10 products by total profit
SELECT
  product_id,
  product_name,
  ROUND(SUM(sales), 2)  AS sales,
  SUM(quantity)         AS quantity,
  ROUND(SUM(profit), 2) AS profit,
  CASE WHEN SUM(sales) = 0 THEN NULL
       ELSE ROUND(SUM(profit) / SUM(sales), 4) END AS profit_margin
FROM ss
GROUP BY product_id, product_name
ORDER BY profit DESC
LIMIT 10;

-- Bottom 10 products by total profit (biggest loss-makers first)
SELECT
  product_id,
  product_name,
  ROUND(SUM(sales), 2)  AS sales,
  SUM(quantity)         AS quantity,
  ROUND(SUM(profit), 2) AS profit,
  CASE WHEN SUM(sales) = 0 THEN NULL
       ELSE ROUND(SUM(profit) / SUM(sales), 4) END AS profit_margin
FROM ss
GROUP BY product_id, product_name
ORDER BY profit ASC
LIMIT 10;

/*===============================================================
=            6) Customer Analysis (Top/Bottom)                   =
===============================================================*/
-- Top 10 customers by profit
SELECT
  customer_id,
  customer_name,
  ROUND(SUM(sales), 2)  AS sales,
  ROUND(SUM(profit), 2) AS profit,
  CASE WHEN SUM(sales) = 0 THEN NULL
       ELSE ROUND(SUM(profit) / SUM(sales), 4) END AS profit_margin
FROM ss
GROUP BY customer_id, customer_name
ORDER BY profit DESC
LIMIT 10;

-- Bottom 10 customers by profit (least profitable / loss-heavy)
SELECT
  customer_id,
  customer_name,
  ROUND(SUM(sales), 2)  AS sales,
  ROUND(SUM(profit), 2) AS profit,
  CASE WHEN SUM(sales) = 0 THEN NULL
       ELSE ROUND(SUM(profit) / SUM(sales), 4) END AS profit_margin
FROM ss
GROUP BY customer_id, customer_name
ORDER BY profit ASC
LIMIT 10;

/*===============================================================
=            7) Ship Mode Performance                            =
===============================================================*/
SELECT
  ship_mode,
  ROUND(SUM(sales), 2)  AS sales,
  ROUND(SUM(profit), 2) AS profit,
  COUNT(DISTINCT order_id) AS orders,
  CASE WHEN SUM(sales) = 0 THEN NULL
       ELSE ROUND(SUM(profit) / SUM(sales), 4) END AS profit_margin
FROM ss
GROUP BY ship_mode
ORDER BY sales DESC;

/*===============================================================
=             8) Geography: Top States & Cities                  =
===============================================================*/
-- Top 10 States by Sales
SELECT
  state,
  ROUND(SUM(sales), 2)  AS sales,
  ROUND(SUM(profit), 2) AS profit,
  CASE WHEN SUM(sales) = 0 THEN NULL
       ELSE ROUND(SUM(profit) / SUM(sales), 4) END AS profit_margin
FROM ss
GROUP BY state
ORDER BY sales DESC
LIMIT 10;

-- Top 10 Cities by Sales
SELECT
  city,
  state,
  ROUND(SUM(sales), 2)  AS sales,
  ROUND(SUM(profit), 2) AS profit,
  CASE WHEN SUM(sales) = 0 THEN NULL
       ELSE ROUND(SUM(profit) / SUM(sales), 4) END AS profit_margin
FROM ss
GROUP BY city, state
ORDER BY sales DESC
LIMIT 10;

/*===============================================================
=            9) Discount Impact                                 =
===============================================================*/
-- Bucket discounts and evaluate profitability
WITH buckets AS (
  SELECT
    CASE
      WHEN discount = 0 THEN '0%'
      WHEN discount > 0 AND discount <= 0.20 THEN '0-20%'
      WHEN discount > 0.20 AND discount <= 0.40 THEN '20-40%'
      ELSE '>40%'
    END AS discount_band,
    sales,
    profit
  FROM ss
)
SELECT
  discount_band,
  ROUND(SUM(sales), 2)  AS sales,
  ROUND(SUM(profit), 2) AS profit,
  CASE WHEN SUM(sales) = 0 THEN NULL
       ELSE ROUND(SUM(profit) / SUM(sales), 4) END AS profit_margin,
  COUNT(*) AS row_count
FROM buckets
GROUP BY discount_band
ORDER BY discount_band;

/*===============================================================
=            10) Loss-making Lines & Orders                      =
===============================================================*/
-- Loss-making order lines (most negative first)
SELECT
  order_id,
  product_name,
  discount,
  ROUND(sales, 2)  AS sales,
  ROUND(profit, 2) AS profit
FROM ss
WHERE profit < 0
ORDER BY profit ASC
LIMIT 20;

-- Loss-making orders aggregated
SELECT
  order_id,
  ROUND(SUM(sales), 2)  AS sales,
  ROUND(SUM(profit), 2) AS profit,
  COUNT(*) AS line_items
FROM ss
GROUP BY order_id
HAVING SUM(profit) < 0
ORDER BY profit ASC
LIMIT 20;

/*===============================================================
=            11) Time Series (Monthly Trend)                     =
===============================================================*/
SELECT
  DATE_TRUNC('month', sd.order_date) AS month,
  ROUND(SUM(sales), 2)  AS sales,
  ROUND(SUM(profit), 2) AS profit,
  CASE WHEN SUM(sales) = 0 THEN NULL
       ELSE ROUND(SUM(profit) / SUM(sales), 4) END AS profit_margin
FROM ss_dates sd
GROUP BY 1
ORDER BY 1;



/*===============================================================
=            12) Extras: Category/Sub-Category Pivot Prep        =
===============================================================*/
SELECT
  category,
  sub_category,
  ROUND(SUM(sales), 2)  AS sales,
  ROUND(SUM(profit), 2) AS profit,
  CASE WHEN SUM(sales) = 0 THEN NULL
       ELSE ROUND(SUM(profit) / SUM(sales), 4) END AS profit_margin
FROM ss
GROUP BY category, sub_category
ORDER BY category, sub_category;

