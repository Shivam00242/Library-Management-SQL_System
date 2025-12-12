create table Borrow_Transactions (
    BorrowID int identity(500,1) primary key,
    BookID int not null,
    MemberID int not null,
    BorrowDate varchar(20) default ('14-10-2025'),
    ReturnDate date,

    foreign key (BookID) references Books(BookID),
    foreign key (MemberID) references Members(MemberID)
);