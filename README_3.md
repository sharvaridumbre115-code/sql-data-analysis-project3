# SQL Data Analysis — E-Commerce Orders

**Project 3 — Data Analytics Internship, DecodeLabs**
By Sharvari Dumbre

## What this is

For Project 3, I used SQL to query the same e-commerce order dataset from Project 2 — this time focused on writing structured queries instead of using pandas functions. The goal was to filter, group, and aggregate raw order data into business-relevant answers using SQL fundamentals.

## Dataset

1,200 orders, 14 columns (same dataset as Project 2) — loaded into a SQLite database using pandas (`df.to_sql()`) and queried with `pd.read_sql()` in Python/Jupyter.

## Tools I used

Python, pandas, SQLite

## What I did

Wrote SQL queries covering every core requirement from the project brief:

1. **SELECT + WHERE** — filtered orders down to a specific product category.
2. **ORDER BY** — sorted filtered results by order value, highest to lowest.
3. **GROUP BY + COUNT + SUM** — aggregated order count and total revenue per product.
4. **GROUP BY + AVG + HAVING** — found which products have an average order value above $1,000, using `HAVING` since `AVG()` doesn't exist until after grouping.
5. **Bonus query** — average order value by payment method, filtered to methods with more than 100 orders using `HAVING`, to avoid drawing conclusions from small sample sizes.

## What I found

- **Chair and Printer lead on total revenue** ($195,620 and $195,613), consistent with what I found doing the same analysis in pandas for Project 2 — good cross-check that both approaches agree.
- **5 of 7 products** have an average order value above $1,000 (Chair, Laptop, Monitor, Printer, Tablet) — Desk and Phone fell below that threshold.
- **Credit Card orders have the highest average value** ($1,127.55), though all 5 payment methods are fairly close together (roughly $1,000–$1,128) — no payment method stands out dramatically.

## Files in this repo

- `project3_queries.sql` — all queries, commented
- `Dataset_for_Data_Analytics.xlsx` — raw data

## Biggest thing I learned

`WHERE` filters rows before grouping; `HAVING` filters groups after aggregating — they're not interchangeable. I also learned that SQL doesn't execute top-to-bottom the way it's written (SELECT is actually processed near the end, after FROM, WHERE, GROUP BY, and HAVING), which explains why you can't reference a column alias inside a WHERE clause.
