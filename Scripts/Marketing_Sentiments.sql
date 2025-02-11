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

-- 2. Insert sample data
INSERT INTO marketing_campaign (customer_id, age, gender, income, purchase_history, review_text, campaign_response, sentiment_score) 
VALUES (1, 30, 'Male', 75000.00, 'Laptop, Headphones', 'Great service, fast delivery!', 'Yes', NULL);

-- 3. Perform sentiment analysis (Placeholder for future implementation)
-- Note: SQL Server does not have built-in NLP functions. External scripts (Python) should be used for sentiment analysis.

-- 4. Extract customer sentiment trends
SELECT campaign_response, AVG(sentiment_score) AS avg_sentiment
FROM marketing_campaign
GROUP BY campaign_response
ORDER BY avg_sentiment DESC;

-- 5. Identify high-value customers based on sentiment trends
SELECT customer_id, income, sentiment_score
FROM marketing_campaign
WHERE sentiment_score > 0.5
ORDER BY income DESC;