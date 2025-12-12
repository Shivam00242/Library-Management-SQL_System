create table Members (
    MemberID int identity(400,1) primary key,
    MemberName varchar(120) not null,
    Email varchar(150) UNIQUE,
    JoinDate date default ('05/12/2025')
);