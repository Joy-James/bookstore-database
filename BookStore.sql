USE BookStore;

CREATE TABLE Authors(
AuthorId INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50)
);

SELECT* FROM Authors;
INSERT INTO Authors(AuthorId,FirstName,LastName)
VALUES
(1, 'John','Nyoro'),
(2, 'Joy',' Njuguna'),
(3, 'Armstrong','  Njuguna');

SELECT* FROM Authors;

CREATE TABLE BOOKS(
BookId INT PRIMARY KEY,
Title VARCHAR (100),
AuthorId INT,
FOREIGN KEY (AuthorId) REFERENCES Authors(AuthorId)
);

SELECT*FROM BOOKS;

INSERT INTO BOOKS(BookId,Title,AuthorId)
VALUES
(001,'The River&The Source', 1),
(002,'The Pearl', 2),
(004,'The Pearl', 2),
(003,'Kidagaa Kimemwozea', 3);
/*Write a query to retrieve the book with the title 'Book2'.*/

SELECT*FROM BOOKS WHERE Title='The pearl';
SELECT*FROM BOOKS WHERE Title='The River&The Source';

/*Write a query to update the author's last name to 'Smithson' for the book with the title 'Book1'.*/
 UPDATE BOOKS SET AuthorId=(
 SELECT TOP 1 AuthorId FROM Authors WHERE LastName='Nyoro'
 )
 WHERE Title= 'The River&The Source';
 /*Write a query to delete the author with the AuthorID 3 and all their associated books from the database.*/

 DELETE FROM BOOKS WHERE AuthorId=3;
 DELETE FROM Authors WHERE AuthorId=3;

 /*Write a query to count the total number of books in the "Books" table.*/
 SELECT COUNT(*) AS TotalBooks FROM BOOKS;
 /*Write a query to retrieve all books along with their authors' first and last names.*/

 SELECT BOOKS.Title, Authors.FirstName, Authors.LastName FROM BOOKS
 JOIN Authors ON BOOKS.AuthorId=Authors.AuthorId;