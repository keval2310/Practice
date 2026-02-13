create database paper6
use paper6

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    JoinDate DATE NOT NULL
);

-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT NOT NULL
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    OrderDate DATE NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,       -- Price at time of order
    Amount DECIMAL(10,2) NOT NULL,     -- Total = Quantity * Price
    ShippedDate DATE NULL,
    OrderStatus VARCHAR(20) CHECK (OrderStatus IN ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
);

-- Create Payments Table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    PaymentDate DATE NOT NULL,
    PaymentAmount DECIMAL(10,2) NOT NULL
);
-- Insert Sample Customers
INSERT INTO Customers (CustomerID, Name, JoinDate) VALUES
(1, 'Arun Kumar', '2023-01-10'),
(2, 'Bhavna Gupta', '2023-02-15'),
(3, 'Chetan Shah', '2023-03-20'),
(4, 'Divya Iyer', '2023-04-05'),
(5, 'Esha David', '2023-05-12'); -- Q5: No orders

-- Insert Sample Products
INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity) VALUES
(101, 'Laptop', 'Electronics', 1200.00, 10),
(102, 'Wireless Mouse', 'Electronics', 25.00, 50),
(103, 'Keyboard', 'Electronics', 45.00, 30), -- Q4: Basis for price comparison
(104, 'Desk Chair', 'Furniture', 150.00, 20),
(105, 'Coffee Maker', 'Appliances', 80.00, 5),
(106, 'Cookbook', 'Books', 30.00, 100); -- Q7: Category with no orders

-- Insert Sample Orders
INSERT INTO Orders (OrderID, CustomerID, ProductID, OrderDate, Quantity, Price, Amount, ShippedDate, OrderStatus) VALUES
-- Q1: Arun's orders for outstanding amount
(1, 1, 101, '2025-01-15', 1, 1200.00, 1200.00, '2025-01-17', 'Delivered'), -- Fully paid
(2, 1, 102, '2025-02-10', 2, 25.00, 50.00, '2025-02-11', 'Delivered'),   -- Partially paid

-- Q2: Bhavna 2 orders, same product, same day
(3, 2, 101, '2025-03-05', 1, 1200.00, 1200.00, '2025-03-07', 'Delivered'), -- Q3: Delivered, no payment
(4, 2, 101, '2025-03-05', 1, 1200.00, 1200.00, '2025-03-08', 'Shipped'),

-- Q6: Stock < Pending
(5, 3, 105, '2025-04-01', 5, 80.00, 400.00, NULL, 'Pending'), -- Stock 5, Pending 5
(6, 4, 105, '2025-04-02', 2, 80.00, 160.00, NULL, 'Pending'), -- Stock 5, Pending 5+2=7

-- Q8: Re-order within 7 days (Arun, Mouse)
(7, 1, 102, '2025-04-05', 1, 25.00, 25.00, '2025-04-06', 'Delivered'), -- First order
(8, 1, 102, '2025-04-08', 1, 25.00, 25.00, '2025-04-09', 'Delivered'), -- Re-order 3 days later

-- Q10: Date-wise pending
(9, 3, 102, '2025-04-02', 1, 25.00, 25.00, NULL, 'Pending');

-- Insert Sample Payments
INSERT INTO Payments (OrderID, PaymentDate, PaymentAmount) VALUES
(1, '2025-01-18', 1200.00), -- Q1: Fully paid
(2, '2025-02-13', 30.00);    -- Q1: Partially paid (50 - 30 = 20 outstanding)

--Question 1: List Customers with total outstanding amount.

select
	c.Name,
	sum(o.Amount) OutstandingAmount
from Customers c
join Orders o
on c.CustomerID = o.OrderID
group by
	c.Name

--Question 2: List Customers who placed more than 2 orders in a single day of a same product.

select
	c.Name,
	o.OrderDate,
	count(o.CustomerID) Order_count
from Customers c
right join Orders o
on c.CustomerID = o.OrderID
group by
	c.Name,
	o.OrderDate
having
	count(o.CustomerID) > 2

--Question 3: List Orders which are delivered but payment not received.

select
	c.Name,
	p.ProductName,
	o.OrderID,
	o.OrderDate,
	o.Amount
from Customers c
join Orders o
on c.CustomerID = o.OrderID
join Products p
on o.ProductID = p.ProductID
left join Payments pay
on o.OrderID = pay.OrderID
where
	o.OrderStatus = 'delivered' and
	pay.OrderID is null

--Question 4: List All Products whose price is more than Product "Keyboard".

select
	p.ProductName,
	p.Price
from Products p
where
	p.Price > (
	select Price
	from Products
	where ProductName = 'Keyboard'
	)
group by
	p.ProductName,
	p.Price

--Question 5: List Customers which have not placed a single order.

select
	c.CustomerID
	,c.Name
	,c.JoinDate
from Customers c
left join Orders o
on c.CustomerID = o.CustomerID
where
	o.CustomerID is null

--Question 6: List Products where StockQuantity is less than Pending Order Total Quantity.

select
	p.ProductName
	,p.StockQuantity
	,sum(o.Quantity) PendingOrderQuantity
from Products p
join Orders o
on p.ProductID = o.ProductID
where
	o.OrderStatus = 'Pending'
group by
	p.ProductName
	,p.StockQuantity
having
	p.StockQuantity < sum(o.Quantity)

--Question 7: Category Wise Sales Summary (Include all the category even if with zero orders).

select
	p.Category
	,count(c.CustomerID) No_of_Customers
	,count(o.OrderID) No_of_Orders
	,count(p.ProductID) No_of_Products
	,sum(o.Quantity) Total_Quantity
	,sum(o.Price) Total_Order_Amount
from Products p
right join Orders o
on p.ProductID = o.ProductID
join Customers c
on c.CustomerID = o.CustomerID
group by
	p.Category


--Question 8: List Customer with Order detail who has placed order of same product again within 7 days.

with day as(
	select
	from Customers c
	join Orders o
	on c.CustomerID = o.CustomerID

)
select
	c.Name CustomerName
	,p.ProductName
from Customers c
join Orders o
on c.CustomerID = o.CustomerID
join Products p
on o.ProductID = p.ProductID
