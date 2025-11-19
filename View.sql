create database ViewConcept

use ViewConcept

create table Author(
AuthorId int primary key,
AuthorName nvarchar(20)
)
INSERT INTO Author (AuthorId, AuthorName) VALUES
(1, 'J.K. Rowling'),
(2, 'George Orwell'),
(3, 'Chetan Bhagat'),
(4, 'Agatha Christie'),
(5, 'Dan Brown'),
(6, 'Paulo Coelho'),
(7, 'Stephen King'),
(8, 'Arthur Conan Doyle'),
(9, 'Leo Tolstoy'),
(10, 'Mark Twain');


create table Books(
BookId int primary key,
Title nvarchar(50),
AuthorId int foreign key references Author(AuthorId)
)
INSERT INTO Books (BookId, Title, AuthorId) VALUES
(1, 'Harry Potter and the Sorcerer''s Stone', 1),
(2, 'Harry Potter and the Chamber of Secrets', 1),
(3, '1984', 2),
(4, 'Animal Farm', 2),
(5, '2 States', 3),
(6, 'Sherlock Holmes: A Study in Scarlet', 8),
(7, 'The Da Vinci Code', 5),
(8, 'Angels and Demons', 5),
(9, 'The Alchemist', 6),
(10, 'The Shining', 7),
(11, 'War and Peace', 9),
(12, 'Adventures of Huckleberry Finn', 10);


create view BookAuthorView
as
select b.BookId,b.Title as BookTitle,a.AuthorName from books b join Author a on a.AuthorId=b.AuthorId;


select *from BookAuthorView