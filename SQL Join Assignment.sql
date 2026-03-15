create database assignment;
use assignment;
## table 1 customers
create table customers(CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(50),
City  VARCHAR(30));

Select * from customers;

INSERT INTO CUSTOMERS(CustomerID, CustomerName, City)
VAlues (1, "John Smith", "New york"),
       (2, "Mary Johnson", "Chicago"),
       (3, "Peter Adams", "Los Angeles"),
       (4, "Nancy Miller", "Houston"),
       (5, "Robert White", "Miami");
       
Select * from customers;

## table 2 Orders 
 create table Orders (OrderID INT PRIMARY KEY,
 CustomerID INT ,
 OrderDate DATE ,
 Amount INT );
 
 SELECT * FROM ORDERS;
 
 INSERT INTO ORDERS(OrderID, CustomerID, OrderDate, Amount)
 VAlues (101, 1, "2024-10-01", 250),
        (102, 2, "2024-10-05", 300),
        (103, 1, "2024-10-07", 150),
        (104, 3, "2024-10-10", 450),
        (105, 6, "2024-10-12", 400);
        
 SELECT * FROM ORDERS;
 
 ## table 3 Payments 
 
 Create table Payments(PaymentsID  CHAR(20) PRIMARY KEY,
 CustomerID INT,
PaymentDate Date,
Amount INT);
Select * from Payments;

INSERT INTO PAYMENTS(PaymentsID, CustomerID, PaymentDate, Amount)
Values("P001", 1, "2024-10-02", 250),
	  ("P002", 2, "2024-10-06", 300),
      ("P003", 3, "2024-10-11", 450),
      ("P004", 4, "2024-10-15", 200);
      
Select * from Payments;

## table 4 Employees
Create table Employees(EmployeeID INT PRIMARY KEY,
EmployeeName Varchar(50),
ManagerID INT);

Select * from Employees;

insert into employees(EmployeeID, EmployeeName, ManagerID)
Values (1, "Alex Green", NULL),
       (2, "Brian Lee", 1),
       (3, "Carol Ray", 1),
       (4, "David Kim", 2),
       (5, "Eva Smith", 2);
       
Select * from Employees;
## Question 1. Retrieve all customers who have placed at least one order.
Select * from Customers C
Left Join Orders O 
on c.CustomerID = O.CustomerID
where o.CustomerID <= 1;

##Question 2. Retrieve all customers and their orders, including customers who have not placed any orders.
SELECT C.CustomerID, C.CustomerName, O.OrderID
FROM Customers C
LEFT JOIN Orders O
ON C.CustomerID = O.CustomerID;

## Question 3. Retrieve all orders and their corresponding customers, including orders placed by unknown customers..
Select * from Orders O
left join Customers C
on O.customerID = C.customerID;
## OR
SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID
FROM Customers
RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

## Question 4. Display all customers and orders, whether matched or not.
SELECT C.CustomerID, C.CustomerName, O.OrderID
FROM Customers C
JOIN Orders O
ON C.CustomerID = O.CustomerID;

##Question 5. Find customers who have not placed any orders.
SELECT C.CustomerID, C.CustomerName
FROM Customers C
LEFT JOIN Orders O
ON C.CustomerID = O.CustomerID
WHERE O.OrderID IS NULL;

##Question 6. Retrieve customers who made payments but did not place any orders.
SELECT Distinct Customers.CustomerID, Customers.CustomerName
FROM Customers
JOIN Payments 
ON Customers.CustomerID = Payments.CustomerID
LEFT JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL;

##Question 7. Generate a list of all possible combinations between Customers and Orders.
SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID
FROM Customers
CROSS JOIN Orders;

##Question 8. Show all customers along with order and payment amounts in one table.
SELECT C.CustomerID, C.CustomerName, 
O.OrderID, O.Amount ,
P.PaymentID, P.Amount
FROM Customers C
LEFT JOIN Orders O
ON C.CustomerID = O.CustomerID
LEFT JOIN Payments 
ON C.CustomerID = P.CustomerID;

##Question 9. Retrieve all customers who have both placed orders and made payments.
SELECT Distinct Customers.CustomerID, Customers.CustomerName
FROM Customers
JOIN Payments 
ON Customers.CustomerID = Payments.CustomerID
LEFT JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID;

