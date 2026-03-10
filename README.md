# Superstore Sales Analytics

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-13+-336791?logo=postgresql&logoColor=white)
![Tableau](https://img.shields.io/badge/Tableau-Desktop-E97627?logo=tableau&logoColor=white)

An end-to-end analytics pipeline for the [SuperStore Sales Analytics](https://www.kaggle.com/datasets/thuandao/superstore-sales-analytics) - from raw CSV ingestion through SQL-based cleaning and analysis to an interactive Tableau dashboard. Built to demonstrate practical data engineering and business intelligence patterns on a realistic retail dataset.

Unlike notebook-based approaches, this project keeps transformation logic in SQL and separates concerns cleanly: one script to build and clean, one to answer business questions, one workbook to visualize.

<img width="634" height="845" alt="Dashboard" src="https://github.com/user-attachments/assets/0ed65279-11bf-422a-b2f7-695bd3ed02ab" />


## Features

- **Staged ETL pipeline** — ingests all columns as text, then casts to correct types in a single `ALTER TABLE`, safely handling dirty CSV data (embedded commas, `DD/MM/YYYY` dates)
- **Three business analyses** — YoY revenue growth with `LAG()`, shipping SLA compliance by mode, and a full product profitability audit sorted by worst performers first
- **Four Tableau views** — sales trend, avg. shipping time, sub-category profit bar chart, and a choropleth profit map across global markets


## Visuals

| Sales Trend | Product Performance |
|---|---|
| <img width="320" height="809" alt="Sales_Trend" src="https://github.com/user-attachments/assets/1da0b20c-9d0a-4e37-b767-6550df70c55b" /> | <img width="1131" height="816" alt="Product_Performance" src="https://github.com/user-attachments/assets/16380cd3-d44d-4127-a028-1890bce13b2a" /> |

| Avg. Shipping Time | Profit Map |
|---|---|
| <img width="327" height="813" alt="Shipping_Time" src="https://github.com/user-attachments/assets/123483c4-ee1b-42a0-9b33-b540b421e4de" /> | <img width="1538" height="810" alt="Profit_Map" src="https://github.com/user-attachments/assets/3601f843-322d-45d0-b9b4-f0eb10709271" /> |


## Authors

Built by [jaret Logan](https://github.com/JaretLogan).
