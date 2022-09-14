# Database-Library-System
Database Library System

### Introduction

The Database Library System is intended to Automate the library activities such as creating a new borrower, giving books to the borrowers, maintaining the details of all the item that were available in the books . This also helps the librarians by providing information such as total copies available each book, list of books that belong to a particular category (Short, Long Loan, Reference items, etc.).


### Deliverable 1:

1. The conceptual database design using the Entity Relationship (E/R) diagram, shows entity types, relationships, attributes, key attributes, cardinalities, and participation constraints. Also, normalize the entities and include the steps of normalization process (to 3NF);
2. The development of the logical design of the database (resulting by the mapping of an E/R diagram to a Relational model).

### Deliverable 2:
1. Students must describe any revisions made to Deliverable 1 (based on feedback);
2. Create database schema using SQL DDL (Data Definition Language) statements, show how they enforced the constraints implied by their logical design, identify any constraints that are not captured by the ER diagram;
3. Populate every relation with sufficient data using DML (Data Manipulation Language) statements. It should include the SQL scripts implemented and used for constructing the schema and loading the data in the database.

### Deliverable 3:
1. Develop a set of SQL queries to query the database (there should be at least 5 queries). Include the statements of the queries and transactions scripts expressed in SQL along with the results returned;
2. Apply advanced database concepts such as triggers to maintain data integrity, indexes, views, and procedures to improve system performance;
3. There will be a project demonstration in the last week of the semester where students explain their work. Each group will have 15 minutes to demonstrate their database design

### Diagram Links 
Public Library – 3NF 
https://app.quickdatabasediagrams.com/#/d/JV01Tr 

Public Library - 2NF 
https://app.quickdatabasediagrams.com/#/d/8Orn4g 

Public Library – 1NF 
https://app.quickdatabasediagrams.com/#/d/wRi0fv 

### Business Rules 
1. Case 01
The Maximum number of days allowed to borrow a book. 
Business Rule
30 Days is the Maximum number of days allowed to borrow a book

2. Case 02
The maximum number of borrowed books.
Business Rule
15 books is The maximum number of borrowed books.

3. Case 03
Renew the book return due date 
Business Rule
Customers can renew the book return due date twice only

4. Case 04
Number of Publisher for every Book
Business Rule
Every Book Should have only one Publisher

5. Case 05
Each branch must have enough books to borrow
Business Rule
Each Branch should have at least 500 Books

6. Case 06
Book borrowing is available to all members 
Business Rule
A bookID can be rented to one customer only.

7. Case 06
Book borrowing is available to all members 
Business Rule
A bookID can be rented to one customer only.

### Tables 
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
