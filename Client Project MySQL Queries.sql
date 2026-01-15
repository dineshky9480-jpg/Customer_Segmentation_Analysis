
-- Retrieve all customer purchase records from the dataset.
SELECT * FROM `customer segmentation`.shopping_trends_dataset;



-- 1. Find the total number of customers?
SELECT COUNT(DISTINCT `CustomerID`) AS total_customers
FROM shopping_trends_dataset;

-- 2. Caluclate the total sales amount?
SELECT 
    SUM(`PurchaseAmountUSD`) AS total_sales_amount
FROM shopping_trends_dataset;


-- 3. Find the average order value?
SELECT 
    ROUND(AVG(`PurchaseAmountUSD`), 2) AS average_order_value
FROM shopping_trends_dataset;

-- 4. Count total transaction made using each payment method?
SELECT 
 PaymentMethod,
COUNT(*) AS total_transactions
FROM shopping_trends_dataset
GROUP BY PaymentMethod
ORDER BY total_transactions DESC;

-- 5. Show total slaes per product category?
SELECT 
    Category AS product_category,
    ROUND(SUM(`PurchaseAmountUSD`), 2) AS total_sales
FROM shopping_trends_dataset
GROUP BY Category
ORDER BY total_sales DESC;


-- 6. Identyfy top 5 locations by total sales?
SELECT 
    Location,
    ROUND(SUM(`PurchaseAmountUSD`), 2) AS total_sales
FROM shopping_trends_dataset
GROUP BY Location
ORDER BY total_sales DESC
LIMIT 5;


-- 7. Which age_group generates the highest sales?
SELECT 
    age_group,
    ROUND(SUM(`PurchaseAmountUSD`), 2) AS total_sales
FROM (
    SELECT 
        CASE
            WHEN Age < 25 THEN 'Under 25'
            WHEN Age BETWEEN 25 AND 34 THEN '25-34'
            WHEN Age BETWEEN 35 AND 44 THEN '35-44'
            WHEN Age BETWEEN 45 AND 54 THEN '45-54'
            ELSE '55+'
        END AS age_group,
        `PurchaseAmountUSD`
    FROM shopping_trends_dataset
) t
GROUP BY age_group
ORDER BY total_sales DESC
LIMIT 1;


-- 8. Calculate the average spending by age group?
SELECT 
    age_group,
    ROUND(AVG(`PurchaseAmountUSD`), 2) AS avg_spend
FROM (
    SELECT 
        CASE
            WHEN Age < 25 THEN 'Under 25'
            WHEN Age BETWEEN 25 AND 34 THEN '25-34'
            WHEN Age BETWEEN 35 AND 44 THEN '35-44'
            WHEN Age BETWEEN 45 AND 54 THEN '45-54'
            ELSE '55+'
        END AS age_group,
        `PurchaseAmountUSD`
    FROM shopping_trends_dataset
) t
GROUP BY age_group
ORDER BY avg_spend DESC
LIMIT 1;




