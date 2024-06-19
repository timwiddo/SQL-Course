-- Exercise 4 String Functions 

CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

/* -------------------------------------------- */

SELECT 
    *
FROM
    books;

/* -------------------------------------------- */

-- Get the authors initials

SELECT 
    CONCAT(
	    SUBSTR(author_fname, 1, 1),
            '.',
            SUBSTR(author_lname, 1, 1),
            '.') AS Initials
FROM
    books;

/* -------------------------------------------- */

-- Reverse and uppercase a string of your choice

SELECT REVERSE(UPPER('Hello World!'));

/* -------------------------------------------- */

-- What does this return?

SELECT 
    REPLACE(CONCAT('I', ' ', 'like', ' ', 'cats'),
        ' ',
        '-');
-- My answer: I-like-cats

/* -------------------------------------------- */

-- Replace the book title spaces with ->

SELECT REPLACE(title, ' ', '->')
FROM books;

/* -------------------------------------------- */

-- print authors fname as forwards and its reverse as backwards 

SELECT
    author_fname AS forwards,
    REVERSE(author_fname) AS backwards
FROM books;

/* -------------------------------------------- */

-- print the authors full name in caps

SELECT
	UPPER
    (
		CONCAT
		(
				author_fname,
                ' ',
                author_lname
                )
		) AS full_name_caps
	FROM books;

/* -------------------------------------------- */

-- Show when the books got released

SELECT 
	CONCAT(
		title,
                ' was released in ',
		released_year
                )
FROM books;

/* -------------------------------------------- */

-- show the title length (characters)

SELECT title,
	char_length(title) AS length
FROM books;

/* -------------------------------------------- */

-- show the shortened booktitle xxx...., the author Smith, John and the quantities in stock

SELECT
    CONCAT(SUBSTR(title, 1,10), '...') AS short_title,
    CONCAT(author_lname, ', ', author_fname) AS author_fullname,
    CONCAT(stock_quantity, ' in stock') AS quantity
FROM books;

/* -------------------------------------------- */
