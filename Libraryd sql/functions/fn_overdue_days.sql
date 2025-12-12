create function fn_overdue_days(@borrowdate date)
returns int
as
begin
    declare @days int;
    declare @overdue int;

    -- total days since borrowed
    set @days = datediff(day, @borrowdate, getdate());

    -- only count days beyond 30
    if @days > 30
        set @overdue = @days - 30;
    else
        set @overdue = 0;

    return @overdue;
end;
go