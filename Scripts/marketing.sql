-- 1. Create a table for storing marketing campaign data
CREATE TABLE marketing_campaign (
    customer_id INT PRIMARY KEY,
    age INT,
    gender NVARCHAR(10),
    income DECIMAL(10,2),
    purchase_history NVARCHAR(MAX),
    review_text NVARCHAR(MAX),
    campaign_response NVARCHAR(10),
    sentiment_score FLOAT
);
go


-- 2. Insert sample data
INSERT INTO marketing_campaign (customer_id, age, gender, income, purchase_history, review_text, campaign_response, sentiment_score) 
VALUES (1, 30, 'Male', 75000.00, 'Laptop, Headphones', 'Great service, fast delivery!', 'Yes', NULL),
       (2, 25, 'Female', 55000.00, 'Smartphone, Earbuds', 'The product is okay, but delivery was late.', 'No', NULL),
       (3, 40, 'Male', 85000.00, 'Gaming Console, TV', 'Excellent quality, I love it!', 'Yes', NULL);


go

-- 3. Extract customer sentiment trends
SELECT campaign_response, AVG(sentiment_score) AS avg_sentiment
FROM marketing_campaign
GROUP BY campaign_response
ORDER BY avg_sentiment DESC;

go


-- 4. Identify high-value customers based on sentiment trends
SELECT customer_id, income, sentiment_score
FROM marketing_campaign
WHERE sentiment_score > 0.5
ORDER BY income DESC;

go

--5 General SQL Queries
-- Retrieve all data
SELECT * FROM marketing_campaign;

-- Count total customers
SELECT COUNT(*) AS total_customers FROM marketing_campaign;

-- Find customers with income above 60,000
SELECT * FROM marketing_campaign WHERE income > 60000;

-- 6. Data Mining Queries
-- Find top 5 customers based on income
SELECT TOP 5 * FROM marketing_campaign ORDER BY income DESC;

go




-- 7. Advanced Queries
-- Identify customer segments based on age groups
SELECT 
    CASE 
        WHEN age < 25 THEN 'Young'
        WHEN age BETWEEN 25 AND 40 THEN 'Middle-Aged'
        ELSE 'Senior'
    END AS age_group,
    COUNT(*) AS customer_count
FROM marketing_campaign
GROUP BY CASE 
        WHEN age < 25 THEN 'Young'
        WHEN age BETWEEN 25 AND 40 THEN 'Middle-Aged'
        ELSE 'Senior'
    END;

go


-- 8. Sentiment trend analysis per income group
SELECT 
    CASE 
        WHEN income < 50000 THEN 'Low Income'
        WHEN income BETWEEN 50000 AND 80000 THEN 'Middle Income'
        ELSE 'High Income'
    END AS income_group,
    AVG(sentiment_score) AS avg_sentiment
FROM marketing_campaign
GROUP BY CASE 
        WHEN income < 50000 THEN 'Low Income'
        WHEN income BETWEEN 50000 AND 80000 THEN 'Middle Income'
        ELSE 'High Income'
    END;

go

-- 9. Detect potential fraud (Example: customers with high purchases but low sentiment)
SELECT * FROM marketing_campaign WHERE sentiment_score < 0 AND income > 70000;

go

--10 Updating the table:
INSERT INTO marketing_campaign (customer_id, age, gender, income, purchase_history, review_text, campaign_response, sentiment_score) 
VALUES (5, 35, 'Female', 62000.00, 'Tablet, Smartwatch', 'Good product but could be cheaper.', 'Yes', 0.6);



INSERT INTO marketing_campaign (customer_id, age, gender, income, purchase_history, review_text, campaign_response, sentiment_score) 
VALUES (4, 28, 'Non-Binary', 58000.00, 'Smart Speaker, Wireless Charger', 'Great product, highly recommended!', 'Yes', 0.85);


go

SELECT * FROM marketing_campaign

go

-- 11. Create a table for storing product details
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name NVARCHAR(100),
    category NVARCHAR(50),
    price DECIMAL(10,2)
);

gi'

-- 12. Insert sample data into products
INSERT INTO products (product_id, product_name, category, price)
VALUES (1, 'Laptop', 'Electronics', 1200.00),
       (2, 'Headphones', 'Accessories', 150.00),
       (3, 'Smartphone', 'Electronics', 800.00),
       (4, 'Earbuds', 'Accessories', 100.00);

go

-- Identify customer segments based on age groups
SELECT 
    CASE 
        WHEN age < 25 THEN 'Young'
        WHEN age BETWEEN 25 AND 40 THEN 'Middle-Aged'
        ELSE 'Senior'
    END AS age_group,
    COUNT(*) AS customer_count
FROM marketing_campaign
GROUP BY CASE 
        WHEN age < 25 THEN 'Young'
        WHEN age BETWEEN 25 AND 40 THEN 'Middle-Aged'
        ELSE 'Senior'
    END;

go


-- 11. Union of two tables (Example: merging customer purchase history and product details)
SELECT mc.customer_id, mc.age, mc.gender, mc.income, p.product_name, p.category, p.price
FROM marketing_campaign mc
JOIN products p ON mc.purchase_history LIKE '%' + p.product_name + '%'

UNION

SELECT NULL AS customer_id, NULL AS age, NULL AS gender, NULL AS income, product_name, category, price
FROM products;

go


-- 12. Joining marketing campaign data with products
SELECT mc.customer_id, mc.age, mc.gender, mc.income, mc.review_text, p.product_name, p.category, p.price
FROM marketing_campaign mc
LEFT JOIN products p ON mc.purchase_history LIKE '%' + p.product_name + '%';