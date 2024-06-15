--1. Clearly identify the duties you have assigned to the individual members.

--2. Clearly title and identify the tables required, the data you are capturing, and what type each of the attribute is

-- 3. code block containing only valid sql syntax which will create our sample data base.
-- Creating Author table
CREATE TABLE Authors (
    Author_id INT PRIMARY KEY,
    Author_name VARCHAR(255) NOT NULL,
    Author_type TEXT,
    Autor_DOB DATE
);


-- create publisher table 
CREATE TABLE Publisher (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(255) NOT NULL,
    Publisher_contact int,
    Publisher_email VARCHAR(255)
);



-- create a table for books information

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    book_title VARCHAR(255) NOT NULL,
    book_genre VARCHAR(100),
    Author_id INT,
    publisher_id INT,
    publication_date DATE,
    format ENUM('physical', 'ebook', 'audiobook'),
    book_cost DECIMAL(10, 2),
    FOREIGN KEY (Author_id) REFERENCES Authors(Author_id),
    FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id)
);



-- create a customer table to show the customers who have purchased the books
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    customer_email VARCHAR(255),
    Customer_phone VARCHAR(20),
    register_date DATE
);



-- create a order details of customers
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    Order_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);



-- create a table to provide order items
CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    order_quantity INT,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);




-- Create a table to add customer review details
CREATE TABLE Review (
    review_id INT PRIMARY KEY,
    book_id INT,
    customer_id INT,
    Customer_rating INT,
    Customer_comments TEXT,
    review_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);




--- ADD DATA INTO EACH TABLES

-- Add data into Author table
insert into Authors(Author_id,Author_name, Author_type, Autor_DOB) VALUES
(1,'Dab Brown','Fiction Author','1978-12-27'),
(2,'Wilbur Smith','African Novelist','1960-03-21'),
(3,'Sydney Sheldon','American Writer','1956-06-02'),
(4, 'Jeffery Archur','Clifton Chronicles','1968-03-31'),
(5,'Conan Doyle','Crime Thriller','1891-09-12'),
(6, 'Agatha Christy','Suspense Thriller','1845-10-13'),
(7,'R R Tolkein','Fantasy adventure','1788-8-25'),
(8,'J K Rowling','Harry Poter Franchise','1970-10-26'),
(9,'Alex Michaelieds','Psychological Thriller','1977-09-04'),
(10,'James Patterson','Detective Novel','1947-08-17'); 

-- Verify the data inserted in Author
select * from Authors;


-- Insert data into publisher table
insert into Publisher (publisher_id,publisher_name,Publisher_contact,Publisher_email) VALUES
(100,'HarperCollins',2127829000,'HarperCollins@gmail.com'),
(101,'Scholastic',1378961231,'Scholastic01@gmail.com'),
(102,'Wiley',123456781,'Wiley2007@gmailcom'),
(103,'MIT Press',1876543210,'mitpress1@gmail.com'),
(104,'Hachette Book',2124387234,'Hachetteb24@gmail.com'),
(105,'Simon & Schuster',1998887777,'snspublish55@gmail.com'),
(106,'Macmillan',2096528900,'Macmillan@gmail.com'),
(107,'Lippincott Co.',1765599908,'Lippincottco1@gmail.com'),
(108,'Henneberry',1901557870,'Henneberry@gmail.com'),
(109,'Griffith',0967538277,'Griffith9987@gmailcom');

-- Verify publisher data
select * from Publisher;

-- Add data into book table
insert into Books(book_id,book_title,book_genre,Author_id,publisher_id,publication_date,format,book_cost) VALUES
(1000,'Pride and Prejudice','Fiction',1,100,'1813-01-28','physical',13.99),
(1001,'Harry Potter and the prisoner of Askaban','Fantasy',4, 105,'1999-06-26','physical',24.99),
(1002,'The Adventures of Tom Sawyer','Fiction',2,101,'1876-06-17', 'ebook', 9.99),
(1003,'1984','Science Fiction',3,102,'1949-06-08', 'audiobook', 19.99),
(1004,'Murder on the Orient Express','Mystery',4,100,'1934-01-01', 'physical', 12.98),
(1005,'Mrs. Dalloway','Fiction',5,102,'1925-05-14', 'ebook', 7.99),
(1006,'Danvinci Code','Fiction',1,104,'2008-12-12','physical',38.90),
(1007,'Inferno','Fiction',1,100,'2013-01-01','ebook',30.08),
(1008,'Twenty Thousand Leagues Under the Sea','Adventure',10,108,'1870-01-01', 'audiobook', 12.99),
(1009,'The Shining','Horror',5,106,'1977-01-28', 'ebook', 11.99);

-- verify book data
select * from Books;

-- add Customers details
insert into Customers(customer_id,customer_name,customer_email,Customer_phone,register_date) VALUES
(5000,'Bob Smith','bob.smith@example.com',1234567890,'2001-01-01'),
(5001,'Frank Black','frank.black@example.com',2134567789,'2002-08-10'),
(5002,'Ivy Clark','ivy.clark@example.com',1123456789,'2009-12-31'),
(5003,'Jack Davis','jack.davis@example.com',2067359876,'2024-01-13'),
(5004,'Leo Wilson', 'leo.wilson@example.com',1987529650,'2022-10-19'),
(5005,'Paul Walker', 'paul.walker@example.com',1111764444,'2020-02-26'),
(5006,'Quinn Hall', 'quinn.hall@example.com',2117338900,'2016-08-25'),
(5007,'Noah Robinson', 'noah.robinson@example.com',2007739754,'2012-11-01'),
(5008,'Tina Young', 'tina.young@example.com',2222220000,'2015-06-05'),
(5009,'Ruth Adams', 'ruth.adams@example.com',1122334455,'2023-12-26');

