-- Create the DEPT table first, as PERSON depends on it
CREATE TABLE DEPT (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE,
    DepartmentCode VARCHAR(50) NOT NULL UNIQUE,
    Location VARCHAR(50) NOT NULL
);

-- Create the PERSON table with a Foreign Key
CREATE TABLE PERSON (
    PersonID INT PRIMARY KEY,
    PersonName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    Salary DECIMAL(8, 2) NOT NULL,
    JoiningDate DATE NOT NULL,
    City VARCHAR(100) NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES DEPT(DepartmentID)
);

-- Insert data into the DEPT table
INSERT INTO DEPT (DepartmentID, DepartmentName, DepartmentCode, Location)
VALUES
(1, 'Admin', 'Adm', 'A-Block'),
(2, 'Computer', 'CE', 'C-Block'),
(3, 'Civil', 'CI', 'G-Block'),
(4, 'Electrical', 'EE', 'E-Block'),
(5, 'Mechanical', 'ME', 'B-Block'),
(6, 'Marketing', 'Mkt', 'F-Block'),
(7, 'Accounts', 'Acc', 'A-Block');

-- Insert data into the PERSON table
INSERT INTO PERSON (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City)
VALUES
(101, 'Rahul Tripathi', 2, 56000.00, '2000-01-01', 'Rajkot'),
(102, 'Hardik Pandya', 3, 18000.00, '2001-09-25', 'Ahmedabad'),
(103, 'Bhavin Kanani', 4, 25000.00, '2000-05-14', 'Baroda'),
(104, 'Bhoomi Vaishnav', 1, 39000.00, '2005-02-08', 'Rajkot'),
(105, 'Rohit Topiya', 2, 17000.00, '2001-07-23', 'Jamnagar'),
(106, 'Priya Menpara', NULL, 9000.00, '2000-10-18', 'Ahmedabad'),
(107, 'Neha Sharma', 2, 34000.00, '2002-12-25', 'Rajkot'),
(108, 'Nayan Goswami', 3, 25000.00, '2001-07-01', 'Rajkot'),
(109, 'Mehul Bhundiya', 4, 13500.00, '2005-01-09', 'Baroda'),
(110, 'Mohit Maru', 5, 14000.00, '2000-05-25', 'Jamnagar'),
(111, 'Alok Nath', 2, 36000.00, '2003-03-15', 'Ahmedabad'),
(112, 'Seema Jain', 3, 28000.00, '2002-06-18', 'Baroda'),
(113, 'Karan Singh', 1, 41000.00, '2004-11-30', 'Rajkot'),
(114, 'Riya Gupta', 5, 16000.00, '2001-02-12', 'Ahmedabad'),
(115, 'Suresh Patel', 7, 32000.00, '2003-08-20', 'Jamnagar'),
(116, 'Meena Kumari', 7, 30000.00, '2004-01-01', 'Rajkot'),
(117, 'Vikram Batra', NULL, 11000.00, '2005-04-05', 'Baroda');

--Part – A

--1. Combine information from Person and Department table using cross join or Cartesian product.

select 
	p.*, 
	d.* 
from PERSON p
cross join DEPT d

--2. Find all persons with their department name.

select 
	p.PersonName, 
	d.DepartmentName 
from PERSON p
join DEPT d
on p.DepartmentID = d.DepartmentID

--3. Find all persons with their department name & code.

select 
	p.PersonName, 
	d.DepartmentName,
	d.DepartmentCode
from PERSON p
join DEPT d
on p.DepartmentID = d.DepartmentID

--4. Find all persons with their department code and location.

select 
	p.PersonName, 
	d.DepartmentName,
	d.Location
from PERSON p
join DEPT d
on p.DepartmentID = d.DepartmentID

--5. Find the detail of the person who belongs to Mechanical department.

select 
	p.*
from PERSON p
join DEPT d
on p.DepartmentID = d.DepartmentID
where 
	d.DepartmentName = 'Mechanical'

--6. Final person’s name, department code and salary who lives in Ahmedabad city.

select 
	p.PersonName,
	d.DepartmentCode,
	P.Salary
from PERSON p
join DEPT d
on p.DepartmentID = d.DepartmentID
where 
	p.city = 'Ahmedabad'

--7. Find the person's name whose department is in C-Block. 

select 
	p.PersonName
from PERSON p
join DEPT d
on p.DepartmentID = d.DepartmentID
where 
	d.Location = 'C-Block'

--8. Retrieve person name, salary & department name who belongs to Jamnagar city. 

select 
	p.PersonName,
	P.Salary,
	d.DepartmentName
