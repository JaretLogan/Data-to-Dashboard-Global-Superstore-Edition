-- 1. LOGISTICS & OPERATIONAL EFFICIENCY
-- Goal: Analyze shipping performance to see if the company is meeting its service level agreements 
SELECT 
    ship_mode,
    AVG(ship_date - order_date) AS avg_days_to_ship,
    -- Identifying outliers 
    MIN(ship_date - order_date) AS fastest_ship,
    MAX(ship_date - order_date) AS slowest_ship
FROM superstore_orders
GROUP BY ship_mode
ORDER BY avg_days_to_ship;

-- 2. TIME-SERIES REVENUE ANALYSIS
-- Goal: Calculate Year-over-Year growth to identify long-term business trends.
WITH YearlySales AS (
    SELECT 
        year, 
        SUM(sales) AS annual_sales
    FROM superstore_orders
    GROUP BY year
)
SELECT 
    year, 
    annual_sales,
    -- Side-by-side comparison of current vs. previous year revenue.
    LAG(annual_sales) OVER (ORDER BY year) AS previous_year_sales,
    -- Calculating the percentage change to quantify growth or decline.
    ROUND(((annual_sales - LAG(annual_sales) OVER (ORDER BY year)) / LAG(annual_sales) OVER (ORDER BY year)) * 100, 2) AS growth_pct
FROM YearlySales;

-- 3. PRODUCT PROFITABILITY AUDIT
-- Goal: Identify Profit Killers within the product catalog.
SELECT 
    category, 
    sub_category, 
    SUM(sales) AS total_revenue, 
    SUM(profit) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM superstore_orders
GROUP BY 1, 2
-- Ordering by profit ASCENDING puts the biggest losses at the top for immediate action.
ORDER BY total_profit ASC;