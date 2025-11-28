Create database praga;
use praga;
select * from churndata;
select * from customer;
select * from service;
select * from billing;

# Q1. Find total number of customers.
 SELECT 
    COUNT(*) AS Total_Customers
FROM
    customer;


 # Q2. How many customers churned vs not churned?
 SELECT 
    Churn, COUNT(*) AS Customer_Count
FROM
    ChurnData
GROUP BY Churn;
# Q3. Average tenure of churned vs non-churned customers.
SELECT 
    Churn, AVG(tenure) AS Avg_Tenure
FROM
    ChurnData
GROUP BY Churn;

# Q4. Which payment method has highest churn rate?
SELECT PaymentMethod,
       ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*), 2) AS ChurnRate
FROM ChurnData
GROUP BY PaymentMethod
ORDER BY ChurnRate DESC;

# Q5. Find top 10 customers by total charges.
SELECT 
    customerID,
    TotalCharges
FROM Billing
ORDER BY TotalCharges DESC
LIMIT 10;