from PERSON p
join DEPT d
on p.DepartmentID = d.DepartmentID
where 
	p.city = 'Jamnagar'

--9. Retrieve person’s detail who joined the Civil department after 1-Aug-2001.

select 
	p.*
from PERSON p
join DEPT d
on p.DepartmentID = d.DepartmentID
where 
	d.DepartmentName = 'Civil' 
	and
	JoiningDate > '2001-08-01'

--10. Display all the person's name with the department whose joining date difference with the current date is more than 365 days.

select 
	p.PersonName,
	d.DepartmentName
from PERSON p
join DEPT d
on p.DepartmentID = d.DepartmentID
where 
	JoiningDate < getdate()

--11. Find department wise person counts.

select 
	d.DepartmentName,
	count(p.PersonName)
from PERSON p
join DEPT d
on p.DepartmentID = d.DepartmentID
group by 
	d.DepartmentName

--12. Give department wise maximum & minimum salary with department name.

select 
	d.DepartmentName,
	max(p.Salary) MaxSalary,
	min(p.Salary)MinSalary 
from PERSON p
join DEPT d
on p.DepartmentID = d.DepartmentID
group by 
	d.DepartmentName

--13. Find city wise total, average, maximum and minimum salary. 

select 
	p.City,
	sum(p.Salary) TotalSalary,
	avg(p.Salary) AvgSalary,
	max(p.Salary) MaxSalary,
	min(p.Salary) MinSalary
from PERSON p
join DEPT d
on p.DepartmentID = d.DepartmentID
group by 
	p.City

--14. Find the average salary of a person who belongs to Ahmedabad city.

select 
	avg(p.Salary) AvgSalary_Ahmedabad 
from PERSON p
join DEPT d
on p.DepartmentID = d.DepartmentID
where
	p.City = 'Ahmedabad'
group by 
	p.City

--15. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department.

select
	p.PersonName + ' lives in ' + p.City + ' and works in ' + d.DepartmentName + ' Department.' AS PersonDetails                                                 
from PERSON p
join DEPT d
on p.DepartmentID = d.DepartmentID


--Part – B
--1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly.

select
	CONCAT(p.PersonName,' earns ',p.Salary,' from ', d.DepartmentName, ' department monthly.') AS SalaryDetails
	--p.PersonName + ' earns ' + cast(p.Salary as varchar) + ' from ' + d.DepartmentName + ' department monthly.' AS SalaryDetails                                                 
from PERSON p
join DEPT d
on p.DepartmentID = d.DepartmentID

--2. Find city & department wise total, average & maximum salaries.

select 
	p.City,
	d.DepartmentName,
	sum(p.Salary) TotalSalary,
	avg(p.Salary) AvgSalary,
	min(p.Salary) MinSalary
from PERSON p
join DEPT d
on p.DepartmentID = d.DepartmentID
group by 
	p.City,
	d.DepartmentName

--3. Find all persons who do not belong to any department. 

select *
from PERSON
where
	DepartmentID is null

--4. Find all departments whose total salary is exceeding 100000.

select 
	d.DepartmentName,
	sum(p.Salary) TotalSalary
from PERSON p
join DEPT d
on p.DepartmentID = d.DepartmentID
group by 
	d.DepartmentName
having
	sum(p.Salary) > 100000

--Part – C

--1. List all departments who have no person.

select
	d.DepartmentName
from PERSON p
right join DEPT d
on p.DepartmentID = d.DepartmentID
group by 
	d.DepartmentName,
	p.DepartmentID
having
	count(p.DepartmentID) = 0

--2. List out department names in which more than two persons are working. 

select
	d.DepartmentName,
	count(p.DepartmentID) PersonCount 
from PERSON p
right join DEPT d
on p.DepartmentID = d.DepartmentID
group by 
	d.DepartmentName,
	p.DepartmentID
having
	count(p.DepartmentID) > 2

--3. Give a 10% increment in the computer department employee’s salary. (Use Update).
-- This is an UPDATE query. To verify your work, run a SELECT query on the PERSON table for 
-- the 'Computer' department before and after your UPDATE.

update PERSON
set Salary = Salary + 0.1*Salary

from PERSON p
join DEPT d
on p.DepartmentID = d.DepartmentID
where d.DepartmentName = 'Computer'

select 
	p.PersonName,
	p.salary
from PERSON p
join DEPT d
on p.DepartmentID = d.DepartmentID
where d.DepartmentName = 'Computer'


---------------------------------------------------------------------------
-----------
---------------------------------------------------------------------------

