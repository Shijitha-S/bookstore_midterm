# bookstore_midterm

## 1. Below are the duties being assigned to the individual members.

## 2. The tables required for Bookstore along with the details of the the data being captured for each table, and what type each of the attribute are as given below:
Below are the Tables and their attributes with Data Types required:

**Table**: **Authors**                                                                                                                                   
**Attributes**:                                                                                                                                         
                author_id (INT, PRIMARY KEY)                                                                                                    
                author_name (VARCHAR),                                                                                                                  
                Author_type (VARCHAR),                                                                                                              
                Author_DOB (DATE)

**Table**: **Publishers**                                                                                                                                                   
**Attributes**:                                                                                                                                             
                publisher_id(INT, PRIMARY KEY),                                                                                                  
                publisher_name (VARCHAR),                                                                                                            
                Publisher_contact (INT),                                                                                                            
                Publisher_email (VARCHAR)

**Table**: **Books**               
**Attributes**:                                                                                                                                                     
                book_id (INT, PRIMARY KEY, AUTO_INCREMENT)                                                                                            
                book_title (VARCHAR)                                                                                                                    
                book_genre (VARCHAR)                                                                                                              
                author_id (INT, FOREIGN KEY references Authors(author_id))                                                                      
                publisher_id (INT, FOREIGN KEY references Publishers(publisher_id))                                                                                            
                publication_date (DATE)                                                                                                            
                format (ENUM('physical', 'ebook', 'audiobook'))                                                                                                      
                book_cost (DECIMAL)

**Table**: **Customers**                                                                                                                                          
**Attributes**:                                                                                                                                                        
                customer_id (INT, PRIMARY KEY, AUTO_INCREMENT)                                                                                                    
                customer_name (VARCHAR)                                                                                                                
                customer_email (VARCHAR)                                                                                                                    
                Customer_phone (VARCHAR)                                                                                                          
                register_date (DATE)

**Table**: **Orders**                                                                                                                                       
**Attributes**:                                                                                                                                             
                order_id (INT, PRIMARY KEY, AUTO_INCREMENT)                                                                    
                customer_id (INT, FOREIGN KEY references Customers(customer_id))                                                                                
                order_date (DATE)                                                                                                                      
                Order_amount (DECIMAL)

**Table**: **OrderItems**                                                                                                                                             
**Attributes**:                                                                                                                                         
                order_item_id (INT, PRIMARY KEY, AUTO_INCREMENT)                                                                    
                order_id (INT, FOREIGN KEY references Orders(order_id))                                                                
                book_id (INT, FOREIGN KEY references Books(book_id))                                                                                
                order_quantity (INT)                                                                                                                
                total_price (DECIMAL)

**Table**: **Reviews**                                                                                                                                          
**Attributes**:                                                                                                                                       
                review_id (INT, PRIMARY KEY, AUTO_INCREMENT)                                                                                  
                book_id (INT, FOREIGN KEY references Books(book_id))                                                                              
                customer_id (INT, FOREIGN KEY references Customers(customer_id))                                                                      
                Customer_rating (INT)                                                                                                                    
                Customer_comments (TEXT)                                                                                                                        
                review_date (DATE)


## 3. Code block containing only valid sql syntax which will create our sample data base.
### TABLE CREATION
`Creating Author table`
```sql 
CREATE TABLE Authors (
    Author_id INT PRIMARY KEY,
    Author_name VARCHAR(255) NOT NULL,
    Author_type TEXT,
    Autor_DOB DATE
);
```

`Creating publisher table`
```sql
CREATE TABLE Publisher (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(255) NOT NULL,
    Publisher_contact int,
    Publisher_email VARCHAR(255)
);
```

`Creating a table for books information`
```sql
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
```

`Creating a customer table to show the customers who have purchased the books`
```sql
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    customer_email VARCHAR(255),
    Customer_phone VARCHAR(20),
    register_date DATE
);
```

`Creating a order details of customers`
```sql
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    Order_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
```

`Creating a table to provide order items`
```sql
CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    order_quantity INT,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
```

`Creating a table to add customer review details`
```sql
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
```


### DATA INSERTION INTO EACH TABLES AND VERIFICATION

`Adding data into Author table`
```sql
INSERT INTO Authors(Author_id,Author_name, Author_type, Autor_DOB) VALUES
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
```
`Verifying the data inserted in Author`
```sql
SELECT * FROM Authors;
```

