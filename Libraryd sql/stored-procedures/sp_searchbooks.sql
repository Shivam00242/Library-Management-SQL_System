create procedure sp_searchbooks
    @keyword varchar(100)
as
begin
    select 
        b.Title,
        a.AuthorName,
        c.CategoryName,
        b.PublishedYear,
        b.AvailableCopies
    from books b
    join authors a on b.AuthorID = a.AuthorID
    join categories c on b.CategoryID = c.CategoryID
    where b.Title like '%' + @keyword + '%'
       or a.AuthorName like '%' + @keyword + '%'
       or c.CategoryName like '%' + @keyword + '%';
end;
go