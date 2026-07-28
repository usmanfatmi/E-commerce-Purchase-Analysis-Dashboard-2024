--Create Database
CREATE DATABASE EcommerceDB;

--Table Create
CREATE TABLE ecommerce (
    User_ID VARCHAR(20),
    Product_ID VARCHAR(20),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Discount INT,
    Final_Price DECIMAL(10,2),
    Payment_Method VARCHAR(30),
    Purchase_Date DATE
);

--Import CSV 
COPY ecommerce
FROM 'D:\portfolio project\e commerce\ecommerce_dataset_updated.csv'
DELIMITER ','
CSV HEADER;

--Total Sale
SELECT SUM(Final_Price) AS Total_Sales
FROM ecommerce;

--Total Orders
SELECT COUNT(Product_ID) AS Total_Orders
FROM ecommerce;

--Total Customers
SELECT COUNT(DISTINCT User_ID) AS Total_Customers
FROM ecommerce;

--Category Wise Sales
SELECT Category,
SUM(Final_Price) AS Sales
FROM ecommerce
GROUP BY Category
ORDER BY Sales DESC;

--Payment Method Wise Sales
SELECT Payment_Method,
SUM(Final_Price) AS Sales
FROM ecommerce
GROUP BY Payment_Method;

--Monthly Sales
SELECT MONTH(Purchase_Date) AS Month,
SUM(Final_Price) AS Sales
FROM ecommerce
GROUP BY MONTH(Purchase_Date)
ORDER BY Month;

--Average Discount
SELECT Category,
AVG(Discount) AS Avg_Discount
FROM ecommerce
GROUP BY Category;

--Highest Sale
SELECT MAX(Final_Price) AS Highest_Sale
FROM ecommerce;

--Lowest Sale
SELECT MIN(Final_Price) AS Lowest_Sale
FROM ecommerce;