`Adding data into Publisher table`
```sql
INSERT INTO Publisher (publisher_id,publisher_name,Publisher_contact,Publisher_email) VALUES
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
```
`Verifying the data inserted in Publisher`
```sql
SELECT * FROM Publisher;
```

`Adding data into Books table`
```sql
INSERT INTO Books(book_id,book_title,book_genre,Author_id,publisher_id,publication_date,format,book_cost) VALUES
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
```
`Verifying the data inserted in Books`
```sql
SELECT * FROM Books;
```

``Adding data into Customers table``
```sql
INSERT INTO Customers(customer_id,customer_name,customer_email,Customer_phone,register_date) VALUES
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
```
``Verifying the data inserted in Customers``
```sql
SELECT * FROM Customers;
```

`Adding data into Orders table`
```sql
INSERT INTO Orders(order_id,customer_id,order_date,Order_amount)VALUES
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
```
`Verifying the data inserted in Orders`
```sql
SELECT * FROM Orders;
```

`Adding data into OrderItems table`
```sql
INSERT INTO OrderItems(order_item_id,order_id,book_id,order_quantity,total_price) VALUES
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
```
`Verifying the data inserted in OrderItems`
```sql
SELECT * FROM OrderItems;
```

`Adding data into Review table`
```sql
INSERT INTO Review(review_id,book_id,customer_id,Customer_rating,Customer_comments,review_date) VALUES
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
```
`Verifying the data inserted in Review`
```sql
SELECT * FROM Review;
```

## 4. IDENTIFYING 1 COMPLETE SET OF DDL/DML FOR THE TABLES BOOKS
`4.1. Extracting the data for the book id 1001`
```sql
select * from Books 
where book_id=1001;
```

`4.2. Update the cost of one of the book with id 1000 and view the updates`
```sql
UPDATE Books 
set publication_date='2010-05-12' 
where book_id=1000;
```
```sql
select * from Books 
where book_id=1000;
```

`4.3. Add one extra row to the books data and check the number of rows in table`
```sql
insert into Books(book_id,book_title,book_genre,Author_id,publisher_id,publication_date,format,book_cost) VALUES
(1010,'Pride','Science Fiction',1,100,'1813-03-28','physical',17.99);
```
```sql
select COUNT(*) from Books;   --- the result will show 11 rows as new row have been added
```

`4.4. delete one row from Books table and then check the number of rows`
```sql
DELETE FROM Books where book_id=1010;
select COUNT(*) from Books;   --- the result will show 10 rows as a row have been deleted
```


## 5. SQL QUERIES FOR THE BELOW LISTED REQUIREMENTS.
`5.1 Power writers (authors) with more than 2 books in the same genre published within the last 50 years`
```sql
SELECT a.Author_id, a.Author_name, b.book_genre, COUNT(b.book_id) AS book_count
FROM Authors a
JOIN Books b ON a.Author_id = b.Author_id
WHERE b.publication_date >= DATE_SUB(CURDATE(), INTERVAL 50 YEAR)
GROUP BY a.Author_id, b.book_genre
HAVING COUNT(b.book_id) > 2;
```

`5.2 Loyal Customers who has spent more than 75 dollars in the last year`
```sql
SELECT o.customer_id, SUM(o.Order_amount) AS total_expenditure
FROM Orders o
WHERE o.order_date >= '2023-01-01'
GROUP BY o.customer_id
HAVING SUM(o.Order_amount) > 75;
```

`5.3 Well Reviewed books that has a better user rating than average`
```sql
SELECT b.book_id,b.book_title, b.book_genre, AVG(r.customer_rating)
FROM Books b
JOIN Review r ON b.book_id = r.book_id
GROUP BY b.book_id
HAVING AVG(r.customer_rating) > (SELECT AVG(customer_rating) FROM Review);
```

`5.4 The most popular genre by sales`
```sql
--SQL CODE here
```

`5.5 The 10 most recent posted reviews by Customers`
```sql
SELECT r.review_id,c.customer_name,b.book_title,r.Customer_comments,r.review_date
FROM Review r JOIN Customers c ON r.customer_id = c.customer_id
JOIN Books b ON b.book_id = r.book_id
ORDER BY r.review_date DESC
LIMIT 10;
```

## 6. CREATING A TYPESCRIPT INTERFACE THAT WILL ALLOW MODIFICATION TO A TABLE.
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
