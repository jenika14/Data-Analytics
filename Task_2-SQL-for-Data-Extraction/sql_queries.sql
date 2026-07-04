-- Q1: Total Sales by Category
SELECT Category, SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Category;

-- Q2: Top 5 Products by Profit
SELECT "Product Name", SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY "Product Name"
ORDER BY Total_Profit DESC
LIMIT 5;

-- Q3: Sales by Region
SELECT Region, SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Q4: Profit by Category
SELECT Category, SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Q5: Customer Segment by Spending
SELECT Segment, SUM(Sales) AS Total_Spending
FROM superstore
GROUP BY Segment
ORDER BY Total_Spending DESC;

-- Q6: Most Sold Sub-Categories
SELECT "Sub-Category", SUM(Quantity) AS Total_Quantity
FROM superstore
GROUP BY "Sub-Category"
ORDER BY Total_Quantity DESC
LIMIT 10;

-- Q7: Top 10 States by Sales
SELECT State, SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;

-- Q8: Average Discount by Category
SELECT Category, AVG(Discount) AS Avg_Discount
FROM superstore
GROUP BY Category;

-- Q9: Technology Products (WHERE)
SELECT *
FROM superstore
WHERE Category='Technology'
LIMIT 5;

-- Q10: Products with Sales Above Average (Subquery)
SELECT "Product Name", Sales
FROM superstore
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM superstore
)
LIMIT 10;

-- Q11: Rank Products by Sales (Window Function)
SELECT
    "Product Name",
    Sales,
    RANK() OVER (ORDER BY Sales DESC) AS Sales_Rank
FROM superstore
LIMIT 10;

-- Q12: Category Sales using CTE
WITH category_sales AS
(
    SELECT Category,
           SUM(Sales) AS Total_Sales
    FROM superstore
    GROUP BY Category
)
SELECT *
FROM category_sales;

-- Q13: Categories with Total Sales > 500000 (HAVING)
SELECT Category,
       SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Category
HAVING Total_Sales > 500000;