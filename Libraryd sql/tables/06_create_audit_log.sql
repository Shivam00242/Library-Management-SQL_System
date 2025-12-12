create table Audit_Log (
    LogID int identity (600,1) primary key,
    ActionType varchar(50),
    TableName varchar(50),
    Description text,
    CreatedAt date default getdate()
);