Create database PlacementPrep
use PlacementPrep

-- Create the EMP table
CREATE TABLE EMP (
    EID INT PRIMARY KEY,
    EName VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    JoiningDate DATE,
    City VARCHAR(50),
    Gender VARCHAR(10)
);

-- Insert data into the EMP table
INSERT INTO EMP (EID, EName, Department, Salary, JoiningDate, City, Gender)
VALUES
(101, 'Rahul', 'Admin', 56000, '1990-01-01', 'Rajkot', 'Male'),
(102, 'Hardik', 'IT', 18000, '1990-09-25', 'Ahmedabad', 'Male'),
(103, 'Bhavin', 'HR', 25000, '1991-05-14', 'Baroda', 'Male'),
(104, 'Bhoomi', 'Admin', 39000, '1991-02-08', 'Rajkot', 'Female'),
(105, 'Rohit', 'IT', 17000, '1990-07-23', 'Jamnagar', 'Male'),
(106, 'Priya', 'IT', 9000, '1990-10-18', 'Ahmedabad', 'Female'),
(107, 'Bhoomi', 'HR', 34000, '1991-12-25', 'Rajkot', 'Female'),
(108, 'Manish', 'IT', 22000, '1990-04-20', 'Baroda', 'Male'),
(109, 'Kavita', 'Admin', 35000, '1992-03-12', 'Ahmedabad', 'Female'),
(110, 'Suresh', 'HR', 28000, '1991-11-05', 'Jamnagar', 'Male'),
(111, 'Pooja', 'IT', 19000, '1991-01-30', 'Rajkot', 'Female'),
(112, 'Amit', 'Admin', 42000, '1990-08-19', 'Baroda', 'Male'),
(113, 'Rekha', 'HR', 31000, '1992-07-02', 'Ahmedabad', 'Female'),
(114, 'Vijay', 'IT', 20000, '1990-06-11', 'Rajkot', 'Male'),
(115, 'Meera', 'Admin', 38000, '1991-10-09', 'Jamnagar', 'Female');

-- Create the SALES_DATA table
CREATE TABLE SALES_DATA (
    Region VARCHAR(50),
    Product VARCHAR(50),
    Sales_Amount INT,
    Year INT
);

-- Insert data into the SALES_DATA table
INSERT INTO SALES_DATA (Region, Product, Sales_Amount, Year)
VALUES
('North America', 'Watch', 1500, 2023),
('Europe', 'Mobile', 1200, 2023),
('Asia', 'Watch', 1800, 2023),
('North America', 'TV', 900, 2024),
('Europe', 'Watch', 2000, 2024),
('Asia', 'Mobile', 1000, 2024),
('North America', 'Mobile', 1600, 2023),
('Europe', 'TV', 1500, 2023),
('Asia', 'TV', 1100, 2024),
('North America', 'Watch', 1700, 2024),
('Asia', 'Watch', 2200, 2024),
('Europe', 'Mobile', 1400, 2024),
('North America', 'TV', 1300, 2023),
('Asia', 'TV', 1000, 2023),
('Europe', 'Watch', 1800, 2023),
('North America', 'Mobile', 1100, 2024),
('Asia', 'Laptop', 3000, 2023),
('Europe', 'Laptop', 3500, 2024),
('North America', 'Laptop', 2800, 2024),
('Asia', 'Mobile', 1300, 2023);

--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.

Select 
	Max(Salary) Maximum,
	Min(Salary) Minimum 
from 
	EMP

--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, respectively.

Select 
	Sum(Salary) Total_Sal,
	Avg(Salary) Average_Sal 
from 
	EMP

--3. Find total number of employees of EMPLOYEE table.

Select 
	count(EID) Total_Employees 
from 
	EMP

--4. Find highest salary from Rajkot city.

Select 
	MAX(Salary) Max_Salary_Rajkot
from 
	EMP
where 
	City = 'Rajkot'

--5. Give maximum salary from IT department.

Select 
	MAX(Salary) Max_Salary_IT
from 
	EMP
where 
	Department = 'IT'

--6. Count employee whose joining date is after 8-Feb-91.

Select 
	Count(EID) Employee_Count	
from 
	EMP
where 
	JoiningDate > '1991-02-08'

--7. Display average salary of Admin department.

