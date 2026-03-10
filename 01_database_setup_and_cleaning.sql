-- 1. CLEANUP
-- Dropping the table first ensures the script can be re-run
DROP TABLE IF EXISTS superstore_orders;

-- 2. THE STAGING SCHEMA
-- Define all numerical and date columns as VARCHAR/TEXT initially.
-- Raw CSV data often contains "dirty" characters (commas, currency symbols, or varied date formats).
-- allows me to bring the data in first, then clean it using SQL logic

CREATE TABLE superstore_orders (
    order_id        VARCHAR(50),
    order_date      VARCHAR(20),
    ship_date       VARCHAR(20),
    ship_mode       VARCHAR(50),
    customer_name   VARCHAR(100),
    segment         VARCHAR(50),
    state           VARCHAR(100),
    country         VARCHAR(50),
    market          VARCHAR(50),
    region          VARCHAR(50),
    product_id      VARCHAR(50),
    category        VARCHAR(50),
    sub_category    VARCHAR(50),
    product_name    VARCHAR(255),
    sales           TEXT, -- Staged as text to handle potential commas/symbols
    quantity        TEXT,
    discount        TEXT,
    profit          TEXT,
    shipping_cost   TEXT,
    order_priority  VARCHAR(50),
    year            TEXT
);

-- 3. DATA INGESTION
-- Using the COPY command is significantly faster than standard INSERT statements
COPY superstore_orders
FROM 'xx'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

-- 4. DATA TRANSFORMATION & SANITIZATION
ALTER TABLE superstore_orders
    ALTER COLUMN sales TYPE NUMERIC(10,2) USING REPLACE(sales, ',', '')::NUMERIC,
    ALTER COLUMN quantity TYPE INTEGER USING REPLACE(quantity, ',', '')::INTEGER,
    ALTER COLUMN discount TYPE NUMERIC(5,2) USING REPLACE(discount, ',', '')::NUMERIC,
    ALTER COLUMN profit TYPE NUMERIC(10,2) USING REPLACE(profit, ',', '')::NUMERIC,
    ALTER COLUMN shipping_cost TYPE NUMERIC(10,2) USING REPLACE(shipping_cost, ',', '')::NUMERIC,
    ALTER COLUMN year TYPE INTEGER USING REPLACE(year, ',', '')::INTEGER,
    
    -- TO_DATE: Essential for handling the specific 'DD/MM/YYYY' format found in the CSV.
    ALTER COLUMN order_date TYPE DATE USING TO_DATE(order_date, 'DD/MM/YYYY'),
    ALTER COLUMN ship_date TYPE DATE USING TO_DATE(ship_date, 'DD/MM/YYYY');