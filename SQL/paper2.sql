create database paper2
use paper2

-- Create color Table
CREATE TABLE color (
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    extra_fee DECIMAL(5,2) DEFAULT 0
);
-- Create customer Table
CREATE TABLE customer (
    id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    favorite_color_id INT FOREIGN KEY REFERENCES color(id)
);
-- Create category Table
CREATE TABLE category (
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    parent_id INT FOREIGN KEY REFERENCES category(id) NULL
);
-- Create clothing Table
CREATE TABLE clothing (
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100) NOT NULL,
    size VARCHAR(5) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    color_id INT FOREIGN KEY REFERENCES color(id),
    category_id INT FOREIGN KEY REFERENCES category(id)
);
-- Create clothing_order Table
CREATE TABLE clothing_order (
    id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT FOREIGN KEY REFERENCES customer(id),
    clothing_id INT FOREIGN KEY REFERENCES clothing(id),
    items INT NOT NULL,
    order_date DATE NOT NULL
);

-- Insert Sample Colors
INSERT INTO color (name, extra_fee) VALUES
('Red', 5.00),    -- has extra fee
('Green', 0.00),
('Blue', 0.00),
('Black', 5.00),  -- has extra fee
('White', 0.00);

-- Insert Sample Customers
INSERT INTO customer (first_name, last_name, favorite_color_id) VALUES
('Jay', 'Patel', 1),     -- Favorite is Red
('Dhruv', 'Shah', 2),    -- Favorite is Green
('Amit', 'Verma', 1),    -- Favorite is Red
('Priya', 'Mehta', 3),   -- Favorite is Blue
('Ravi', 'Singh', NULL), -- No favorite color
('Meera', 'Das', 5);     -- Customer with no purchases

-- Insert Sample Categories
INSERT INTO category (name, parent_id) VALUES
('Mens', NULL),          -- Main category
('Womens', NULL),        -- Main category
('T-Shirt', 1),          -- Subcategory of Mens
('Joggers', 1),          -- Subcategory of Mens
('Hoodie', 1),           -- Subcategory of Mens
('T-Shirt', 2),          -- Subcategory of Womens
('Joggers', 2);          -- Subcategory of Womens

-- Insert Sample Clothing
INSERT INTO clothing (name, size, price, color_id, category_id) VALUES
('Basic Tee', 'M', 20.00, 5, 3),        -- White, Mens T-Shirt
('V-Neck Tee', 'L', 25.00, 3, 3),        -- Blue, Mens T-Shirt (for Jay's order)
('Performance Jogger', 'L', 45.00, 4, 4), -- Black, Mens Joggers
('Cuffed Jogger', 'M', 40.00, 2, 4),      -- Green, Mens Joggers
('Graphic Hoodie', 'XL', 60.00, 1, 5),    -- Red, Mens Hoodie
('Womens Basic Tee', 'S', 20.00, 5, 6),   -- White, Womens T-Shirt
('Womens Lounge Jogger', 'M', 50.00, 4, 7); -- Black, Womens Joggers

-- Insert Sample Orders
INSERT INTO clothing_order (customer_id, clothing_id, items, order_date) VALUES
-- Jay's order for T-Shirt after 1st April 2024
(1, 2, 2, '2024-05-15'), -- Jay, V-Neck Tee, Qty 2

-- Order for financial year 2024-25
(2, 4, 1, '2024-06-10'), -- Dhruv, Cuffed Jogger, Qty 1

-- Order of favorite color
(1, 5, 1, '2024-07-01'), -- Jay, Graphic Hoodie (Red), Qty 1. Jay's fav color is Red.

-- Customer who wears XL
(4, 5, 1, '2024-08-01'), -- Priya, Graphic Hoodie (XL), Qty 1

-- Multiple orders for customer totals
(1, 3, 1, '2024-09-05'), -- Jay, Performance Jogger, Qty 1
(2, 7, 1, '2023-11-20'), -- Dhruv, Womens Lounge Jogger, Qty 1
(3, 1, 3, '2024-10-10'); -- Amit, Basic Tee, Qty 3


--Paper 2: SQL Queries

--Question 1: List the customers whose favorite color is Red or Green and name is Jay or Dhruv.

select
	c.first_name
	,c.last_name
	,co.name color_name
from customer c
join color co
on c.favorite_color_id = co.id
where
	co.name in ('Red', 'Green')

--Question 2: List the different types of Joggers with their sizes.

select
	clo.name clothing_name
	,clo.size
from clothing clo
join category ca
on clo.category_id = ca.id
where
	ca.name = 'Joggers'

--Question 3: List the orders of Jay of T-Shirt after 1st April 2024.

select
	clor.id order_id
	,c.first_name customer_name
	,clo.name clothing_name
	,clor.items
	,clor.order_date
from clothing_order clor
join customer c
on clor.customer_id = c.id
join clothing clo
on clo.id = clor.clothing_id
join category ca
on ca.id = clo.category_id
where 
	ca.name = 'T-Shirt' and
	c.first_name = 'Jay'

--Question 4: List the customer whose favorite color is charged extra.

select
	c.first_name
	,c.last_name
	,co.name favorite_color
	,co.extra_fee
from customer c
join color co
on c.favorite_color_id = co.id
where
	co.extra_fee > 0

--Question 5: List category wise clothing's maximum price, minimum price, average price and number of clothing items.

select
	ca.name category_name
	,count(clo.category_id) num_items
	,max(clo.price) max_price
	,min(clo.price) min_price
	,avg(clo.price) avg_price
from clothing clo
join category ca
on clo.category_id = ca.id
group by
	ca.name

--Question 6: List the customers with no purchases at all.

select
	c.first_name
	,c.last_name
from customer c
left join clothing_order clor
on c.id = clor.customer_id
where
	clor.customer_id is null

--Question 7: List the orders of favorite color with all the details.

select
	clor.id order_id
	,c.first_name customer_name
	,clo.name clothing_name
	,co.name color_name
	,clor.items
	,clor.order_date
from clothing_order clor
join clothing clo
on clor.clothing_id = clo.id
join color co
on clo.color_id = co.id
join customer c
on c.favorite_color_id = co.id

--Question 8: List the customers with total purchase value, number of orders and number of items purchased.

select
	CONCAT(c.first_name,c.last_name) customer_name
	,count(clor.customer_id) num_orders
	,sum(clor.items) total_items
	,sum(clo.price) total_purchase_value
from customer c
join clothing_order clor
on c.id = clor.customer_id
join clothing clo
on clor.clothing_id = clo.id
group by
	c.first_name,
	c.last_name

--Question 9: List the Clothing item, Size, Order Value and Number of items sold during financial year 2024-25.

select
	clo.name clothing_name
	,clo.size
	,sum(clor.items) items_sold
	,sum(clo.price) order_value
from clothing clo
join clothing_order clor
on clo.id = clor.clothing_id
where
	year(clor.order_date) in (2024, 2025)
group by
	clo.name
	,clo.size

--Question 10: List the customers who wears XL size.

select
	c.first_name
	,c.last_name
from customer c
join clothing_order clor
on c.id = clor.customer_id
join clothing clo
on clor.clothing_id = clo.id
where
	clo.size = 'XL'
