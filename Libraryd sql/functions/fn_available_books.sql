create function fn_available_books()
returns table
as
return
(
    select 
        b.bookid, 
        b.title,
        b.AvailableCopies
    from books b
    where b.bookid not in (
        select bookid
        from borrow_transactions
        where returndate is null
          and try_convert(date, borrowdate, 105) is not null
    )
);
go