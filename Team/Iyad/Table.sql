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
GO

CREATE TABLE LibraryBranch (
    BranchID        INT         NOT NULL IDENTITY(1,1) PRIMARY KEY,
    BranchName      VARCHAR(50) NOT NULL ,
    BranchAddress   VARCHAR(50) NOT NULL 
);
GO

CREATE TABLE Categories (
    CategoryID      INT             NOT NULL  IDENTITY(1,1) PRIMARY KEY,
    CategoryName    VARCHAR(50)     NOT NULL
);
GO

CREATE TABLE Publisher (
    PublisherID         INT             NOT NULL IDENTITY(1,1) PRIMARY KEY,
    PublisherName       VARCHAR(50)     NOT NULL ,
    PublisherAddress    VARCHAR(100)    NOT NULL ,
    PublisherPhone      Numeric(10,0)   NOT NULL 
);
GO

CREATE TABLE BookInfo (
    BookISBN        Numeric(10,0)   NOT NULL PRIMARY KEY,
    BookTitle       VARCHAR(50)     NOT NULL ,
    CategoryID      INT             NOT NULL FOREIGN KEY REFERENCES Categories(CategoryID),
    PublisherID     INT             NOT NULL FOREIGN KEY REFERENCES Publisher(PublisherID),
    NumberOfCopies  INT             NOT NULL ,
    RackNum         INT             NOT NULL 
);
GO

CREATE TABLE Book (
    BookID      INT             NOT NULL  IDENTITY(1,1) PRIMARY KEY,
    BookISBN    Numeric(10,0)   NOT NULL FOREIGN KEY REFERENCES BookInfo(BookISBN),
    BranchID    INT             NOT NULL FOREIGN KEY REFERENCES LibraryBranch(BranchID),
    BookStatus  VARCHAR(12)     NOT NULL
);
GO

CREATE TABLE Borrow (
    BorrowID        INT             NOT NULL IDENTITY(1,1) PRIMARY KEY, 
    CardID          Numeric(10,0)   NOT NULL FOREIGN KEY REFERENCES Customer(CardID),
    BookID          INT             NOT NULL FOREIGN KEY REFERENCES Book(BookID),
    BorrowDate      DATE            NOT NULL ,
    RenewedNum      INT                 NULL ,
    RenewDate       DATE                NULL ,
    ReturnDueDate   DATE                NULL 
);
GO


CREATE TABLE Authors (
    AuthorID    INT          NOT NULL IDENTITY(1,1) PRIMARY KEY,
    AuthorName  VARCHAR(50)  NOT NULL 
);
GO

CREATE TABLE BookAuthors (
    AuthorsID   INT  NOT NULL FOREIGN KEY REFERENCES Authors(AuthorID),
    BookISBN    Numeric(10,0)  NOT NULL FOREIGN KEY REFERENCES BookInfo(BookISBN)
);