Select 
	AVG(Salary) Avg_Salary_Admin
from 
	EMP
where 
	Department = 'Admin'

--8. Display total salary of HR department.

Select 
	Sum(Salary) Total_Salary_HR
from 
	EMP
where 
	Department = 'HR'

--9. Count total number of cities of employee without duplication.

Select 
	Count(Distinct City) Unique_Cities 
from 
	EMP

--10. Count unique departments.

Select 
	Count(Distinct Department) Unique_Departments
From 
	EMP

--11. Give minimum salary of employee who belongs to Ahmedabad.

Select 
	Min(Salary) Min_Salary_Ahmedabad
From 
	EMP
where 
	City = 'Ahmedabad'

--12. Find city wise highest salary.

Select 
	City,
	Max(Salary) Max_Salary
From 
	EMP
group by 
	City

--13. Find department wise lowest salary.

Select 
	Department,
	Min(Salary) Min_Salary
From 
	EMP
group by 
	Department

--14. Display city with the total number of employees belonging to each city.

Select 
	city,
	Count(EID) Employee_Count 
From 
	EMP
group by 
	city

--15. Give total salary of each department of EMP table.

Select 
	Department,
	Sum(Salary) Total_Salary  
From 
	EMP
group by 
	Department

--16. Give average salary of each department of EMP table without displaying the respective department name.

Select Avg(Salary) Average_Salary   
From EMP
group by Department

--17. Count the number of employees for each department in every city.

Select Department,City,Count(EID) Employee_Count   
From EMP
group by Department,City

--18. Calculate the total salary distributed to male and female employees.

Select Gender,Sum(Salary) Total_Salary  
From EMP
group by Gender

--19. Give city wise maximum and minimum salary of female employees.

Select City,MAX(Salary) Max_Salary ,Min(Salary) Min_Salary 
From EMP
Where Gender = 'Female'
group by City

--20. Calculate department, city, and gender wise average salary.

Select Department,City,Gender,Avg(Salary) Average_Salary   
From EMP
group by Department,City,Gender

--PART-B---------------------------------------

--1. Count the number of employees living in Rajkot.

Select Count(EID) Rajkot_Employees 
from EMP
where City = 'Rajkot'

--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.

Select Max(Salary)-Min(Salary) DIFFERENCE
from EMP

--3. Display the total number of employees hired before 1st January, 1991.

Select Count(EID) Hired_Before_1991 
from EMP
Where JoiningDate < '1991-01-01'

--PART-C--------------------------------------

--1. Count the number of employees living in Rajkot or Baroda.

Select Count(EID) Employee_Count 
from EMP
where city IN('Rahkot','Baroda')

--2. Display the total number of employees hired before 1st January, 1991 in IT department. 

Select Count(EID) Employee_Count 
from EMP
where Department = 'IT' And JoiningDate < '1991-01-01'

--3. Find the Joining Date wise Total Salaries. Expected Output: (Will show 15 distinct rows since no two employees share a joining date in this data)

Select JoiningDate,Sum(Salary) Total_Salary 
from EMP
group by JoiningDate

--4. Find the Maximum salary department & city wise in which city name starts with ‘R’.

Select Department,City,Max(Salary) Max_Salary 
from EMP
where city like 'R%'
group by Department,City

--SALES_DATA----------------------------------------

--PART-A--------------------------------------------

--1. Display Total Sales Amount by Region.

Select Region,sum(Sales_Amount) Total_Sales 
from SALES_DATA
group by Region

--2. Display Average Sales Amount by Product.

Select Product,Avg(Sales_Amount) Average_Sales  
from SALES_DATA
group by Product

--3. Display Maximum Sales Amount by Year. 

Select Year,Max(Sales_Amount) Max_Sales   
from SALES_DATA
group by Year

--4. Display Minimum Sales Amount by Region and Year. 

Select Region,Year,Min(Sales_Amount) Min_Sales    
from SALES_DATA
group by Region,Year

--5. Count of Products Sold by Region.

Select Region,Count(Product) Product_Count     
from SALES_DATA
group by Region

--6. Display Sales Amount by Year and Product.

Select Year,Product,Count(Sales_Amount) Total_Sales      
from SALES_DATA
group by Year,Product

--7. Display Regions with Total Sales Greater Than 5000.

