/* ============ Database Library System Setup ============ */
CREATE DATABASE PublicLibrary;
GO
use PublicLibrary
GO

/* ======================= TABLES ======================== */
CREATE TABLE Customer (
    CardID      Numeric(10,0)   NOT NULL IDENTITY(1000000000,1)  PRIMARY KEY,
    FirstName   VARCHAR(50)     NOT NULL,
    LastName    VARCHAR(50)     NOT NULL,
    Gender      VARCHAR(10)     NOT NULL,
    DateofBirth DATE            NOT NULL,
    Address     VARCHAR(100)    NOT NULL,
    Phone       Numeric(10,0)   NOT NULL   
);
GO

CREATE TABLE LibraryBranch (
    BranchID        INT         NOT NULL IDENTITY(1,1) PRIMARY KEY,
    BranchName      VARCHAR(50) NOT NULL,
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
    PublisherName       VARCHAR(50)     NOT NULL,
    PublisherAddress    VARCHAR(100)    NOT NULL,
    PublisherPhone      Numeric(10,0)   NOT NULL 
);
GO

CREATE TABLE BookInfo (
    BookISBN        Numeric(10,0)   NOT NULL PRIMARY KEY,
    BookTitle       VARCHAR(50)     NOT NULL,
    CategoryID      INT             NOT NULL,
    PublisherID     INT             NOT NULL,
    NumberOfCopies  INT             NOT NULL,
    RackNum         INT             NOT NULL 
);
GO

CREATE TABLE Book (
    BookID      INT             NOT NULL  IDENTITY(1,1) PRIMARY KEY,
    BookISBN    Numeric(10,0)   NOT NULL,
    BranchID    INT             NOT NULL,
    BookStatus  VARCHAR(12)     NOT NULL
);
GO

CREATE TABLE Borrow (
    BorrowID        INT             NOT NULL IDENTITY(1,1) PRIMARY KEY, 
    CardID          Numeric(10,0)   NOT NULL,
    BookID          INT             NOT NULL,
    BorrowDate      DATE            NOT NULL,
    RenewedNum      INT                 NULL,
    RenewDate       DATE                NULL,
    ReturnDueDate   DATE                NULL 
);
GO


CREATE TABLE Authors (
    AuthorID    INT          NOT NULL IDENTITY(1,1) PRIMARY KEY,
    AuthorName  VARCHAR(50)  NOT NULL 
);
GO

CREATE TABLE BookAuthors (
    AuthorID   INT  NOT NULL,
    BookISBN    Numeric(10,0)  NOT NULL
);
GO

/* ======================= FK ======================== */

ALTER TABLE BookInfo 
ADD CONSTRAINT FK_CategoryID_BookInfo 
FOREIGN KEY(CategoryID)
REFERENCES Categories(CategoryID);
GO

ALTER TABLE BookInfo 
ADD CONSTRAINT FK_PublisherID_BookInfo 
FOREIGN KEY(PublisherID)
REFERENCES Publisher(PublisherID);
GO

ALTER TABLE Book 
ADD CONSTRAINT FK_BookISBN_Book 
FOREIGN KEY(BookISBN)
REFERENCES BookInfo(BookISBN);
GO


ALTER TABLE Book 
ADD CONSTRAINT FK_BranchID_Book 
FOREIGN KEY(BranchID)
REFERENCES LibraryBranch(BranchID);
GO

ALTER TABLE Borrow 
ADD CONSTRAINT FK_CardID_Borrow 
FOREIGN KEY(CardID)
REFERENCES Customer(CardID);
GO

ALTER TABLE Borrow 
ADD CONSTRAINT FK_BookID_Borrow 
FOREIGN KEY(BookID)
REFERENCES Book(BookID);
GO

ALTER TABLE BookAuthors 
ADD CONSTRAINT FK_BookISBN_BookAuthors 
FOREIGN KEY(BookISBN)
REFERENCES BookInfo(BookISBN);
GO

ALTER TABLE BookAuthors 
ADD CONSTRAINT FK_AuthorID_BookAuthors 
FOREIGN KEY(AuthorID)
REFERENCES Authors(AuthorID);
GO

/* ======================= Ruls ======================== */

/* ======================= Data ======================== */