--Advanced SQL Joins

--Part 1: Book & Author Schema

-- Create Author table
CREATE TABLE Author (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100) NOT NULL,
    Country VARCHAR(50) NULL
);

-- Create Publisher table
CREATE TABLE Publisher (
    PublisherID INT PRIMARY KEY,
    PublisherName VARCHAR(100) NOT NULL UNIQUE,
    City VARCHAR(50) NOT NULL
);

-- Create Book table with Foreign Keys
CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    AuthorID INT NOT NULL,
    PublisherID INT NOT NULL,
    Price DECIMAL(8, 2) NOT NULL,
    PublicationYear INT NOT NULL,
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID)
);

-- Insert into Author
INSERT INTO Author (AuthorID, AuthorName, Country)
VALUES
(1, 'Chetan Bhagat', 'India'),
(2, 'Arundhati Roy', 'India'),
(3, 'Amish Tripathi', 'India'),
(4, 'Ruskin Bond', 'India'),
(5, 'Jhumpa Lahiri', 'India'),
(6, 'Paulo Coelho', 'Brazil'),
(7, 'Sudha Murty', 'India'),
(8, 'Vikram Seth', 'India'),
(9, 'Kiran Desai', 'India'); -- Author with no books

-- Insert into Publisher
INSERT INTO Publisher (PublisherID, PublisherName, City)
VALUES
(1, 'Rupa Publications', 'New Delhi'),
(2, 'Penguin India', 'Gurugram'),
(3, 'HarperCollins India', 'Noida'),
(4, 'Aleph Book Company', 'New Delhi'),
(5, 'Westland', 'Chennai');

-- Insert into Book
INSERT INTO Book (BookID, Title, AuthorID, PublisherID, Price, PublicationYear)
VALUES
(101, 'Five Point Someone', 1, 1, 250.00, 2004),
(102, 'The God of Small Things', 2, 2, 350.00, 1997),
(103, 'Immortals of Meluha', 3, 3, 300.00, 2010),
(104, 'The Blue Umbrella', 4, 1, 180.00, 1980),
(105, 'The Lowland', 5, 2, 400.00, 2013),
(106, 'Revolution 2020', 1, 1, 275.00, 2011),
(107, 'Sita: Warrior of Mithila', 3, 3, 320.00, 2017),
(108, 'The Room on the Roof', 4, 4, 200.00, 1956),
(109, 'A Suitable Boy', 8, 2, 600.00, 1993),
(110, 'Scion of Ikshvaku', 3, 5, 350.00, 2015),
(111, 'Wise and Otherwise', 7, 2, 210.00, 2002),
(112, '2 States', 1, 1, 260.00, 2009);

------------------------------------------------------------------------------
--Part – A: Book Queries

--1. List all books with their authors.

select 
	b.Title,
	o.AuthorName
from Book b
join Author o
on b.AuthorID = o.AuthorID

--2. List all books with their publishers.

select 
	b.Title,
	p.PublisherName
from Book b
join Publisher p
on b.PublisherID = p.PublisherID

--3. List all books with their authors and publishers.

select 
	b.Title,
	o.AuthorName,
	p.PublisherName
from Book b
join Author o
on b.AuthorID = o.AuthorID
join Publisher p
on b.PublisherID = p.PublisherID

--4. List all books published after 2010 with their authors and publisher and price.

select 
	b.Title,
	o.AuthorName,
	p.PublisherName,
	b.Price
from Book b
join Author o
on b.AuthorID = o.AuthorID
join Publisher p
on b.PublisherID = p.PublisherID
where
	b.PublicationYear > 2010

--5. List all authors and the number of books they have written.

select 
	o.AuthorName,
	count(b.Title) NumberOfBooks
from Book b
right join Author o
on b.AuthorID = o.AuthorID
group by
	o.AuthorName

--6. List all publishers and the total price of books they have published.

select 
	p.PublisherName,
	sum(b.Price) TotalPrice
from Book b
join Publisher p
on b.PublisherID = p.PublisherID
group by
	p.PublisherName

--7. List authors who have not written any books. 

select
	o.AuthorName
from Author o
left join Book b
on o.AuthorID = b.AuthorID
group by
	o.AuthorName
having 
	count(b.BookID) = 0

--8. Display total number of Books and Average Price of every Author.

select
	o.AuthorName,
	count(b.BookID),
	avg(b.Price)
from Author o
left join Book b
on o.AuthorID = b.AuthorID
group by
	o.AuthorName

--9. lists each publisher along with the total number of books they have published, sorted from highest to lowest. 

