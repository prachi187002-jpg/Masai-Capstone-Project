# Masai-Capstone-Project

# BigBasket Sales and Category Performance Analysis

## Project Overview

This project analyses BigBasket order and product data using SQLite, Pandas, Google Sheets, and Tableau Public. The project covers data cleaning, SQL-based business analysis, revenue and target comparisons, supplier analysis, exploratory data analysis, and dashboard development. The final dashboard presents monthly revenue trends, category-level revenue, category target performance, key performance indicators, and interactive filtering for January–June 2026.

## Repository Structure

```text
bigbasket-analysis/
│
├── data/
│   ├── bigbasket.db
│   ├── orders_raw.csv
│   ├── products.csv
│   └── monthly_category_revenue.csv
│
├── sql/
│   ├── verify.sql
│   ├── 01_foundations.sql
│   ├── 02_aggreagation_joins.sql
│   └── 03_reporting.sql
│
├── notebooks/
│   └── analysis.ipynb
│
├── generate_data.ipynb
├── Bigbasket sheet analysis.xlsx
├── ai_log.md
├── DATA_STORY.md
└── README.md
```

## Technologies Used

* SQLite
* SQL
* Python
* Pandas
* NumPy
* Matplotlib
* Google Sheets
* Tableau Public

## How to Regenerate the Data

The database and raw CSV exports can be regenerated using:

```bash
generate_data.py
```

The script generates the project database and the raw data files required for the SQL and Pandas analysis.

## SQL Tasks

The SQL queries for each task are available in the `sql/` directory:

* `sql/verify.sql`
* `sql/01_foundations.sql`
* `sql/02_aggreagation_joins.sql`
* `sql/03_reporting.sql`

These queries cover the required database analysis and business questions.

## Spreadsheet Report

The spreadsheet workbook is:

```text
Bigbasket sheet analysis.xlsx
```

It contains the monthly category revenue analysis used for the reporting stage of the project.

## Tableau Public Dashboard

The interactive Tableau Public dashboard is available here:

**https://prod-in-a.online.tableau.com/#/site/prachi187002-a01094db83/workbooks/1559703?:origin=card_share_link**

The dashboard includes:

* Total monthly revenue trend
* Category revenue comparison
* Category target-status colouring
* Total revenue KPI
* Total Delivered Orders KPI
* Average Order Value KPI
* Categories Meeting Target KPI
* Interactive filters affecting the dashboard worksheets

## Data Story

The interpretation of the dashboard and the category-level recommendations are available in:

```text
DATA_STORY.md
```

## AI Assistance Log

The prompts used for AI-assisted SQL and Pandas support, together with their verification steps, are recorded in:

```text
ai_log.md
```

## Part 4 Notebook

The Pandas cleaning, outlier treatment, aggregation, merging, and visualisation work is available in:

```text
analysis.ipynb
```
