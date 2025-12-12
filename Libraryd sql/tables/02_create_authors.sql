create table Authors (
    AuthorID int identity(200,1) primary key,
    AuthorName varchar(120) not null,
    Country varchar(100)
);