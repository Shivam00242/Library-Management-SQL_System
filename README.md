
# Library Management SQL System

**Tags:** SQL · T-SQL · Database Design · Stored Procedures · Triggers · Functions · Audit Logging

## Overview
A production-style Library Management System implemented in T-SQL for SQL Server. Implements normalized schema, stored procedures for borrow/return/search, user-defined functions (overdue & availability), triggers for audit logging, and analytic queries (window functions).

## Project Structure
```
/tables/                 -- CREATE TABLE scripts (ordered)
 /01_create_categories.sql
 /02_create_authors.sql
 /03_create_books.sql
 /04_create_members.sql
 /05_create_borrow_transactions.sql
 /06_create_audit_log.sql
/sample-data/            -- INSERT scripts for sample data
/stored-procedures/      -- sp_borrowbook.sql, sp_returnbook.sql, sp_searchbooks.sql
/functions/              -- fn_overdue_days.sql, fn_available_books.sql
/triggers/               -- trg_borrow_insert.sql, trg_return_update.sql
/docs/                   -- Documentation and ER diagram image
/project.sql             -- Top-level script: create DB + run order
README.md
```

## ER Diagram
See `/docs/librarydb-er-diagram.png` for the visual schema (Books ↔ Authors, Books ↔ Categories, Borrow_Transactions ↔ Books & Members).  
(If you want a higher-resolution or color version, tell me and I’ll generate one.)

## Key Features & Business Value
- End-to-end borrow/return workflow automated with stored procedures and triggers.  
- Audit logging for traceability and compliance.  
- Functions for overdue detection and available-books listing.  
- Analytical queries (top-borrowed, overdue reports) useful for librarians & managers.

## How to run (quick)
1. Create database:
```sql
CREATE DATABASE LibraryDB;
USE LibraryDB;
```
2. Run table scripts in `/tables` (in order).  
3. Run `/sample-data` scripts to seed test data.  
4. Create `/functions`, then `/stored-procedures`, then `/triggers`.  
5. Test:
```sql
EXEC sp_borrowbook @BookID = 301, @MemberID = 400;
EXEC sp_returnbook @borrowid = 5001;
SELECT * FROM dbo.fn_available_books();
```

## Example queries
```sql
-- Top borrowed
SELECT b.Title, COUNT(*) AS TotalBorrowed,
       RANK() OVER(ORDER BY COUNT(*) DESC) AS BorrowRank
FROM Borrow_Transactions bt
JOIN Books b ON bt.BookID = b.BookID
GROUP BY b.Title;
```

## Screenshots / Demo
Add screenshots of query results or the Excel dashboard in `/docs/screenshots/`.

## About the author
**Shivam** — Aspiring Data Analyst / Data Engineer  
GitHub: https://github.com/Shivam00242



    
