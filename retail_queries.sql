/* ============================================================
   RETAIL DATA ANALYSIS - SQL PORTFOLIO
   Dataset: ListOfOrders, OrderBreakdown (AmazingMart)
   Concepts: INNER JOIN, LEFT JOIN, GROUP BY, HAVING,
             Aggregate Functions, CASE WHEN, Window Functions,
             Double CTE, Correlated + Nested Subqueries,
             DATEDIFF, SELECT INTO, UNION ALL
   ============================================================ */


-- Region-wise Total Sales and Order Count
SELECT
    l.Region,
    COUNT(DISTINCT l.Order_Date) AS total_count,
    SUM(o.Sales)                 AS total_sales
FROM
    ListOfOrders AS l
INNER JOIN
    OrderBreakdown AS o
    ON l.orderid = o.Order_ID
GROUP BY
    l.Region;


-- Top 3 Categories per Region by Sales
--     (Window Function: DENSE_RANK with PARTITION BY)
WITH rank_category AS (
    SELECT
        l.Region,
        o.Category,
        SUM(o.Sales) AS total_sales,
        DENSE_RANK() OVER (
            PARTITION BY l.Region
            ORDER BY SUM(o.Sales) DESC
        ) AS region_rank
    FROM
        ListOfOrders AS l
    INNER JOIN
        OrderBreakdown AS o
        ON l.orderid = o.Order_ID
    GROUP BY
        l.Region,
        o.Category
)
SELECT
    Region,
    Category,
    total_sales,
    region_rank
FROM
    rank_category
WHERE
    region_rank <= 3;


-- Order Classification by Profit using CASE WHEN
SELECT
    CASE
        WHEN Profit = 0 THEN 'break-even'
        WHEN Profit > 0 THEN 'profit'
        ELSE 'loss'
    END AS profit_category,
    COUNT(*) AS total_count
FROM
    OrderBreakdown
GROUP BY
    CASE
        WHEN Profit = 0 THEN 'break-even'
        WHEN Profit > 0 THEN 'profit'
        ELSE 'loss'
    END;


-- Categories Performing Above Overall Average Sales
--     (Double CTE)
WITH category_sales_wise AS (
    SELECT
        Category,
        SUM(Sales) AS total_sales
    FROM
        OrderBreakdown
    GROUP BY
        Category
),
categories_wise_average AS (
    SELECT
        AVG(total_sales) AS avg_sales
    FROM
        category_sales_wise
)
SELECT
    Category,
    total_sales
FROM
    category_sales_wise
WHERE
    total_sales > (SELECT avg_sales FROM categories_wise_average);


-- Orders with Missing Breakdown Data
--     (LEFT JOIN + IS NULL - Data Quality Check)
SELECT
    o.Order_ID
FROM
    ListOfOrders AS l
LEFT JOIN
    OrderBreakdown AS o
    ON l.orderid = o.Order_ID
WHERE
    o.Order_ID IS NULL;


-- Delivery Time per Order using DATEDIFF
SELECT
    orderid,
    DATEDIFF(DAY, Order_Date, Ship_Date) AS delivery_days
FROM
    ListOfOrders;


-- Category-Region Combinations Above Region Average
--     (Nested + Correlated Subquery)
SELECT
    l.Region,
    o.Category,
    SUM(o.Sales) AS total_sales
FROM
    ListOfOrders AS l
INNER JOIN
    OrderBreakdown AS o
    ON l.orderid = o.Order_ID
GROUP BY
    l.Region,
    o.Category
HAVING
    SUM(o.Sales) > (
        SELECT AVG(cat_total)
        FROM (
            SELECT
                SUM(o2.Sales) AS cat_total
            FROM
                ListOfOrders AS l2
            INNER JOIN
                OrderBreakdown AS o2
                ON l2.orderid = o2.Order_ID
            WHERE
                l2.Region = l.Region
            GROUP BY
                o2.Category
        ) AS temp
    );


-- Master Summary Table by Region and Category
--     (SELECT INTO)
SELECT
    l.Region,
    o.Category,
    SUM(o.Sales)  AS total_sales,
    SUM(o.Profit) AS total_profit
INTO
    RetailMaster
FROM
    ListOfOrders AS l
INNER JOIN
    OrderBreakdown AS o
    ON l.orderid = o.Order_ID
GROUP BY
    l.Region,
    o.Category;


-- Combined List of High-Sales and High-Profit Orders
--     (UNION ALL)
SELECT
    Order_ID
FROM
    OrderBreakdown
WHERE
    Profit > 200

UNION ALL

SELECT
    Order_ID
FROM
    OrderBreakdown
WHERE
    Sales > 1000;
