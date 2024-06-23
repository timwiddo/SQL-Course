-- Exercise 11 - Views 

-- INSTEAD OF TYPING THIS QUERY ALL THE TIME...
SELECT 
    title, released_year, genre, rating, first_name, last_name
FROM
    reviews
        JOIN
    series ON series.id = reviews.series_id
        JOIN
    reviewers ON reviewers.id = reviews.reviewer_id;

-- WE CAN CREATE A VIEW:
CREATE VIEW full_reviews AS
SELECT title, released_year, genre, rating, first_name, last_name FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;
 
-- NOW WE CAN TREAT THAT VIEW AS A VIRTUAL TABLE 
-- (AT LEAST WHEN IT COMES TO SELECTING)

SELECT * FROM full_reviews;

-- We cant delete from this table (in most cases)

CREATE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

SELECT * FROM ordered_series; -- (here we could insert values)
-- Look docs for when a viewtable is updateable

-- we can update views 

CREATE OR REPLACE VIEW ordered_series AS -- ALTER VIEW would also work and DROP VIEW is also possible
SELECT * FROM series ORDER BY released_year DESC;

SELECT * FROM ordered_series;

-- HAVING : specifies Group by statements

SELECT title, ROUND(AVG(rating), 2) AS average_rating, COUNT(*) AS review_count 
FROM full_reviews
GROUP BY title
HAVING COUNT(*) > 1;

-- GROUP BY , ROLLUP

SELECT title, ROUND(AVG(rating), 2) AS average_rating
FROM full_reviews
GROUP BY title WITH ROLLUP; -- (ROLLUP gives AVG Rating of whole table)

SELECT title, ROUND(AVG(rating), 2) AS average_rating, COUNT(*) AS rating_count
FROM full_reviews
GROUP BY title WITH ROLLUP; -- (ROLLUP gives AVG Rating of whole table)

SELECT released_year, ROUND(AVG(rating), 2) AS average_rating,  genre
FROM full_reviews
GROUP BY released_year, genre WITH ROLLUP; -- (ROLLUP gives AVG Rating of whole table and all groupings);

-- MODES

SELECT @@Global.sql_mode;
SELECT @@Session.sql_mode;

-- SETTING MODES:

SELECT 3/0;
SHOW warnings;
-- let's get rid of that  



-- SET GLOBAL sql_mode = 'mode'; would also work
SET SESSION sql_mode = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,
													NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';

SELECT 3/0;
SHOW warnings; -- no warnings anymore

-- STRICT TRANS TABLES 
-- ensures that new values are of the correct datatype (no string in an INT column)
-- if we disable this mode it converts the string into a fitting  0 value decimal for exaple

-- more useful modes in docs (GROUP BY/ ZERO DATES,... ETC.)

