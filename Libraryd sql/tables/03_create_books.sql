create table Books (
    BookID int identity(300,1) primary key,
    Title varchar(200) not null,
    AuthorID int not null,
    CategoryID int not null,
    PublishedYear int CHECK (PublishedYear >= 1900),

    foreign key (AuthorID) references Authors(AuthorID),
    foreign key (CategoryID) references Categories(CategoryID)
);