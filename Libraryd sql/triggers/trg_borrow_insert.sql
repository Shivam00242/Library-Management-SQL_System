create trigger trg_borrow_insert
  on borrow_transactions
  after insert
  as 
  begin
    insert into audit_log (ActionType, TableName, Description)
    select 
        'insert',
        'Borrow_Transactions',
        'MemberID ' + cast(i.MemberID as varchar) 
        + ' borrowed BookID ' + cast(i.BookID as varchar)
    from inserted i;
 end;
 go