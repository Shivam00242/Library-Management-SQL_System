create procedure sp_borrowbook
    @bookid int,
    @memberid int
as
begin
    -- insert new borrow record
    insert into borrow_transactions (bookid, memberid, borrowdate, returndate)
    values (@bookid, @memberid, getdate(), null);

    -- decrement available copies
    update books
    set AvailableCopies = AvailableCopies - 1
    where BookID = @bookid;

    -- log in audit_log
    insert into audit_log (ActionType, TableName, Description)
    values ('insert', 'Borrow_Transactions', 
            'MemberID ' + cast(@memberid as varchar) + ' borrowed BookID ' + cast(@bookid as varchar));
end;
go