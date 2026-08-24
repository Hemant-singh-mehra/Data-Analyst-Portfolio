/* ============================================================
   EMPLOYEE DATA ANALYSIS - SQL PORTFOLIO
   Dataset: employee_records
   Concepts: GROUP BY, HAVING, DATEDIFF, CASE WHEN, SELECT INTO,
             Window Functions, Correlated Subqueries, Double CTE,
             ISNULL/COALESCE, YEAR/MONTH, UNION ALL
   ============================================================ */


-- Department-wise total employees and average salary
--     (only departments with more than 3 employees)
SELECT
    Department,
    COUNT(*)      AS total_employees,
    AVG(Salary)   AS average_salary
FROM
    employee_records
GROUP BY
    Department
HAVING
    COUNT(*) > 3;


--: Calculate employee tenure (in years) using DATEDIFF
SELECT
    Employee_Name,
    DATEDIFF(YEAR, Joining_Date, GETDATE()) AS tenure
FROM
    employee_records;


--: Categorize employees into salary bands using CASE WHEN
SELECT
    Employee_Name,
    Salary,
    CASE
        WHEN Salary > 110000                       THEN 'high_salary'
        WHEN Salary BETWEEN 70000 AND 110000        THEN 'medium_salary'
        ELSE 'low_salary'
    END AS salary_category
FROM
    employee_records;


--: Create a master summary table using SELECT INTO
SELECT
    Employee_Name,
    Department,
    Salary,
    DATEDIFF(YEAR, Joining_Date, GETDATE()) AS tenure
INTO
    Employee_Master
FROM
    employee_records;


--: Rank employees within each department by salary
--     using DENSE_RANK with PARTITION BY
SELECT
    Employee_Name,
    Department,
    Salary,
    DENSE_RANK() OVER (
        PARTITION BY Department
        ORDER BY Salary DESC
    ) AS rank_within_department
FROM
    employee_records;


--: Find employees earning above their department's
--     average salary (Correlated Subquery)
SELECT
    Employee_Name,
    Salary
FROM
    employee_records AS e1
WHERE
    Salary > (
        SELECT AVG(Salary)
        FROM employee_records AS e2
        WHERE e2.Department = e1.Department
    );


--: Find departments with average salary above the
--     company overall average (Double CTE)
WITH department_avg_salary AS (
    SELECT
        Department,
        AVG(Salary) AS average_salary
    FROM
        employee_records
    GROUP BY
        Department
),
overall_average AS (
    SELECT
        AVG(Salary) AS overall_average
    FROM
        employee_records
)
SELECT
    d.Department,
    d.average_salary
FROM
    department_avg_salary AS d
WHERE
    d.average_salary > (SELECT overall_average FROM overall_average);


--: Replace NULL Country values with 'Unknown'
--     (ISNULL / COALESCE)
SELECT
    ISNULL(Country, 'Unknown') AS country
FROM
    employee_records;

SELECT
    COALESCE(Country, 'Unknown') AS country
FROM
    employee_records;


--: Year-Month wise employee headcount
--     (YEAR / MONTH functions)
SELECT
    YEAR(Joining_Date)  AS year_joining,
    MONTH(Joining_Date) AS month_joining,
    COUNT(*)            AS total_employees
FROM
    employee_records
GROUP BY
    YEAR(Joining_Date),
    MONTH(Joining_Date);


-- : Combined list of high-salary and senior-age
--      employees (UNION ALL)
SELECT
    Employee_Name
FROM
    employee_records
WHERE
    Salary > 110000

UNION ALL

SELECT
    Employee_Name
FROM
    employee_records
WHERE
    Age > 50;
