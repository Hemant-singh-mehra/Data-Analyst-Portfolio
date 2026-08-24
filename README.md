# Data-Analyst-Portfolio
A collection of SQL queries and Power BI dashboards showcasing data analysis skills, including JOINs, CTEs, Window Functions, Subqueries, and interactive business dashboards built using retail and employee datasets.

## 🗃️ SQL Projects

### 1. Retail Sales & Order Analysis (retail_queries.sql)
**Objective:** Analyzed sales, profit, and delivery performance using retail order data.

**Key Tasks & Queries:**
- Combined order and sales data using `INNER JOIN` and `LEFT JOIN`, including missing-data detection.
- Calculated delivery time per order using `DATEDIFF`.
- Ranked top-performing categories per region using `DENSE_RANK` with `PARTITION BY`.
- Classified orders by profitability using `CASE WHEN`.
- Identified above-average performing categories using a Double CTE.
- Built a master summary table using `SELECT INTO`.

### 2. Employee Data Analysis (employees_queries.sql)
**Objective:** Analyzed department-wise salary trends, tenure, and workforce distribution.

**Key Tasks & Queries:**
- Aggregated department-wise headcount and average salary using `GROUP BY` and `HAVING`.
- Ranked employees by salary within each department using `DENSE_RANK` with `PARTITION BY`.
- Identified high earners using a Correlated Subquery.
- Compared department averages against the company-wide average using a Double CTE.
- Handled missing values using `ISNULL` and `COALESCE`.
- Combined high-salary and senior-age employee lists using `UNION ALL`.

---

## 📊 Power BI Dashboards

### 1. Retail Sales Dashboard
Interactive dashboard analyzing retail sales performance — Sum of Sales, Sum of Profit, Sales by Region, Sales by Segment, and Sales by Executive, with slicers for Ship Mode, Category, and Date Range.

### 2. Netflix Content Analytics Dashboard
Analyzed 9K+ Netflix titles (6K Movies, 3K TV Shows) using DAX measures for KPIs like Content Added (YTD/MTD), content rating breakdown, content growth trend (2014–2021), and top 10 content-producing countries — with Year and Rating slicers for interactive filtering.

---

## 🛠️ Tools & Skills Demonstrated
**SQL:** Joins (Inner, Left), GROUP BY, HAVING, Aggregate Functions, CASE WHEN, Subqueries, CTEs, Window Functions (RANK, DENSE_RANK), DATEDIFF, ISNULL/COALESCE, UNION ALL.

**Power BI:** DAX Measures, Time Intelligence (YTD/MTD), Interactive Slicers, KPI Cards, Data Visualization.