Select Region,Sum(Sales_Amount) Total_Sales      
from SALES_DATA
group by Region
Having Sum(Sales_Amount) > 5000

--8. Display Products with Average Sales Less Than 10000.

Select Product,Avg(Sales_Amount) Average_Sales       
from SALES_DATA
group by Product
Having Avg(Sales_Amount) < 10000

--9. Display Years with Maximum Sales Exceeding 500.

Select Year,Max(Sales_Amount) Max_Sales        
from SALES_DATA
group by Year
Having Max(Sales_Amount) > 500

--10. Display Regions with at Least 3 Distinct Products Sold.

Select Region,Count(Distinct Product) Distinct_Products         
from SALES_DATA
group by Region
Having Count(Distinct Product) > 3

--11. Display Years with Minimum Sales Less Than 1000.

Select Year,Min(Sales_Amount) Min_Sales          
from SALES_DATA
group by Year
Having Min(Sales_Amount) < 1000

--12. Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount.

Select Region,Sum(Sales_Amount) Total_Sales_2023           
from SALES_DATA
where year = '2023'
group by Region
Order by Sum(Sales_Amount)

--13. Find the Region Where 'Mobile' Had the Lowest Total Sales Across All Years.

Select top 1 Region,Sum(Sales_Amount) Total_Mobile_Sales            
from SALES_DATA
where Product = 'Mobile'
group by Region
order by Sum(Sales_Amount)

--14. Find the Product with the Highest Sales Across All Regions in 2023.

Select top 1 Product,Sum(Sales_Amount) Total_Sales_2023            
from SALES_DATA
where Year = '2023'
group by Product
order by Sum(Sales_Amount) desc

--15. Find Regions Where 'TV' Sales in 2023 Were Greater Than 1000.

Select Region,Sum(Sales_Amount) TV_Sales_2023             
from SALES_DATA
where Product = 'TV' and year = '2023'
group by Region
having Sum(Sales_Amount) > 1000

--PART-B---------------------------------------------

--1. Display Count of Orders by Year and Region, Sorted by Year and Region.

Select Year,Region,count(PRODUCT) Order_Count 
from SALES_DATA
group by year,Region
Order by year,Region

--2. Display Regions with Maximum Sales Amount Exceeding 1000 in Any Year, Sorted by Region.

Select Region,Max(Sales_Amount) Max_Sale  
from SALES_DATA
group by Region
having Max(Sales_Amount) > 1000
Order by Region

--3. Display Years with Total Sales Amount Less Than 10000, Sorted by Year Descending.

Select Year,Sum(Sales_Amount) Max_Sale  
from SALES_DATA
group by Year
having Sum(Sales_Amount) < 10000
Order by Year desc

--4. Display Top 3 Regions by Total Sales Amount in Year 2024.

Select top 3 Region,Sum(Sales_Amount) Total_Sales_2024   
from SALES_DATA
where Year = '2024'
group by Region

--5. Find the Year with the Lowest Total Sales Across All Regions.

Select top 1 Year,Sum(Sales_Amount) Total_Sales_2024   
from SALES_DATA
group by Year
order by Sum(Sales_Amount)

--Part – C

--1. Display Products with Average Sales Amount Between 1000 and 2000, Ordered by Product Name. 

select
	Product,
	avg(Sales_Amount)
from
	SALES_DATA
group by
	Product
having
	avg(Sales_Amount) between 1000 and 2000
order by
	Product

--2. Display Years with More Than 1 Orders from Each Region.

select
	Year
from
	SALES_DATA
group by
	Year
having
	count(Sales_Amount) > 1

--3.Display Regions with Average Sales Amount Above 1500 in Year 2023 sort by amount in descending.

select
	Region,
	avg(Sales_Amount)
from
	SALES_DATA
where
	Year = 2023
group by
	Region
having
	avg(Sales_Amount) > 1500
order by
	avg(Sales_Amount) desc

--4. Find out region wise duplicate product.

select
	Region,
	product,
	count(product) Occurrences 
from
	SALES_DATA
group by
	Region,
	product
having
	count(product) > 1

--5. Find out year wise duplicate product.

select
	year,
	product,
	count(product) Occurrences 
from
	SALES_DATA
group by
	year,
	product
having
	count(product) > 1