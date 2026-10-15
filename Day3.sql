-- # 🟢 EASY (1–40)

-- --1. List all books in the library.
SELECT * from books; 
-- --2. Show all members.
select * from members;
-- --3. Display all authors.
select * from authors;
-- 4. Find books with price > 300.
select * from books where price > 300;
-- 5. List members from Mumbai.
select * from members where city = 'Mumbai';
-- 6. Show books published after 2000.
select * from books where published_year > 2000;
-- 7. Get all borrow records.
select * from borrow;
-- 8. Show books sorted by price ascending.
select * from books order by price;
-- 9. Display top 5 expensive books.

select * from books;
SELECT title, price, price_rank
FROM (
  SELECT title, price,
         DENSE_RANK() OVER (ORDER BY price DESC) AS price_rank
  FROM books
) AS ranked_books
WHERE price_rank <= 5
ORDER BY price DESC;

SELECT title, price,
       ROW_NUMBER() OVER (ORDER BY price DESC) AS r
FROM books
ORDER BY price DESC
LIMIT 5;

select title, price from books where price in (
    select price from books group by price order by price desc limit 5
)
order by price desc;
-- 10. Find cheapest book.
select title, price from books where price in (select min(price) from books);
-- 11. List authors from USA.
SELECT * from authors where country = 'USA';
-- 12. Show members who joined in 2023.
select * from members where extract(year from join_date) = 2023;
-- 13. Find books with NULL return date.
select * from borrow where return_date is null;
-- 14. Show books whose title contains 'The'.
select * from books where title like '%The%';
-- 15. Display distinct cities of members.
select distinct city from members;
-- 16. Count total books.
select count(title) total_books from books; 
-- 17. Count total members.
select * from members;
select count(distinct member_id) from members;
-- 18. Show borrow records for book_id = 101.
select * from borrow where book_id = 101;
-- 19. List books written by author_id = 2.
select * from authors where author_id = 2;
-- 20. Show members whose name starts with 'S'.
select * from members where member_name like 'S%';
-- 21. Display books priced between 200 and 500.
select * from books where price between 200 and 500;
-- 22. Show authors not from UK.
SELECT * from authors where country <> 'UK';
-- 23. List books ordered by published_year DESC.
SELECT * from books order by published_year desc;
-- 24. Find members from Delhi or Bangalore.
select * from members where city in ('Delhi', 'Bangalore');
-- 25. Show borrow records after 2023-05-01.
select * from borrow where borrow_date > '2023-05-01';
-- 26. Display books with price not equal to 350.
select * from books where price <> 350;
-- 27. Show books published before 1950.
SELECT * from books where published_year < 1950;
-- 28. List members who joined before March 2023.
SELECT * from members where to_char(join_date, 'MM-YYYY') < '03-2023';
-- 29. Find all returned books.
SELECT * from borrow where return_date is not null;
-- 30. Show all not returned books.
SELECT * from borrow where return_date is null;
-- 31. Display total borrow entries.
select count(DISTINCT borrow_id) total_boorow from borrow;
-- 32. Find max book price.
select title, price from (select title, price, dense_rank()over(order by price desc) r from books) where r = 1;
-- 33. Find min book price.
select title, price from (select title, price, dense_rank()over(order by price) r from books) where r = 1;
-- 34. Find average book price.
select avg(price) from books;
-- 35. Show books with price > average price.
SELECT * FROM books where price > (select avg(price) from books);

with avg_price as(
    select avg(price) avg_price from books
)
select avg_price, title, price from books, avg_price where price > avg_price; 
-- 36. List members in alphabetical order.
select * from members ORDER BY member_name;
-- 37. Show authors sorted by name.
select * from authors order by author_name;
-- 38. Find books published in 1949.
select * from books where published_year = 1949;
-- 39. Show borrow entries ordered by borrow_date.
select * from borrow order by borrow_date;
-- 40. Display books with NULL author_id (if any).
select * from books where author_id is null;

-- ---

-- # 🟡 INTERMEDIATE (41–75)

-- 41. Show book title with author name.
-- 42. Display member name with borrowed book.
-- 43. List all books with author country.
-- 44. Show number of books per author.
-- 45. Count books borrowed by each member.
-- 46. Show members who borrowed at least one book.
-- 47. Find books never borrowed.
-- 48. Find members who never borrowed books.
-- 49. Show most borrowed book.
-- 50. Find author with most books.
-- 51. Show total revenue per author (sum of book price).
-- 52. Find average price per author.
-- 53. Show books borrowed more than once.
-- 54. List members who borrowed "1984".
-- 55. Show borrow history with member + book name.
-- 56. Find books borrowed in June 2023.
-- 57. Show books currently not returned.
-- 58. Display number of books per published year.
-- 59. Show authors and number of borrowings of their books.
-- 60. Find members who borrowed books from UK authors.
-- 61. Show books with borrower names.
-- 62. List members who borrowed more than 1 book.
-- 63. Find second highest priced book.
-- 64. Show books above average price per author.
-- 65. List books along with borrow count.
-- 66. Find members who borrowed latest book.
-- 67. Show books never borrowed using LEFT JOIN.
-- 68. Find authors whose books are never borrowed.
-- 69. Show city-wise borrow count.
-- 70. Find members who borrowed books after joining date.
-- 71. Show book title + number of borrowers.
-- 72. Find books with no return date and borrower info.
-- 73. Show total books borrowed per city.
-- 74. List authors with at least 2 books.
-- 75. Show most recent borrow entry.

-- ---

-- # 🔴 HARD (76–100)

-- 76. Find top 3 most borrowed books.
-- 77. Show ranking of books by borrow frequency.
-- 78. Find member who borrowed highest priced book.
-- 79. Show author ranking by total borrow count.
-- 80. Find books borrowed by all members (if any).
-- 81. Show members who borrowed every book from an author.
-- 82. Find books never borrowed using NOT EXISTS.
-- 83. Find members who borrowed all books written by one author.
-- 84. Show running total of borrows per member.
-- 85. Rank members by number of borrows.
-- 86. Find duplicate borrow records (same book, member).
-- 87. Show books borrowed in consecutive months.
-- 88. Find author whose books generate highest borrow activity.
-- 89. Show members with gap > 30 days between borrows.
-- 90. Find books borrowed and returned same day.
-- 91. Show borrow trend by month (grouping).
-- 92. Find books borrowed more than average borrow count.
-- 93. Show authors whose books are never returned late.
-- 94. Find member who borrowed most expensive book earliest.
-- 95. Show percent contribution of each author in borrow activity.
-- 96. Find books borrowed but never returned (still active).
-- 97. Show second most borrowed book per author.
-- 98. Find members who borrowed books from multiple authors.
-- 99. Show author whose books are borrowed across all cities.
-- 100. Build a query to identify “most active member” using multiple metrics (borrow count + recency).


