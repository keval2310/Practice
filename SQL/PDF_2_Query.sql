
-- =========================================
-- 1. TABLE CREATION
-- =========================================
-- CATEGORY table
CREATE TABLE CATEGORY (
 CategoryID INT IDENTITY(1,1) PRIMARY KEY,
 CategoryName VARCHAR(100) NOT NULL UNIQUE
);
-- BRANCH table
CREATE TABLE BRANCH (
 BranchID INT IDENTITY(1,1) PRIMARY KEY,
 BranchName VARCHAR(100) NOT NULL,
 City VARCHAR(100) NOT NULL
);
-- CUSTOMER table
CREATE TABLE CUSTOMER (
 CustomerID INT IDENTITY(1,1) PRIMARY KEY,
 Name VARCHAR(150) NOT NULL,
 Phone VARCHAR(15) NOT NULL UNIQUE,
 City VARCHAR(100) NOT NULL
);
-- VEHICLE table
CREATE TABLE VEHICLE (
 VehicleID INT IDENTITY(1,1) PRIMARY KEY,
 CategoryID INT NOT NULL,
 Model VARCHAR(150) NOT NULL,
 DailyRate DECIMAL(10,2) NOT NULL,
 Status VARCHAR(50) NOT NULL CHECK (Status IN ('Available', 'Rented','Maintenance')),
 BranchID INT NOT NULL,
 CONSTRAINT FK_Vehicle_Category
 FOREIGN KEY (CategoryID) REFERENCES CATEGORY(CategoryID),
 CONSTRAINT FK_Vehicle_Branch
 FOREIGN KEY (BranchID) REFERENCES BRANCH(BranchID)
);
-- RENTAL table
CREATE TABLE RENTAL (
 RentalID INT IDENTITY(1,1) PRIMARY KEY,
 VehicleID INT NOT NULL,
 CustomerID INT NOT NULL,
 StartDate DATE NOT NULL,
 EndDate DATE NOT NULL,
 TotalAmount DECIMAL(10,2) NOT NULL CHECK (TotalAmount >= 0),
 CONSTRAINT FK_Rental_Vehicle
 FOREIGN KEY (VehicleID) REFERENCES VEHICLE(VehicleID),
 CONSTRAINT FK_Rental_Customer
 FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID)
);-- =========================================
-- CATEGORY data
INSERT INTO CATEGORY (CategoryName) VALUES
('Sedan'), -- CategoryID = 1
('SUV'), -- CategoryID = 2
('Truck'), -- CategoryID = 3
('Luxury'); -- CategoryID = 4
-- BRANCH data
INSERT INTO BRANCH (BranchName, City) VALUES
('Delhi Central', 'Delhi'), -- BranchID = 1
('Mumbai South', 'Mumbai'), -- BranchID = 2
('Ahmedabad Old City', 'Ahmedabad'); -- BranchID = 3
-- CUSTOMER data
INSERT INTO CUSTOMER (Name, Phone, City) VALUES
('Rohan Sharma', '9876500001', 'Delhi'), -- CustomerID = 1
('Priya Mehta', '9876500002', 'Mumbai'), -- CustomerID = 2
('Amit Patel', '9876500003', 'Ahmedabad'), -- CustomerID = 3
('Neha Singh', '9876500004', 'Delhi'), -- CustomerID = 4
('Arjun Rao', '9876500005', 'Bangalore'), -- CustomerID = 5
('Sara Khan', '9876500006', 'Mumbai'), -- CustomerID = 6
('Vivek Joshi', '9876500007', 'Delhi'), -- CustomerID = 7
('Ananya Roy', '9876500008', 'Kolkata'); -- CustomerID = 8
-- VEHICLE data
INSERT INTO VEHICLE (CategoryID, Model, DailyRate, Status, BranchID) VALUES
(1, 'Honda City', 1500.00, 'Available', 1), -- VehicleID = 1 (Sedan, Delhi)
(1, 'Hyundai Verna', 1600.00, 'Rented', 1), -- VehicleID = 2 (Sedan, Delhi)
(2, 'Toyota Fortuner', 3500.00, 'Available', 2), -- VehicleID = 3 (SUV, Mumbai)
(2, 'Mahindra XUV500', 3000.00, 'Maintenance', 3), -- VehicleID = 4 (SUV, Ahmedabad)
(3, 'Tata Ace', 2000.00, 'Available', 3), -- VehicleID = 5 (Truck, Ahmedabad)
(3, 'Ashok Leyland 1618', 2800.00, 'Rented', 2), -- VehicleID = 6 (Truck, Mumbai)
(4, 'BMW 5 Series', 7000.00, 'Available', 1), -- VehicleID = 7 (Luxury, Delhi)
(4, 'Audi A6', 6500.00, 'Rented', 2), -- VehicleID = 8 (Luxury, Mumbai)
(1, 'Maruti Dzire', 1400.00, 'Available', 3), -- VehicleID = 9 (Sedan, Ahmedabad)
(2, 'Hyundai Creta', 2500.00, 'Available', 1), -- VehicleID = 10 (SUV, Delhi)
(3, 'Eicher Pro', 2600.00, 'Available', 2), -- VehicleID = 11 (Truck, Mumbai) -- never rented
(4, 'Mercedes E-Class', 8000.00, 'Available', 3); -- VehicleID = 12 (Luxury, Ahmedabad) -- never rented-- RENTAL data
INSERT INTO RENTAL (VehicleID, CustomerID, StartDate, EndDate, TotalAmount) VALUES
-- Rohan Sharma (Cust 1) → rents from ALL 4 categories & more than 3 vehicles
(1, 1, '2025-10-01', '2025-10-03', 4500.00), -- Honda City (Sedan)
(3, 1, '2025-10-10', '2025-10-12', 10500.00), -- Toyota Fortuner (SUV)
(5, 1, '2025-10-20', '2025-10-22', 6000.00), -- Tata Ace (Truck)
(7, 1, '2025-11-01', '2025-11-05', 35000.00), -- BMW 5 Series (Luxury)
-- Priya Mehta (Cust 2) → rents from 3 different categories
(2, 2, '2025-10-05', '2025-10-06', 3200.00), -- Hyundai Verna (Sedan)
(3, 2, '2025-11-02', '2025-11-04', 10500.00), -- Toyota Fortuner (SUV)
(8, 2, '2025-11-10', '2025-11-12', 19500.00), -- Audi A6 (Luxury)
-- Amit Patel (Cust 3) → long Truck rental
(6, 3, '2025-09-01', '2025-09-20', 56000.00), -- Ashok Leyland 1618 (Truck) 20 days
(5, 3, '2025-11-03', '2025-11-06', 8000.00), -- Tata Ace (Truck)
-- Neha Singh (Cust 4) → Sedan only
(1, 4, '2025-11-08', '2025-11-09', 3000.00), -- Honda City
(9, 4, '2025-11-15', '2025-11-16', 2800.00), -- Maruti Dzire
-- Arjun Rao (Cust 5) → 3 consecutive rentals (no gap)
(10, 5, '2025-08-01', '2025-08-04', 10000.00), -- Hyundai Creta (SUV)
(3, 5, '2025-08-05', '2025-08-08', 14000.00), -- Toyota Fortuner (SUV)
(7, 5, '2025-08-09', '2025-08-10', 14000.00), -- BMW 5 Series (Luxury)
-- Sara Khan (Cust 6)
(2, 6, '2025-11-01', '2025-11-03', 4800.00), -- Hyundai Verna
(10,6, '2025-11-20', '2025-11-22', 7500.00), -- Hyundai Creta
-- Vivek Joshi (Cust 7)
(4, 7, '2025-10-11', '2025-10-13', 9000.00), -- Mahindra XUV500 (SUV)
(8, 7, '2025-10-14', '2025-10-17', 26000.00), -- Audi A6 (Luxury)
-- Ananya Roy (Cust 8)
(9, 8, '2025-07-01', '2025-07-03', 4200.00), -- Maruti Dzire
(1, 8, '2025-10-25', '2025-10-27', 4500.00); -- Honda City--Queries – Part A

