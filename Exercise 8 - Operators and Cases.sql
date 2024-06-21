-- Exercise 8 - Operators and Cases

/*-----------------------------------------*/
-- Select all Books written before 1980

SELECT title
FROM books
WHERE released_year < 1980;

/*-----------------------------------------*/
-- Select all Books written by Eggers or Chabon

SELECT title
FROM books
WHERE author_lname IN ('Eggers', 'Chabon');

/*-----------------------------------------*/
-- Select all Books written by Lahiri after the year 2000

SELECT title
FROM books
WHERE author_lname = 'Lahiri' AND released_year > 2000;

/*-----------------------------------------*/
-- Select all Books with a page count between 100 and 200

SELECT title
FROM books 
WHERE pages BETWEEN 100 AND 200;

/*-----------------------------------------*/
-- Select all Books where authors last name starts with an L or an S

SELECT title
FROM books 
WHERE author_lname LIKE 'L%' OR 'S%';

/*-----------------------------------------*/
-- Create another column output: if title conatins 'stories' list it as Short Stories, Just Kids and a heartbreaking work... as Memoir, everything else: Novel

SELECT  title, author_lname,
CASE 
    WHEN title LIKE '%stories%' THEN 'Short Stories'
    WHEN title = 'Just Kids' THEN 'Memoir'
    WHEN title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memoir'
    ELSE 'Novel'
END AS type
FROM books;

/*-----------------------------------------*/
-- Count the number of books an author has written and list it as x books in a seperate column

SELECT author_fname, author_lname,
CASE
    WHEN COUNT(*) = 1 THEN '1 book'
    ELSE CONCAT(COUNT(*), ' ', 'books') 
END AS books_written
FROM books
GROUP BY author_fname, author_lname;

