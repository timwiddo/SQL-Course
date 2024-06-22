-- Exercise 5

INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
           
SELECT *
FROM books;

/*----------------------------------------------------*/
-- Select titles that contain 'stories'

SELECT title
FROM books 
WHERE title LIKE '%stories%';

/*----------------------------------------------------*/
-- Find the book with the most pages

SELECT title
FROM books 
ORDER BY pages DESC
LIMIT 1;

/*----------------------------------------------------*/
-- print a summary containing title and year of the three most recent books

SELECT  CONCAT(title,' - ', released_year)  AS summary
FROM books 
ORDER BY released_year DESC
LIMIT 3;

/*----------------------------------------------------*/
-- find all books with an author lastname that contains a space character 

SELECT title, author_lname
FROM books 
WHERE author_lname LIKE '% %';

/*----------------------------------------------------*/
-- find the three books with the lowest stock quantity

SELECT title, stock_quantity
FROM books 
ORDER BY stock_quantity 
LIMIT 3;

/*----------------------------------------------------*/
-- sort titles and author names

SELECT title, author_lname
FROM books 
ORDER BY author_lname, title;

/*----------------------------------------------------*/
-- create output shown in the udemy course
-- ( MY FAVOURITE AUTHOR IS XXX <-authors full names sorted by last name)

SELECT CONCAT(
		'MY FAVOURITE AUTHOR IS',
                ' ',
                UPPER(author_fname),
                ' ',
		UPPER(author_lname),
                '!') AS yell
FROM books
ORDER BY yell DESC;

/*----------------------------------------------------*/
-- that's it with chapter 8
