# Database-Library-System
Database Library System


..................

Introduction

The Database Library System is intended to Automate the library activities such as creating a new borrower, giving books to the borrowers, maintaining the details of all the item that were available in the books . This also helps the librarians by providing information such as total copies available each book, list of books that belong to a particular category (Short, Long Loan, Reference items, etc.).

| **Attribute** | **Attribute Name** | **Attributes Description** |
| --- | --- | --- |
| **Customer Table** |||
| --- | --- | --- |
| CardID  **\[ PK \]** | Card ID | The unique number for each customer |
| FirstName | First Name | First Name |
| LastName | Last Name | Last Name |
| Gender | Gender | Gender |
| DateofBirth | Date of Birth | Date of Birth |
| Address | Full Address | Customer's full address |
| Phone | Phone Number | Phone or mobile Number |
| BranchID | Branch ID | The number of the branch in which the customer's account was created |
| NumBooksBorrowed | Num Books Borrowed | Number of books still borrowed by the customer |



| **Borrow** |||
| --- | --- | --- |
| BorrowID  **\[ PK \]** | Borrow ID | A unique number for each loan in the library,<br>**This ID is important to keep track record of the book (Borrowing record)** |
| CardID **\[ FK \]** |     | The unique number for each customer |
| BookID **\[ FK \]** | Book ID | A unique number for each book in the library, even if it is a copy |
| BorrowDate | Borrow Date  **(Start)** | Book borrow date  **(borrow Date)** |
| RenewedNum | Renewed Number | The number of times the borrowing period has been extended |
| RenewDate | Renew Date  **(Start renew)** | Borrowing period extension date  **(Renew Date)** |
| ReturnDueDate | Return Due Date  **(End)** | The due date for returning the borrowed book  **(Return Date)** |

| **LibraryBranch** |||
| --- | --- | --- |
| BranchID **\[ PK \]** | Branch ID | The number of the branch in which the customer's account was created |
| BranchName | Branch Name | The name of the branch |
| BranchAddress | Branch Address | The address of the Branch |

| **Book** |||
| --- | --- | --- |
| BookID **\[ PK \]** | Book ID | A unique number for each book in the library, even if it is a copy |
| BookISBN **\[ FK \]** | Book ISBN | A unique numeric commercial book identifier |
| BranchID **\[  FK \]** | Branch ID | The number of the branch in which the customer's account was created |
| BookStatus | Book Status | Information about book Status: Borrowed, In the Library, Lost, Damage |

| **BookInfo** |     |     |
| --- | --- | --- |
| BookISBN **\[ PK \]** | Book ISBN | A unique numeric commercial book identifier |
| BookTitle | Book Title | The title of the book |
| CategoryID **\[ FK \]** | Book Category | The category number of the book |
| PublisherID **\[ FK \]** | Publisher ID | The unique number of the publisher |
| NumberOfCopies | Number Of Copies | The number of copies the library has in stock |
| RackNum | Rack Number | The number of the rack |

| **Categories** |     |     |
| --- | --- | --- |
| CategoryID. **\[ PK \]** | Category ID | The category number of the book |
| CategoryName | Category Name | The category name of the book |

| **Publisher** |     |     |
| --- | --- | --- |
| PublisherID. **\[ PK \]** | Publisher ID | The unique number of the publisher |
| PublisherName | Publisher Name | The name of the publisher |
| PublisherAddress | Publisher Address | The address of the publisher |
| PublisherPhone | PublisherP hone | The phone number of the publisher |

| **BookAuthors** |     |     |
| --- | --- | --- |
| AuthorsID **\[  FK \]** | Authors ID | The number of the author |
| BookISBN **\[  FK \]** | Book ISBN | A unique  numeric commercial book identifier |

| **Authors** |     |     |
| --- | --- | --- |
| AuthorID **\[ PK \]** | Author ID | The number of the author |
| AuthorName | Author Name | The name of the author |

Mohammad Altamimi
Siroo Rahimi
Doris
Iyad
