/* ======================= Rules  Queries ======================== */

-- Case 02 : 15 books is The maximum number of borrowed books.
SELECT CardID, count(BookID) from Borrow group by CardID having count(BookID)<=15;
GO

-- Case 05 : Each Branch should have at least 500 Books
-- #### Note: We used 5 for the test because we don't have 500 record
SELECT BranchName, count(BookID) FROM Book JOIN LibraryBranch ON Book.BranchID = LibraryBranch.BranchID
group by BranchName having count(BookID)>=5;
GO

-- Case 06: A book can be borrowed if available only.
SELECT BookStatus, BorrowID FROM Book JOIN Borrow ON Book.BookID = Borrow.BookID where BookStatus='Available';
GO