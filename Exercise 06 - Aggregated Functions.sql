-- Exercise 6 Aggregated Functions

/*----------------------------------------------*/
-- how many books were released in each year?

SELECT released_year, COUNT(*) AS books_released
FROM books 	
GROUP BY released_year;

/*----------------------------------------------*/
-- get the total number of books in stock

SELECT SUM(stock_quantity) AS total_books_in_stock
FROM books;

/*----------------------------------------------*/
-- find the average release year for each author

SELECT CONCAT(author_fname,' ', author_lname) AS author, AVG(released_year)
FROM books 
GROUP BY author;

/*----------------------------------------------*/
-- find the full name of author who wrote the longest book

SELECT CONCAT(author_fname,' ', author_lname) AS full_name
FROM books
WHERE pages = ( SELECT MAX(pages) FROM books);

/*----------------------------------------------*/
-- get the ordered years, number of books and avg pages 

SELECT released_year, COUNT(*) AS books_released, AVG(pages) AS average_pages
FROM books
GROUP BY released_year
ORDER BY released_year;

/*----------------------------------------------*/
