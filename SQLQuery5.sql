use Aggregation;

create table salebook(
BookId int primary key,
SaleDate date ,
SaleAmount decimal(10,2)

);


INSERT INTO salebook(BookId, SaleDate, SaleAmount) VALUES
(1, '2025-01-05', 250.50),
(2, '2025-02-12', 180.00),
(3, '2025-03-20', 320.75),
(4, '2025-04-15', 150.00),
(5, '2025-05-30', 400.20),
(6, '2025-06-10', 275.00),
(7, '2025-07-22', 500.99),
(8, '2025-08-05', 350.50),
(9, '2025-09-14', 420.00),
(10, '2025-10-01', 290.80);


select bookId,sum(SaleAmount) as TotalSales from salebook Group By BookId;

select bookId,YEAR(SaleDate)as SaleYear,SUM(SaleAmount) from salebook group by BookId,YEAR(SaleDate);

select BookId,sum(SaleAmount)as Totalsales  from salebook group by BookId having sum(SaleAmount)>300;

CREATE TABLE Books (
    BookId INT PRIMARY KEY,
    Title NVARCHAR(100)
);

INSERT INTO Books VALUES
(1, 'Harry Potter'),
(2, 'Cricket'),
(3, 'Football'),
(4, 'Tennis'),
(5, 'Hockey'),
(6, 'Magic Book'),
(7, 'Science Magic'),
(8, 'Space Story'),
(9, 'Future World'),
(10, 'Life Lessons');


?? stored procdure for getting the get sale by title ??

create procedure GetTotalSalesByTitle
@title nvarchar(100)
as 
begin 
select b.title,Sum(s.saleamount)as totalSales from books b join Salebook s on s.BookId=b.BookId where b.Title=@title  group by b.Title;
end

exec GetTotalSalesByTitle 'Hockey';

?? user-defined functions calculate average sale amount ??

create function AvgSalary()
returns decimal(10,2)
as 
begin
declare @Avg decimal(10,2);

select @Avg =AVG(SaleAmount) from salebook
    return @Avg;
end


select dbo.AvgSalary() as AvgSalary;