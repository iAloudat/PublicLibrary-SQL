
--1
select BorrowID, ReturnDueDate-BorrowDate from Borrow where ReturnDueDate-BorrowDate<=30
--2
select CardID, count(BookID) from Borrow group by CardID having count(BookID)<=15;
--3
select BorrowID, CardID, RenewedNum from Borrow where RenewedNum<=2;
--4
select BookISBN, COUNT(PublisherID) from BookInfo  group by BookISBN having COUNT(PublisherID)=1;
--5
select BranchID, BranchName, count(BookID) FROM Book JOIN LibraryBranch ON Book.BranchID = LibraryBranch.BranchID
group by BranchName having count(BookID)>=500;
--6
select BookID, COUNT(CardID) from Borrow  group by BookID having COUNT(CardID)=1;
