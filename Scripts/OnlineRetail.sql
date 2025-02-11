REATE DATABASE OnlineRetailDB;
USE OnlineRetailDB;
go

SELECT * FROM Online_Retail
go

-- 1. Total Revenue Calulation:
SELECT 
    SUM(Quantity * UnitPrice) AS TotalRevenue
FROM 
    Online_Retail
go

-- 2. Total Revenue by country
SELECT 
    Country, 
    SUM(Quantity * UnitPrice) AS TotalRevenue
FROM 
    Online_Retail
GROUP BY 
    Country
ORDER BY 
    TotalRevenue DESC;
go


-- 3. Top 10 Customers by Revenue
SELECT TOP 10
    CustomerID, 
    SUM(Quantity * UnitPrice) AS TotalSpent
FROM 
    Online_Retail
GROUP BY 
    CustomerID
ORDER BY 
    TotalSpent DESC;
go

-- 4. Top 10 Products by Quantity Sold
SELECT TOP 10
    StockCode, 
    Description, 
    SUM(Quantity) AS TotalQuantitySold
FROM 
    Online_Retail
GROUP BY 
    StockCode, Description
ORDER BY 
    TotalQuantitySold DESC;
go

--Monthly Revenue Trend
SELECT 
    FORMAT(InvoiceDate, 'yyyy-MM') AS Month, 
    SUM(Quantity * UnitPrice) AS MonthlyRevenue
FROM 
    Online_Retail
GROUP BY 
    FORMAT(InvoiceDate, 'yyyy-MM')
ORDER BY 
    Month;
go

-- 6. Average Order Value (AOV)
SELECT 
    AVG(OrderValue) AS AverageOrderValue
FROM (
    SELECT 
        InvoiceNo, 
        SUM(Quantity * UnitPrice) AS OrderValue
    FROM 
        Online_Retail
    GROUP BY 
        InvoiceNo
) AS OrderValues;
go


-- 7. Customer Count by Country
SELECT 
    Country, 
    COUNT(DISTINCT CustomerID) AS CustomerCount
FROM 
    Online_Retail
GROUP BY 
    Country
ORDER BY 
    CustomerCount DESC;
go

-- 8. Products with the Highest Unit Price
SELECT TOP 10
    StockCode, 
    Description, 
    MAX(UnitPrice) AS MaxUnitPrice
FROM 
    Online_Retail
GROUP BY 
    StockCode, Description
ORDER BY 
    MaxUnitPrice DESC;
go


-- 9. Total Quantity Sold by Product
SELECT 
    StockCode, 
    Description, 
    SUM(Quantity) AS TotalQuantitySold
FROM 
    Online_Retail
GROUP BY 
    StockCode, Description
ORDER BY 
    TotalQuantitySold DESC;
go


--10. Number of Invoices per Customer
SELECT 
    CustomerID, 
    COUNT(DISTINCT InvoiceNo) AS NumberOfInvoices
FROM 
    Online_Retail
GROUP BY 
    CustomerID
ORDER BY 
    NumberOfInvoices DESC;
go

-- 11. Revenue Per Customer
SELECT 
    CustomerID, 
    SUM(Quantity * UnitPrice) AS TotalRevenue
FROM 
    Online_Retail
GROUP BY 
    CustomerID
ORDER BY 
    TotalRevenue DESC;
go


-- 12. Top 5 Countries by Revenue
SELECT TOP 5
    Country, 
    SUM(Quantity * UnitPrice) AS TotalRevenue
FROM 
    Online_Retail
GROUP BY 
    Country
ORDER BY 
    TotalRevenue DESC;
go

-- 13. Products with Negative Quantity (Returns)
SELECT 
    StockCode, 
    Description, 
    SUM(Quantity) AS TotalReturns
FROM 
    Online_Retail
WHERE 
    Quantity < 0
GROUP BY 
    StockCode, Description
ORDER BY 
    TotalReturns;
go


-- 14. Daily Revenue
SELECT 
    CAST(InvoiceDate AS DATE) AS Day, 
    SUM(Quantity * UnitPrice) AS DailyRevenue
FROM 
    Online_Retail
GROUP BY 
    CAST(InvoiceDate AS DATE)
ORDER BY 
    Day;
go

-- Customer Livetime Value (CLV)
SELECT 
    CustomerID, 
    SUM(Quantity * UnitPrice) AS LifetimeValue
FROM 
    Online_Retail
GROUP BY 
    CustomerID
ORDER BY 
    LifetimeValue DESC;
