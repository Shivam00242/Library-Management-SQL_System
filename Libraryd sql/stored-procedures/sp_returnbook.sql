create procedure sp_returnbook
    @borrowid int
as
begin
    -- update return date
    update borrow_transactions
    set returndate = getdate()
    where BorrowID = @borrowid;

    -- increment available copies
    update books
    set AvailableCopies = AvailableCopies + 1
    where BookID = (select BookID from borrow_transactions where BorrowID = @borrowid);

    -- log in audit_log
    insert into audit_log (ActionType, TableName, Description)
    values ('update', 'Borrow_Transactions', 
            'TransactionID ' + cast(@borrowid as varchar) + ' returned');
end;
go