# Data-Analyst-Portfolio
A collection of data analytics projects demonstrating practical skills in SQL, Excel, Power BI, and Excel VBA automation, including retail and employee data analysis, an HR Analytics dashboard, a Netflix Content Analytics dashboard, and Excel automation tools for data compilation and data splitting.

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
- Built a master summary table using SELECT INTO.
  
**Key Insights:**
- Central region recorded the highest sales (₹20,163) and order count among 3 regions.
- Office Supplies ranked #1 category by sales across all 3 regions.
- Office Supplies was the only category performing above the overall average category sales.


### 2. Employee Data Analysis (employees_queries.sql)
**Objective:** Analyzed department-wise salary trends, tenure, and workforce distribution.

**Key Tasks & Queries:**
- Aggregated department-wise headcount and average salary using `GROUP BY` and `HAVING`.
- Ranked employees by salary within each department using `DENSE_RANK` with `PARTITION BY`.
- Identified high earners using a Correlated Subquery.
- Compared department averages against the company-wide average using a Double CTE.
- Handled missing values using `ISNULL` and `COALESCE`.
- Combined high-salary and senior-age employee lists using `UNION ALL`.

**Key Insights:**
- Analyzed 30,000 employees across 6 departments.
- Support recorded the highest average salary (₹90,649.14); 4 departments performed above the company-wide average.

---

## 📈 Excel Dashboards
### HR Analytics Dashboard (HR-Analytics-Excel-Dashboard.jpeg)
**Objective:** Analyzed employee data to identify workforce distribution patterns, employee attrition patterns, and salary trends across departments and job roles.

## Key Analysis & Features:
- Analyzed department-wise and gender-wise employee distribution.
- Studied employee distribution across different age groups.
- Analyzed employee attrition (Yes/No) across the workforce.
- Calculated and analyzed average monthly income across different job roles.
- Developed an interactive Excel dashboard using PivotTables, PivotCharts, and Slicers for dynamic data filtering.
  
**Key Insights:**
-Overall attrition rate was 28.3% (416 of 1,470 employees), with Research & Development accounting for 65% of total headcount (961 employees).
-Manager recorded the highest average monthly income at ₹17,181.68, with a workforce gender split of 60% male and 40% female.

---

## 📊 Power BI Dashboards

### Netflix Content Analytics Dashboard
**Objective:** Analyzed the Netflix dataset to understand content distribution, ratings, growth trends, and country-wise content production.

## Key Analysis & Features:
- Analyzed 9K+ Netflix titles, including Movies and TV Shows.
- Created KPI measures for Content Added YTD and MTD using DAX.
- Analyzed content distribution by rating.
- Created a content growth trend covering 2014–2021.
- Identified the Top 10 content-producing countries.
- Added Year and Rating slicers for interactive dashboard filtering.
- Used DAX measures and interactive visualizations to present key insights.
  
**Key Insights:**
- Found that Movies made up 69.65% of the catalog vs. 30.35% TV Shows, with content additions peaking in 2019 before declining through 2021.
- Identified TV-MA as the most common content rating and the United States as the leading content-producing country.

---

## ⚙️ Excel VBA Automation

### 1. Data Splitter (`Data_Splitter_VBA.txt`)
Automatically splits a master Excel dataset into separate workbooks based on State, using Loops, AutoFilter, and Workbook Objects.

### 2. Data Compiler (`Data_Compiler_VBA.txt`)
Consolidates multiple Excel workbooks into a single master workbook using a File Dialog to select source files, then automatically cleans up duplicate header rows after merging.

**Impact:** These macros reduced manual reporting effort by approximately 40% and improved data processing accuracy.

---

## 🛠️ Tools & Skills Demonstrated

**SQL:** SQL: Joins (Inner, Left, Right), GROUP BY, HAVING, Aggregate Functions, CASE WHEN, Subqueries, CTEs, Window Functions (RANK, DENSE_RANK, ROW_NUMBER), DATEDIFF, DATEPART, ISNULL/COALESCE, UNION ALL, Views

**Excel Dashboards:** PivotTables, PivotCharts, Slicers, Dynamic Reporting, Data Modeling

**Power BI:** DAX Measures, Time Intelligence (YTD/MTD), Interactive Slicers, KPI Cards, Data Visualization

**Excel VBA:** Loops, AutoFilter, Workbook Objects, File Dialog, Macro Automation