-- view the details of the customers
select * from Customers;


-- add data into Orders
insert into Orders(order_id,customer_id,order_date,Order_amount)VALUES
(7000,5000,'2023-01-15', 112.37),
(7001,5003,'2023-03-17', 10.01),
(7002,5005,'2023-05-19', 49.98),
(7003,5005,'2023-07-03', 167.65),
(7004,5009,'2023-07-21', 45.98),
(7005,5003,'2023-09-23', 13.11),
(7006,5008,'2023-10-24', 79.29),
(7007,5006,'2023-12-26', 75.49),
(7008,5008,'2023-02-28', 15.10),
(7009,5003,'2023-08-04', 41.09);

-- check order details
select * from Orders;

-- insert data into OrderItems
insert into OrderItems(order_item_id,order_id,book_id,order_quantity,total_price) VALUES
(9000,7000,1001,2,49.88),
(9001,7000,1003,3,62.49),
(9002,7003,1001,5,105.66),
(9003,7005,1004,1,13.11),
(9004,7006,1006,2,79.29),
(9005,7008,1001,1,25.10),
(9006,7009,1008,3,41.09),
(9007,7003,1007,2,61.99),
(9008,7001,1002,1,10.01),
(9009,7007,1000,5,75.49);

-- view order item data
select * from OrderItems;


-- insert data into Review table
insert into Review(review_id,book_id,customer_id,Customer_rating,Customer_comments,review_date) VALUES
(11000,1000,5001,5,'An absolute classic','2024-06-01'),
(12000,1000,5006,5,'A masterpiece','2024-06-07'),
(13000,1000,5008,4,'beautifully written novel','2024-06-02'),
(14000,1003,5002,3,'Average Story teller','2024-06-12'),
(15000,1006,5009,1,'Waste of time','2024-04-10'),
(16000,1009,5000,5,'must read','2024-03-21'),
(17000,1006,5001,3,'Not up to the mark','2024-02-28'),
(18000,1004,5005,2,'not recommended','2024-06-02'),
(19000,1007,5007,4,'good','2024-05-31'),
(20000,1003,5009,4,'A thrilling and imaginative journey','2024-06-04');

-- Check the review data
select * from Review;



-- 4. DENTIFYING 1 COMPLETE SET OF DDL/DML FOR THE TABLES BOOKS
-- 4.1. Extracting the data for the book id 1001
select * from Books 
where book_id=1001;

-- 4.2. Update the cost of one of the book with id 1000 and view the updates
UPDATE Books 
set publication_date='2010-05-12' 
where book_id=1000;

select * from Books 
where book_id=1000;

-- 4.3. Add one extra row to the books data and check the number of rows in table
insert into Books(book_id,book_title,book_genre,Author_id,publisher_id,publication_date,format,book_cost) VALUES
(1010,'Pride','Science Fiction',1,100,'1813-03-28','physical',17.99);

select COUNT(*) from Books;   --- the result will show 11 rows as new row have been added

-- 4.4. delete one row from Books table and then check the number of rows
DELETE FROM Books where book_id=1010;
select COUNT(*) from Books;   --- the result will show 10 rows as a row have been deleted



-- 5. SQL QUERIES FOR THE BELOW LISTED REQUIREMENTS.
-- 5.1 Power writers (authors) with more than 2 books in the same genre published within the last X years
SELECT a.Author_id, a.Author_name, b.book_genre, COUNT(b.book_id) AS book_count
FROM Authors a
JOIN Books b ON a.Author_id = b.Author_id
WHERE b.publication_date >= DATE_SUB(CURDATE(), INTERVAL 50 YEAR)
GROUP BY a.Author_id, b.book_genre
HAVING COUNT(b.book_id) > 2;

-- 5.2 Loyal Customers who has spent more than 75 dollars in the last year
SELECT o.customer_id, SUM(o.Order_amount) AS total_expenditure
FROM Orders o
WHERE o.order_date >= '2023-01-01'
GROUP BY o.customer_id
HAVING SUM(o.Order_amount) > 75;

-- 5.3 Well Reviewed books that has a better user rating than average
SELECT b.book_id, b.book_title, b.book_genre, b.book_cost
FROM Books b
JOIN Review r ON b.book_id = r.book_id
GROUP BY b.book_id
HAVING AVG(r.customer_rating) > (SELECT AVG(customer_rating) FROM Review);

-- 5.4 The most popular genre by sales

-- 5.5 The 10 most recent posted reviews by Customers 

-- 6. CREATING A TYPESCRIPT INTERFACE THAT WILL ALLOW MODIFICATION TO A TABLE.

interface Book {
    book_id: number;
    book_title: string;
    book_genre: string;
    Author_id: number;
    publisher_id: number;
    publication_date: string; -- Using string to represent date in ISO format(ISO 2108:2017) can no use numbers only
    format: 'physical' | 'ebook' | 'audiobook';
    book_cost: number;
}