select
	p.PublisherName,
	count(b.PublisherID) BookCount 
from Publisher p
join book b
on b.PublisherID = p.PublisherID
group by
	p.PublisherName
order by
	count(b.PublisherID)

--10. Display number of books published each year. 

select
	b.PublicationYear,
	count(b.BookID) NumberOfBooks 
from Publisher p
join Book b
on b.PublisherID = p.PublisherID
group by
	b.PublicationYear

------------------------------------------------------------------------------
--Part – B: Book Queries

--1. List the publishers whose total book prices exceed 500, ordered by the total price.

select
	p.PublisherName,
	sum(b.Price) TotalPrice 
from Publisher p
join Book b
on b.PublisherID = p.PublisherID
group by
	p.PublisherName
having
	sum(b.Price) > 500
order by
	sum(b.Price)

--2. List most expensive book for each author, sort it with the highest price.

with maxBook as(
	select 
		o.AuthorName,
		o.AuthorID,
		max(b.Price) Price
	from Author o
	join Book b
	on o.AuthorID = b.AuthorID
	group by
		o.AuthorName,
		o.AuthorID
)
select
	mb.AuthorName,
	b.Title,
	mb.Price
from maxBook mb
join Book b
on b.Price = mb.Price
where mb.AuthorID = b.AuthorID
order by Price desc

--------------------------------------------------------------------------
--Part – C: Employee & Location Schema

--1. Create Table Schema Your first task is to create the database structure.
--Implement the following 6-table schema. You must define all Primary Key, Foreign Key, and other 
--constraints necessary to make the database functional and maintain data integrity.

-- ============================
--   1. Country Table
-- ============================
CREATE TABLE Country (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL
);

-- ============================
--   2. State Table
-- ============================
CREATE TABLE State (
    Sid INT PRIMARY KEY,
    Sname VARCHAR(50) NOT NULL,
    Cid INT,
    FOREIGN KEY (Cid) REFERENCES Country(Cid)
);

-- ============================
--   3. District Table
-- ============================
CREATE TABLE District (
    Did INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL,
    Sid INT,
    FOREIGN KEY (Sid) REFERENCES State(Sid)
);

-- ============================
--   4. Department Table
-- ============================
CREATE TABLE Dept_info (
    Did INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL
);

-- ============================
--   5. City Table
-- ============================
CREATE TABLE City_info (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL,
    Did INT,
    FOREIGN KEY (Did) REFERENCES District(Did)
);
select * from City_info

-- ============================
--   6. Employee Table
-- ============================
CREATE TABLE Emp_info (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(50),
    Did INT,
    Cid INT,
    Salary DECIMAL(10,2),
    Experience INT,
    FOREIGN KEY (Did) REFERENCES Dept_info(Did),
    FOREIGN KEY (Cid) REFERENCES City_info(Cid)
);	

INSERT INTO Country VALUES
(1, 'India'),
(2, 'USA'),
(3, 'Canada'),
(4, 'Japan'),
(5, 'Australia');

INSERT INTO State VALUES
(101, 'Gujarat', 1),
(102, 'Maharashtra', 1),
(103, 'California', 2),
(104, 'Ontario', 3),
(105, 'Tokyo', 4);

INSERT INTO District VALUES
(201, 'Ahmedabad', 101),
(202, 'Surat', 101),
(203, 'Los Angeles', 103),
(204, 'Toronto', 104),
(205, 'Shinjuku', 105);

INSERT INTO Dept_info VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Operations');

INSERT INTO City_info VALUES
(301, 'Navrangpura', 201),
(302, 'Vesu', 202),
(303, 'Downtown LA', 203),
(304, 'North York', 204),
(305, 'Tokyo City', 205);

INSERT INTO Emp_info VALUES
(1001, 'Raj Patel', 1, 301, 45000, 3),
(1002, 'Amit Shah', 2, 302, 52000, 5),
(1003, 'John Carter', 3, 303, 70000, 7),
(1004, 'Emily Ross', 4, 304, 65000, 4),
(1005, 'Kenji Sato', 5, 305, 80000, 8);

select
	emp.Ename EmpName,
	dep.Dname DeptName,
	emp.Salary,
	emp.Experience,
	city.Cname CityName,
	d.Dname DistrictName,
	s.Sname StateName,
	c.Cname CountryName

from Emp_info emp
join City_info city
on emp.Cid = city.Cid

join Dept_info dep
on emp.Did = dep.Did

join District d
on city.Did = d.Did

join State s
on d.Sid = s.Sid

join Country c
on s.Cid = c.Cid

 