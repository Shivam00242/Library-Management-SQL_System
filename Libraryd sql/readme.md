📚 Library Management Database (SQL Server)

A fully functional Library Management System built using SQL Server, featuring:

Relational database design

Stored procedures for borrow/return operations

Scalar & table-valued functions

Triggers with audit logging

Window functions

Complex joins & real-world queries


This project demonstrates end-to-end database development—tables → logic → automation → reporting.


---

🚀 Features

✅ 1. Database Design

Includes 6 core tables:

Books – Title, author, category, copies

Authors – Author details

Categories – Book categories

Members – Library members

Borrow_Transactions – Borrow and return records

Audit_Log – Automatically logs actions


📄 Documentation:

Table designs

Constraints (PK, FK, UNIQUE)

Data validation rules

Default values




---

🔧 Stored Procedures

1. sp_borrowbook

Inserts a borrow transaction

Decreases available copies

Logs the action in Audit_Log


2. sp_returnbook

Updates return date

Increases available copies

Logs the return event


3. sp_searchbooks

Search books by keyword across:

Title

Author

Category



---

🔍 User-Defined Functions

Scalar Function

fn_overdue_days(date)

Calculates overdue duration (beyond 30 days)



Table-Valued Function

fn_available_books()

Returns all books currently available to borrow




---

🔥 Triggers

1. trg_borrow_insert

Logs borrow activity into Audit_Log.

2. trg_return_update

Automatically updates available copies when a book is returned.


---

📊 Example Queries

List all books with authors and categories

select b.Title, a.AuthorName, c.CategoryName
from Books b
join Authors a on b.AuthorID = a.AuthorID
join Categories c on b.CategoryID = c.CategoryID;

Top borrowed books using window functions

select 
    b.Title,
    count(bt.BookID) as TotalBorrowed,
    rank() over(order by count(bt.BookID) desc) as BorrowRank
from Borrow_Transactions bt
join Books b on bt.BookID = b.BookID
group by b.Title;

Find overdue books

select bt.BorrowID, b.Title, m.MemberName, bt.BorrowDate
from Borrow_Transactions bt
join Books b on bt.BookID = b.BookID
join Members m on bt.MemberID = m.MemberID
where bt.ReturnDate is null
  and dbo.fn_overdue_days(convert(date, bt.BorrowDate, 105)) > 0;


---

🗂 Project Structure (create this in your repo)

/sql-library-management
│── tables/
│── sample-data/
│── stored-procedures/
│── functions/
│── triggers/
│── docs/
│    └── Librarydb Documentation.pdf
│── project.sql
│── README.md


---

▶️ How to Run the Project

1. Create database:



create database LibraryDB;
use LibraryDB;

2. Run scripts in the following order:



Tables → Sample Data → Functions → Stored Procedures → Triggers

3. Test functionality:



exec sp_borrowbook @BookID = 301, @MemberID = 400;
exec sp_returnbook @borrowid = 5001;

select * from dbo.fn_available_books();
select * from Audit_Log;


---

🏆 Skills Demonstrated

This project proves your ability in:

SQL database design

Writing stored procedures

Implementing business logic

Using triggers efficiently

Working with functions

Window functions (analytics)

Real-world problem solving

Clean query structuring

Understanding relational models


This is way above average fresher-level SQL.


---

🛠 Tools Used

SQL Server / SSMS

T-SQL

Database diagrams

Query optimization concepts



---

📌 Author

Shivam
Aspiring Data Analyst / Data Engineer
GitHub: your profile link