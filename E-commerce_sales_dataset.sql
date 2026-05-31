use project;

SELECT 
    *
FROM
    sales_data;

-- show all record

SELECT 
    *
FROM
    sales_data;

--  show only customer names and sales

SELECT 
    sales, customer_name
FROM
    sales_data;

-- find total sales

SELECT 
    SUM(sales) AS total_sales
FROM
    sales_data;

-- find total profit

SELECT 
    SUM(profit) AS total_profit
FROM
    sales_data;

-- count total orders

SELECT 
    COUNT(*) AS total_orders
FROM
    sales_data;

-- find unique category 

SELECT DISTINCT
    category
FROM
    sales_data;

-- find orders from a specific city 

SELECT 
    *
FROM
    sales_data
WHERE
    city = 'Justinton';

-- find product with sales grater than 5000

SELECT 
    product, sales
FROM
    sales_data
WHERE
    sales > 5000;

-- sort sales from highest to lowest

SELECT 
    *
FROM
    sales_data
ORDER BY sales DESC;

-- find top 5 highest sales

SELECT 
    *
FROM
    sales_data
ORDER BY sales DESC
LIMIT 5;

-- find total sales by category 

SELECT 
    category, SUM(sales)
FROM
    sales_data
GROUP BY category;

-- find average customer rating

SELECT 
    AVG(customer_rating) AS customer_rating
FROM
    sales_data;

-- find higest profit product

SELECT 
    product, MAX(profit) AS highest_profit
FROM
    sales_data
GROUP BY product
ORDER BY highest_profit DESC;

-- find total sales by region 

SELECT 
    region, SUM(sales) AS total_sales
FROM
    sales_data
GROUP BY region
ORDER BY total_sales DESC;

-- count order by payment method

SELECT 
    payment_method, COUNT(order_id) AS total_orders
FROM
    sales_data
GROUP BY payment_method;

-- find monthly sales

SELECT 
    Month, SUM(sales) AS Monthly_sales
FROM
    sales_data
GROUP BY month
ORDER BY Monthly_sales DESC;

-- find average profit by category 

SELECT 
    category, AVG(profit) AS avg_profit
FROM
    sales_data
GROUP BY category
ORDER BY avg_profit;

--  find customer with more than 3 ordrs

SELECT 
    customer_name, COUNT(order_id) AS total_order
FROM
    sales_data
GROUP BY customer_name
HAVING COUNT(order_id) > 3;

-- find loss making orders

SELECT 
    *
FROM
    sales_data
WHERE
    profit < 0;

-- find most sold product

SELECT 
    product, SUM(quantity) AS total_quantity
FROM
    sales_data
GROUP BY product
ORDER BY total_quantity DESC
LIMIT 2;

-- find profit margin

SELECT 
    order_id,
    sales,
    profit,
    ROUND((profit / sales) * 100, 2) AS profit_margin
FROM
    sales_data;

-- find  top 3 cityes by sales

SELECT 
    city, SUM(sales) AS total_sales
FROM
    sales_data
GROUP BY city
ORDER BY total_sales DESC
LIMIT 3;

-- rank customer based on sales 

select customer_name ,sum(sales) as total_sales ,
rank() over(order by sum(sales) desc) as ranking
from sales_data
group by customer_name;
 
 -- find cumulative monthly sales
 
 select month,sum(sales) as monthly_sales,
 sum(sum(sales)) over(order by sum(sales)desc)as cumulative_sales
 from sales_data
 group by month;

-- find category contribution percentage 

SELECT 
    category,
    SUM(sales) AS total_sales,
    ROUND(SUM(sales) * 100 / (SELECT 
                    SUM(sales)
                FROM
                    sales_data),
            2) AS contribution_percentage
FROM
    sales_data
GROUP BY category;

-- find repeat customers

SELECT 
    customer_name, COUNT(DISTINCT order_id) AS order_count
FROM
    sales_data
GROUP BY customer_name
HAVING COUNT(DISTINCT order_id) > 1;

-- find best-performance month

SELECT 
    month, SUM(profit) AS total_profit
FROM
    sales_data
GROUP BY month
ORDER BY total_profit DESC
LIMIT 1;

-- compare sales and profit region wise

SELECT 
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM
    sales_data
GROUP BY region;

-- find customer with highest average rating

SELECT 
    customer_name, AVG(customer_rating) AS avg_rating
FROM
    sales_data
GROUP BY customer_name
ORDER BY avg_rating DESC;

-- create sales performance categoryes

SELECT 
    order_id,
    sales,
    CASE
        WHEN sales > 10000 THEN 'high sales'
        WHEN sales BETWEEN 5000 AND 10000 THEN 'Medium sales'
        ELSE 'low sales'
    END AS sales_category
FROM
    sales_data;






