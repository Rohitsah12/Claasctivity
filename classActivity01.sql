create database classActivity01;
use classActivity01;

create table productLines(
productline VARCHAR(50) PRIMARY KEY,
textDescription VARCHAR(4000),
htmlDescription mediumtext,
image MEDIUMBLOB
);
select * from productLines;
create table products(
productCode VARCHAR(15) PRIMARY KEY,
productName VARCHAR(70) NOT NULL,
productLine VARCHAR(50),
productScale VARCHAR(10) NOT NULL,
productVendor VARCHAR(50) NOT NULL,
productDescription TEXT NOT NULL,
quantityInStock SMALLINT NOT NULL,
buyPrice DECIMAL(10, 2) NOT NULL,
MSRP DECIMAL(10, 2) NOT NULL,
constraint fk foreign key (productLine)
references productlines(productLine)
);
drop table products;
create table employees(
employeeNumber INT PRIMARY KEY,
lastName VARCHAR(50) NOT NULL,
firstName VARCHAR(50) NOT NULL,
extension VARCHAR(10) NOT NULL,
email VARCHAR(100) NOT NULL,
officeCode VARCHAR(10),
reportsTo int,
jobTitle varchar(50) NOT NULL,
constraint gk foreign key (officeCode)
references offices(officeCode),
constraint rk foreign key (reportsTo)
references employees(employeeNumber)
);

create table offices(
officeCode VARCHAR(10) PRIMARY KEY,
city VARCHAR(50) NOT NULL,
phone VARCHAR(50) NOT NULL,
addressLine1 VARCHAR(50) NOT NULL,
addressLine2 VARCHAR(50),
state VARCHAR(50),
country VARCHAR(50) NOT NULL,
postalCode VARCHAR(15) NOT NULL,
territory VARCHAR(10) NOT NULL
);

create table customers(
customerNumber INT PRIMARY KEY,
customerName VARCHAR(50) NOT NULL,
contactLastName VARCHAR(50) NOT NULL,
contactFirstName VARCHAR(50) NOT NULL,
phone VARCHAR(50) NOT NULL,
addressLine1 VARCHAR(50) NOT NULL,
addressLine2 VARCHAR(50),
city VARCHAR(50) NOT NULL,
state VARCHAR(50),
postalCode VARCHAR(15),
country VARCHAR(50) NOT NULL,
salesRepEmployeeNumber INT, 
creditLimit DECIMAL(10, 2),
constraint hk foreign key (salesRepEmployeeNumber)
references employees(employeeNumber)
);


create table orders(
orderNumber INT PRIMARY KEY,
orderDate DATE NOT NULL,
requiredDate DATE NOT NULL,
shippedDate DATE,
status VARCHAR(15) NOT NULL,
comments TEXT,
customerNumber INT,
constraint lk foreign key (customerNumber)
references customers(customerNumber)
);

create table orderDetails(
orderNumber INT,
productCode VARCHAR(15),
quantityOrdered INT NOT NULL,
priceEach DECIMAL(10, 2) NOT NULL,
orderLineNumber SMALLINT NOT NULL,
primary key(orderNumber,productCode),
constraint qk foreign key (orderNumber)
					references orders(orderNumber),
constraint mk foreign key (productCode)
					references products(productCode)
);

create table payments(
customerNumber INT,
checkNumber VARCHAR(50) PRIMARY KEY,
paymentDate DATE NOT NULL,
amount DECIMAL(10, 2) NOT NULL,
constraint ak foreign key (customerNumber)
					references customers(customerNumber)
);