--1. Retrieve customers who rented more than 3 vehicles

select
	c.CustomerID,
	c.Name,
	count(v.VehicleID) VehiclesRented
from CUSTOMER c 
join RENTAL r
on c.CustomerID = r.CustomerID
join VEHICLE v
on r.VehicleID = v.VehicleID
group by
	c.CustomerID,
	c.Name
having
	count(v.VehicleID) > 3

--2. Display vehicles rented in the last 30 days along with customer and branch details.

select
	r.RentalID
	,v.VehicleID
	,v.Model
	,c.CustomerID
	,c.Name
	,b.BranchID
	,b.BranchName
	,r.StartDate
	,r.EndDate
	,r.TotalAmount
from CUSTOMER c 
join RENTAL r
on c.CustomerID = r.CustomerID

join VEHICLE v
on r.VehicleID = v.VehicleID

join BRANCH b
on v.BranchID = b.BranchID
where
	DATEDIFF(DAY, r.StartDate,  GETDATE()) < 30

--3. List customers along with the number of rentals they have completed.

select
	c.CustomerID
	,c.Name
	,count(r.RentalID) RentalCount
from CUSTOMER c 
join RENTAL r
on c.CustomerID = r.CustomerID
join VEHICLE v
on r.VehicleID = v.VehicleID
group by
	c.CustomerID
	,c.Name

