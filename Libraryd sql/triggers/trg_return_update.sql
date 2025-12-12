create trigger trg_return_update
on borrow_transactions
after update
as
begin
    -- Only process rows where ReturnDate was set (book returned)
    update Books
    set Books.AvailableCopies = Books.AvailableCopies + 1
    from books 
    join inserted  on Books.BookID = inserted.BookID
    join deleted  on inserted.BorrowID = deleted.BorrowID
    where deleted.ReturnDate is null
      and inserted.ReturnDate is not null
end
go