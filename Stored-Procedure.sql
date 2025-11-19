use SCHOOL;

USE SCHOOL;

CREATE TABLE Authors (
    AuthorId INT PRIMARY KEY,
    AuthorName NVARCHAR(50)
);

CREATE TABLE Books (
    BookId INT PRIMARY KEY,
    Title NVARCHAR(100),
    AuthorId INT,
    FOREIGN KEY (AuthorId) REFERENCES Authors(AuthorId)
);


INSERT INTO Authors VALUES 
(1, 'J.K. Rowling'), 
(2, 'George Orwell');

INSERT INTO Books VALUES
(1, 'Harry Potter', 1),
(2, 'Harry Potter 2', 1),
(3, '1984', 2),
(4, 'Animal Farm', 2);


?? created procedure for getting all books ??

create procedure GetAllBooks
as 
begin
select title from books;
end;

exec GetAllBooks;

?? created procedure for getting the specific author??

create procedure GetSpecificAuthor
@AuthorName nvarchar(20)
as 
begin
select b.title,a.AuthorName from books b join authors a on b.authorId = a.AuthorId where a.authorName =@AuthorName;
end;

exec GetSpecificAuthor 'George Orwell';

??created function to return no of books by specific author??


create function dbo.GetBooksCount(@authorName nvarchar(20))
returns int
as 
begin
declare @count int;
select @count = Count(*) from books b join authors a on b.authorId=a.authorId where a.AuthorName=@authorName;
return @count;
end;


select dbo.GetBooksCount('J.K. Rowling')as result;

drop function GetBooksCount