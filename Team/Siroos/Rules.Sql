
Case 01
The Maximum number of days allowed to borrow a book.
Business Rule
30 Days is the Maximum number of days allowed to borrow a book

CHECK((ReturnDueDate-BorrowDate)<31)

Case 02
The maximum number of borrowed books.
Business Rule
15 books is The maximum number of borrowed books.

select CardID, count(BookID) from Borrow group by CardID having count(BookID)<=15;

Case 03
Renew the book return due date
Business Rule
Customers can renew the book return due date twice only

CHECK((RenewedNum)<3)

Case 04
Number of Publisher for every Book
Business Rule
Every Book Should have only one Publisher

ALTER TABLE BookInfo 
ADD CONSTRAINT FK_PublisherID_BookInfo 
FOREIGN KEY(PublisherID)
REFERENCES Publisher(PublisherID);

Case 05
Each branch must have enough books to borrow
Business Rule
Each Branch should have at least 500 Books

select BranchID, BranchName, count(BookID) FROM Book JOIN LibraryBranch ON Book.BranchID = LibraryBranch.BranchID
group by BranchName having count(BookID)>=500;

Case 06
Checking the location of branches
Business Rule
all of library branches should be inside the Montreal.

CHECK(SUBSTRING(BranchAddress,1,8)='montreal')

Case 07
Book borrowing is available to all members
Business Rule
A book can be borrowed if available only.

select BookStatus, BorrowID FROM Book JOIN Borrow ON Book.BookID = Borrow.BookID where BookStatus='Available';

Case 08
Checking the age of customers
Business Rule
Each customer should be born before 2020.

CHECK(DateofBirth<'2020-01-01')
