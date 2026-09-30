-- ============================================================
-- PRODUCT ANALYTICS & CUSTOMER INTELLIGENCE PLATFORM
-- BUSINESS SQL ANALYSIS
-- ============================================================
--
-- Dataset:
-- UCI Online Retail II
--
-- Analysis period:
-- 2009-12-01 through 2010-12-09
--
-- IMPORTANT:
-- December 2010 is a partial month.
--
-- SQL skills demonstrated:
-- CTEs
-- GROUP BY
-- CASE
-- Window functions
-- LAG
-- DENSE_RANK
-- NTILE
-- Revenue concentration
-- Customer segmentation
-- Product analysis
-- ============================================================


-- ============================================================
-- QUERY 1
-- EXECUTIVE KPIs
-- ============================================================

WITH order_summary AS (

    SELECT

        Invoice,

        "Customer ID" AS customer_id,

        SUM(Revenue)
            AS order_revenue,

        SUM(Quantity)
            AS order_items

    FROM transactions

    GROUP BY
        Invoice,
        "Customer ID"
)

SELECT

    COUNT(*)
        AS total_orders,

    COUNT(DISTINCT customer_id)
        AS total_customers,

    ROUND(
        SUM(order_revenue),
        2
    ) AS total_revenue,

    ROUND(
        AVG(order_revenue),
        2
    ) AS average_order_value,

    ROUND(
        AVG(order_items),
        2
    ) AS average_items_per_order

FROM order_summary;



-- ============================================================
-- QUERY 2
-- MONTHLY REVENUE
-- ============================================================

SELECT

    DATE_TRUNC(
        'month',
        InvoiceDate
    ) AS month,

    ROUND(
        SUM(Revenue),
        2
    ) AS revenue,

    COUNT(
        DISTINCT Invoice
    ) AS orders,

    COUNT(
        DISTINCT "Customer ID"
    ) AS customers

FROM transactions

GROUP BY 1

ORDER BY 1;



-- ============================================================
-- QUERY 3
-- TOP CUSTOMERS
-- ============================================================

SELECT

    "Customer ID"
        AS customer_id,

    ROUND(
        SUM(Revenue),
        2
    ) AS revenue,

    COUNT(
        DISTINCT Invoice
    ) AS orders,

    COUNT(
        DISTINCT StockCode
    ) AS unique_products

FROM transactions

GROUP BY
    "Customer ID"

ORDER BY
    revenue DESC

LIMIT 20;



-- ============================================================
-- QUERY 4
-- ONE-TIME VS REPEAT CUSTOMERS
-- ============================================================

WITH customer_metrics AS (

    SELECT

        "Customer ID"
            AS customer_id,

        COUNT(
            DISTINCT Invoice
        ) AS orders,

        SUM(
            Revenue
        ) AS revenue

    FROM transactions

    GROUP BY
        "Customer ID"
)

SELECT

    CASE

        WHEN orders = 1
        THEN 'One-Time Customer'

        ELSE 'Repeat Customer'

    END AS customer_type,

    COUNT(*)
        AS customers,

    ROUND(
        SUM(revenue),
        2
    ) AS revenue

FROM customer_metrics

GROUP BY 1

ORDER BY
    revenue DESC;



-- ============================================================
-- QUERY 5
-- TOP PRODUCTS
-- ============================================================

SELECT

    StockCode,

    ROUND(
        SUM(Revenue),
        2
    ) AS revenue,

    SUM(
        Quantity
    ) AS quantity,

    COUNT(
        DISTINCT Invoice
    ) AS orders,

    COUNT(
        DISTINCT "Customer ID"
    ) AS customers

FROM transactions

WHERE StockCode NOT IN (
    'POST',
    'M'
)

GROUP BY
    StockCode

ORDER BY
    revenue DESC

LIMIT 20;



-- ============================================================
-- QUERY 6
-- COUNTRY PERFORMANCE
-- ============================================================

SELECT

    Country,

    ROUND(
        SUM(Revenue),
        2
    ) AS revenue,

    COUNT(
        DISTINCT Invoice
    ) AS orders,

    COUNT(
        DISTINCT "Customer ID"
    ) AS customers

FROM transactions

GROUP BY
    Country

ORDER BY
    revenue DESC;



-- ============================================================
-- QUERY 7
-- MONTHLY ACTIVE CUSTOMERS
-- ============================================================

SELECT

    DATE_TRUNC(
        'month',
        InvoiceDate
    ) AS month,

    COUNT(
        DISTINCT "Customer ID"
    ) AS active_customers,

    COUNT(
        DISTINCT Invoice
    ) AS orders,

    ROUND(
        SUM(Revenue),
        2
    ) AS revenue

FROM transactions

GROUP BY 1

ORDER BY 1;



-- ============================================================
-- QUERY 8
-- CUSTOMER REVENUE RANKING
-- ============================================================

WITH customer_revenue AS (

    SELECT

        "Customer ID"
            AS customer_id,

        SUM(
            Revenue
        ) AS revenue

    FROM transactions

    GROUP BY
        "Customer ID"
)

SELECT

    customer_id,

    ROUND(
        revenue,
        2
    ) AS revenue,

    DENSE_RANK() OVER (
        ORDER BY revenue DESC
    ) AS revenue_rank

FROM customer_revenue

ORDER BY
    revenue DESC;

