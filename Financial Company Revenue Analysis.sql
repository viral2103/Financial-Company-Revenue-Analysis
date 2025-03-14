-- Use the practice database
USE practice;

-- Display the structure of the 'finanacial_company_revenue' table
DESC finanacial_company_revenue;

-- Rename the table 'finanacial_company_revenue' to 'financial_company_revenue'
ALTER TABLE finanacial_company_revenue RENAME TO financial_company_revenue;

-- Select all records from the 'financial_company_revenue' table
SELECT * 
FROM financial_company_revenue;

-- Get the total number of companies in each industry, ordered by total companies in descending order
SELECT Industry, 
       COUNT(Company) AS TotalCompany 
FROM financial_company_revenue 
GROUP BY Industry 
ORDER BY TotalCompany DESC;

-- Get the total number of headquarters in each industry, ordered by total headquarters in descending order
SELECT Industry, 
       COUNT(Headquarters) AS TotalHeadquarters 
FROM financial_company_revenue 
GROUP BY Industry 
ORDER BY TotalHeadquarters DESC;

-- Calculate the total net income (in USD millions) for each industry, ordered by total net income in descending order
SELECT Industry, 
       SUM(Net_Income_USD_Millions) AS TotalNetIncomeUSD 
FROM financial_company_revenue 
GROUP BY Industry 
ORDER BY TotalNetIncomeUSD DESC;

-- Calculate the total revenue (in USD millions) for each industry, ordered by total revenue in descending order
SELECT Industry, 
       SUM(Revenue_USD_Million) AS TotalRevenueUSD 
FROM financial_company_revenue 
GROUP BY Industry 
ORDER BY TotalRevenueUSD DESC;

-- Calculate the total assets (in USD millions) for each industry, ordered by total assets in descending order
SELECT Industry, 
       SUM(Total_Assest_USD_Millions) AS TotalAssests 
FROM financial_company_revenue 
GROUP BY Industry 
ORDER BY TotalAssests DESC;

-- Get the total number of companies by headquarters, ordered by total companies in descending order
SELECT Headquarters, 
       COUNT(Company) AS TotalCompany 
FROM financial_company_revenue 
GROUP BY Headquarters 
ORDER BY TotalCompany DESC;

-- Get the total number of industries by headquarters, ordered by total industries in descending order
SELECT Headquarters, 
       COUNT(Industry) AS TotalIndustry 
FROM financial_company_revenue 
GROUP BY Headquarters 
ORDER BY TotalIndustry DESC;

-- Calculate the total net income (in USD millions) for each headquarters, ordered by total net income in descending order
SELECT Headquarters, 
       SUM(Net_Income_USD_Millions) AS TotalNetIncomeUSD 
FROM financial_company_revenue 
GROUP BY Headquarters 
ORDER BY TotalNetIncomeUSD DESC;

-- Calculate the total revenue (in USD millions) for each headquarters, ordered by total revenue in descending order
SELECT Headquarters, 
       SUM(Revenue_USD_Million) AS TotalRevenueUSD 
FROM financial_company_revenue 
GROUP BY Headquarters 
ORDER BY TotalRevenueUSD DESC;

-- Calculate the total assets (in USD millions) for each headquarters, ordered by total assets in descending order
SELECT Headquarters, 
       SUM(Total_Assest_USD_Millions) AS TotalAssests 
FROM financial_company_revenue 
GROUP BY Headquarters 
ORDER BY TotalAssests DESC;

-- Get the top 5 companies by net income (in USD millions) along with their ranks
SELECT Company, 
       SUM(Net_Income_USD_Millions) AS TopComapnyNetIncome,
       RANK() OVER (ORDER BY SUM(Net_Income_USD_Millions) DESC) AS Ranks 
FROM financial_company_revenue 
GROUP BY Company 
LIMIT 5;

-- Get the top 5 companies by total revenue (in USD millions) along with their ranks
SELECT Company, 
       SUM(Revenue_USD_Million) AS TotalRevenueUSD,
       RANK() OVER (ORDER BY SUM(Revenue_USD_Million) DESC) AS Ranks 
FROM financial_company_revenue 
GROUP BY Company 
LIMIT 5;

-- Get the top 5 companies by total assets (in USD millions) along with their ranks
SELECT Company, 
       SUM(Total_Assest_USD_Millions) AS TotalAssests,
       RANK() OVER (ORDER BY SUM(Total_Assest_USD_Millions) DESC) AS Ranks 
FROM financial_company_revenue 
GROUP BY Company 
LIMIT 5;