--4. Show total revenue generated for each vehicle category.select	c.CategoryID	,c.CategoryName	,sum(r.TotalAmount) TotalRevenuefrom RENTAL r
join VEHICLE v
on r.VehicleID = v.VehicleID
join CATEGORY c
on c.CategoryID = v.CategoryID
group by
	c.CategoryID	,c.CategoryName

--5. Find vehicles that have never been rented.

select
	v.VehicleID
	,v.Model
	,v.Status
	,b.BranchID
from VEHICLE v
left join RENTAL r
on v.VehicleID = r.RentalID
join BRANCH b
on v.BranchID = b.BranchID

--6. Display customer name and total amount they have spent on rentals.

select
	c.CustomerID
	,c.Name
	,sum(r.TotalAmount) TotalSpent
from CUSTOMER c
join RENTAL r
on c.CustomerID = r.CustomerID
group by
	c.CustomerID
	,c.Name

--7. List vehicles rented by customers from the same city as the branch they rented from.select	r.RentalID	,v.VehicleID	,v.Model	,c.CustomerID	,c.Name CustomerName	,c.City CustomerCity	,b.City BranchCityfrom RENTAL rjoin CUSTOMER con r.CustomerID = c.CustomerIDjoin VEHICLE von v.VehicleID = r.VehicleIDjoin BRANCH bon v.BranchID = b.BranchIDwhere 	c.City = b.City--8. Retrieve all rentals where the associated vehicle is currently marked as Available.select	r.RentalID	,v.VehicleID	,v.Model	,c.CustomerID	,r.StartDate	,r.EndDate	,r.TotalAmountfrom RENTAL rjoin VEHICLE von r.VehicleID = v.VehicleIDjoin CUSTOMER con c.CustomerID = r.CustomerIDwhere	v.Status = 'Available'--9. Show the top 5 vehicles that generated the highest total rental revenue.selecttop 5	v.VehicleID	,v.Model	,sum(r.TotalAmount) TotalRevenuefrom VEHICLE vjoin RENTAL ron v.VehicleID = r.VehicleIDgroup by	v.VehicleID	,v.Modelorder by	sum(r.TotalAmount) desc--10. List all categories where the average rental duration is greater than 5 days.