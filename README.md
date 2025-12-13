📚 Library Management System – SQL Server

📌 Project Overview

This project is a SQL Server–based Library Management System designed to manage books, members, borrowing/return operations, and automated audit logging.
The system focuses on real-world database design, automation, and analytical querying using advanced SQL concepts.


---

🎯 Objectives

Design a normalized relational database

Automate borrow and return workflows

Track overdue books and availability

Maintain audit logs automatically

Perform analytical queries for insights



---

🧱 Database Design

The system consists of 6 core tables:

Books – Book details and available copies

Authors – Author information

Categories – Book categories

Members – Library members

Borrow_Transactions – Borrow and return records

Audit_Log – Automated activity logs


Relationships are enforced using primary keys, foreign keys, and constraints to ensure data integrity.


---

⚙️ Core Features

🔹 Stored Procedures

sp_borrowbook – Records borrowing, updates inventory, logs action

sp_returnbook – Handles returns, updates stock, logs action

sp_searchbooks – Searches books by title, author, or category


🔹 User-Defined Functions

fn_overdue_days – Calculates overdue days beyond 30

fn_available_books – Returns currently available books


🔹 Triggers

trg_borrow_insert – Automatically logs borrow actions

trg_return_update – Updates available copies on return



---

📊 Analytical Queries

The project includes analytical SQL queries to:

Identify top borrowed books using window functions

Detect overdue books

Analyze member activity

Track inventory availability


Example:

SELECT b.Title,
       COUNT(bt.BookID) AS TotalBorrowed,
       RANK() OVER (ORDER BY COUNT(bt.BookID) DESC) AS BorrowRank
FROM Borrow_Transactions bt
JOIN Books b ON bt.BookID = b.BookID
GROUP BY b.Title;


---

🛠 Tools & Technologies

SQL Server

T-SQL

SSMS

Stored Procedures

Triggers

Functions

Window Functions



---

📁 Project Structure

library-management-sql-system/
│── tables/
│── sample-data/
│── stored-procedures/
│── functions/
│── triggers/
│── docs/
│── project.sql
│── README.md


---

▶️ Execution Order

1. Create Database


2. Create Tables


3. Insert Sample Data


4. Create Functions


5. Create Stored Procedures


6. Create Triggers


7. Run Analytical Queries




---

🚀 What This Project Demonstrates

Strong understanding of relational databases

Ability to implement business logic in SQL

Experience with automation using triggers

Practical use of analytical SQL

Real-world database problem solving



---

📌 Author

Shivam
Data Analyst | Junior Data Scientist
🔗 GitHub: https://github.com/Shivam00242

