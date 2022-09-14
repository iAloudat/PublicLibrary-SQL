/* ======================= TABLES ======================== */

CREATE TABLE Customer (
    CardID      Numeric(10,0)   NOT NULL IDENTITY(1000000000,1)  PRIMARY KEY,
    FirstName   VARCHAR(50)     NOT NULL ,
    LastName    VARCHAR(50)     NOT NULL ,
    Gender      VARCHAR(10)     NOT NULL ,
    DateofBirth DATE            NOT NULL ,
    Address     VARCHAR(100)    NOT NULL ,
    Phone       Numeric(10,0)   NOT NULL   
);


CREATE TABLE Borrow (
    BorrowID        INT             NOT NULL IDENTITY(1,1) PRIMARY KEY, 
    CardID          Numeric(10,0)   NOT NULL FOREIGN KEY REFERENCES Customer(CardID),
    BookID          Numeric(10,0)   NOT NULL FOREIGN KEY REFERENCES Book(BookID),
    BorrowDate      DATE            NOT NULL ,
    RenewedNum      INT                 NULL CHECK(RenewedNum <= 2), -- Case 03
    RenewDate       DATE                NULL ,
    ReturnDueDate   DATE                NULL 
);


CREATE TABLE LibraryBranch (
    BranchID        INT         NOT NULL IDENTITY(1,1) PRIMARY KEY,
    BranchName      VARCHAR(50) NOT NULL ,
    BranchAddress   VARCHAR(50) NOT NULL 
);

CREATE TABLE Book (
    BookID      Numeric(10,0)   NOT NULL  IDENTITY(1,1) PRIMARY KEY,
    BookISBN    Numeric(13,0)   NOT NULL FOREIGN KEY REFERENCES BookInfo(BookISBN),
    BranchID    INT             NOT NULL FOREIGN KEY REFERENCES LibraryBranch(BranchID),
    BookStatus  VARCHAR(12)     NOT NULL
);

CREATE TABLE BookInfo (
    BookISBN        Numeric(13,0)   NOT NULL PRIMARY KEY,
    BookTitle       VARCHAR(50)     NOT NULL ,
    CategoryID      INT             NOT NULL FOREIGN KEY REFERENCES Categories(CategoryID),
    PublisherID     INT             NOT NULL FOREIGN KEY REFERENCES Publisher(PublisherID),
    NumberOfCopies  INT             NOT NULL ,
    RackNum         INT             NOT NULL 
);

CREATE TABLE Categories (
    CategoryID      INT             NOT NULL  IDENTITY(1,1) PRIMARY KEY,
    CategoryName    VARCHAR(50)     NOT NULL
);

CREATE TABLE Publisher (
    PublisherID         INT             NOT NULL IDENTITY(1,1) PRIMARY KEY,
    PublisherName       VARCHAR(50)     NOT NULL ,
    PublisherAddress    VARCHAR(100)    NOT NULL ,
    PublisherPhone      Numeric(10,0)   NOT NULL 
);

CREATE TABLE BookAuthors (
    AuthorsID   INT  NOT NULL FOREIGN KEY REFERENCES Authors(AuthorsID),
    BookISBN    INT  NOT NULL FOREIGN KEY REFERENCES BookInfo(BookISBN)
);

CREATE TABLE Authors (
    AuthorID    INT          NOT NULL IDENTITY(1,1) PRIMARY KEY,
    AuthorName  VARCHAR(50)  NOT NULL 
);