-- =========================================
-- LIBRARY MANAGEMENT SYSTEM
-- =========================================

-- Create Database
CREATE DATABASE library_db;
USE library_db;


-- Students Table
CREATE TABLE students(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    course VARCHAR(50),
    mobile_no VARCHAR(15)
);


-- Books Table
CREATE TABLE books(
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    book_name VARCHAR(50),
    author_name VARCHAR(50)
);


-- Book Issue Table
CREATE TABLE book_issue(
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    book_id INT,
    issue_date DATETIME,

    FOREIGN KEY(student_id) REFERENCES students(id),
    FOREIGN KEY(book_id) REFERENCES books(book_id)
);


-- Return Book Table
CREATE TABLE return_book(
    return_id INT PRIMARY KEY AUTO_INCREMENT,
    issue_id INT,
    return_date DATETIME,

    FOREIGN KEY(issue_id) REFERENCES book_issue(issue_id)
);


-- =========================================
-- INSERT STUDENTS
-- =========================================

INSERT INTO students(name, course, mobile_no) VALUES
('Purushotam','BCA','9369262485'),
('Aman','BTECH','9369258512'),
('Rahul','BTECH','8515812010'),
('Aditya','BCA','8175851566'),
('Mohan','BCA','2515704050'),
('Rohit','BCA','9876543210'),
('Ankit','BTECH','9123456780'),
('Neha','BCA','9988776655'),
('Priya','MCA','9012345678'),
('Vikas','BTECH','9090909090'),
('Pooja','BCA','8899776655'),
('Arjun','MCA','8765432109'),
('Karan','BCA','9345678901'),
('Sneha','BTECH','9567890123'),
('Nikhil','BCA','9234567890'),
('Riya','MCA','9456789012'),
('Suresh','BTECH','9789012345'),
('Anjali','BCA','8877665544'),
('Deepak','BTECH','9654321087'),
('Kavita','MCA','9087654321');


-- =========================================
-- INSERT BOOKS
-- =========================================

INSERT INTO books(book_name, author_name) VALUES
('Database System Concepts','Abraham Silberschatz'),
('Operating System Concepts','Abraham Silberschatz'),
('Computer Networks','Andrew S. Tanenbaum'),
('Computer Organization','Carl Hamacher'),
('Data Structures and Algorithms','Alfred V. Aho'),
('Introduction to Algorithms','Thomas H. Cormen'),
('The C Programming Language','Brian W. Kernighan'),
('C++ Primer','Stanley B. Lippman'),
('Java: The Complete Reference','Herbert Schildt'),
('Core Python Programming','R. Nageswara Rao'),
('Artificial Intelligence','Stuart Russell'),
('Machine Learning','Tom M. Mitchell'),
('Computer Graphics','Donald D. Hearn'),
('Software Engineering','Ian Sommerville'),
('Compiler Design','Alfred V. Aho'),
('Discrete Mathematics','Kenneth H. Rosen'),
('Computer Architecture','John L. Hennessy'),
('Cryptography and Network Security','William Stallings'),
('Cloud Computing','Rajkumar Buyya'),
('Web Technologies','Uttam K. Roy');


-- =========================================
-- ISSUE BOOKS
-- =========================================

INSERT INTO book_issue(student_id, book_id, issue_date) VALUES
(1,3,'2026-08-20 10:00:00'),
(2,7,'2026-08-20 10:30:00'),
(3,1,'2026-08-21 09:45:00'),
(4,10,'2026-08-21 11:00:00'),
(5,5,'2026-08-22 10:15:00'),
(6,12,'2026-08-22 12:00:00'),
(7,8,'2026-08-23 09:30:00'),
(8,15,'2026-08-23 11:15:00'),
(9,2,'2026-08-24 10:00:00'),
(10,18,'2026-08-24 12:30:00');


-- =========================================
-- RETURN BOOKS
-- =========================================

INSERT INTO return_book(issue_id, return_date) VALUES
(1,'2026-08-23 10:00:00'),
(2,'2026-08-24 11:00:00'),
(3,'2026-08-25 12:00:00'),
(4,'2026-08-26 10:30:00'),
(5,'2026-08-27 09:45:00');


-- =========================================
-- BASIC QUERIES
-- =========================================

-- Show Students
SELECT * FROM students;

-- Show Books
SELECT * FROM books;

-- Show Issued Books
SELECT * FROM book_issue;

-- Show Returned Books
SELECT * FROM return_book;


-- =========================================
-- BCA STUDENTS
-- =========================================

SELECT * FROM students
WHERE course = 'BCA';


-- Total BCA Students
SELECT COUNT(*) AS total_BCA_students
FROM students
WHERE course = 'BCA';


-- Total Students
SELECT COUNT(*) AS total_students
FROM students;


-- Total Books
SELECT COUNT(*) AS total_books
FROM books;


-- Total Issued Books
SELECT COUNT(*) AS total_issued
FROM book_issue;


-- Total Returned Books
SELECT COUNT(*) AS total_returned
FROM return_book;


-- =========================================
-- JOIN REPORT
-- =========================================

SELECT
    students.name,
    students.course,
    books.book_name,
    books.author_name,
    book_issue.issue_date
FROM book_issue
JOIN students
ON book_issue.student_id = students.id
JOIN books
ON book_issue.book_id = books.book_id;


-- =========================================
-- RETURN REPORT
-- =========================================

SELECT
    students.name,
    books.book_name,
    book_issue.issue_date,
    return_book.return_date
FROM return_book
JOIN book_issue
ON return_book.issue_id = book_issue.issue_id
JOIN students
ON book_issue.student_id = students.id
JOIN books
ON book_issue.book_id = books.book_id;


-- =========================================
-- PENDING BOOKS
-- =========================================

SELECT
    students.name,
    books.book_name,
    book_issue.issue_date
FROM book_issue
JOIN students
ON book_issue.student_id = students.id
JOIN books
ON book_issue.book_id = books.book_id
LEFT JOIN return_book
ON book_issue.issue_id = return_book.issue_id
WHERE return_book.issue_id IS NULL;


-- =========================================
-- UPDATE EXAMPLE
-- =========================================

UPDATE students
SET course = 'MCA'
WHERE id = 2;


-- =========================================
-- DELETE EXAMPLE
-- =========================================

-- Use carefully
-- DELETE FROM students WHERE id = 20;