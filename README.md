# Data-Analyst-Portfolio
A collection of SQL queries built using retail and employee datasets, Power BI dashboard created from the Netflix dataset, Excel dashboard built using HR data, and Excel VBA automation tools using Data Splitter and Data Compiler.

---

## 🗃️ SQL Projects

### 1. Retail Sales & Order Analysis (retail_queries.sql)
**Objective:** Analyzed sales, profit, and delivery performance using retail order data.

**Key Tasks & Queries:**
- Combined order and sales data using `INNER JOIN` and `LEFT JOIN`, including missing-data detection.
- Calculated delivery time per order using `DATEDIFF`.
- Ranked top-performing categories per region using `DENSE_RANK` with `PARTITION BY`.
- Classified orders by profitability using `CASE WHEN`.
- Identified above-average performing categories using a Double CTE.
- Built a master summary table using `SELECT INTO.

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

📈 Excel Dashboards
### HR Analytics Dashboard (HR_Analytics_Dashboard.xlsx)
Objective: Analyzed comprehensive employee data to uncover workforce distribution patterns, employee attrition drivers, and salary trends across departments.
Key Analysis & Features:

-Analyzed department-wise and gender-wise employee distribution across the organization.
-Studied employee segmentation across various age groups to identify workforce demographics.
-Investigated employee attrition (Yes/No) and calculated average monthly income segmented by job roles.
-Developed a fully interactive Excel dashboard utilizing PivotTables, PivotCharts, and dynamic Slicers for real-time data filtering.

---

## 📊 Power BI Dashboards

### Netflix Content Analytics Dashboard
Analyzed 9K+ Netflix titles (6K Movies, 3K TV Shows) using DAX measures for KPIs like Content Added (YTD/MTD), content rating breakdown, content growth trend (2014–2021), and top 10 content-producing countries — with Year and Rating slicers for interactive filtering.

---

## ⚙️ Excel VBA Automation

### 1. Data Splitter (`Data_Splitter_VBA.txt`)
Automatically splits a master Excel dataset into separate workbooks based on a category column (e.g., splitting order data by state), using Loops, AutoFilter, and Workbook Objects.

### 2. Data Compiler (`Data_Compiler_VBA.txt`)
Consolidates multiple Excel workbooks into a single master workbook using a File Dialog to select source files, then automatically cleans up duplicate header rows after merging.

**Impact:** These macros reduced manual reporting effort by approximately 40% and improved data processing accuracy.

---

## 🛠️ Tools & Skills Demonstrated

**SQL:** Joins (Inner, Left), GROUP BY, HAVING, Aggregate Functions, CASE WHEN, Subqueries, CTEs, Window Functions (RANK, DENSE_RANK), DATEDIFF, ISNULL/COALESCE, UNION ALL

**Excel Dashboards:** PivotTables, PivotCharts, Slicers, Dynamic Reporting, Data Modeling

**Power BI:** DAX Measures, Time Intelligence (YTD/MTD), Interactive Slicers, KPI Cards, Data Visualization

**Excel VBA:** Loops, AutoFilter, Workbook Objects, File Dialog, Macro Automation
