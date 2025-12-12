create table Categories (
    CategoryID int identity (100,1) primary key,
    CategoryName varchar(100) not null UNIQUE
);