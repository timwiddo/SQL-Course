-- Exercise 3
USE shirts_db;
-- Create a DB for shirts

CREATE DATABASE shirts_db ;

-- Create Table shirts

CREATE TABLE shirts (
    shirt_id INT AUTO_INCREMENT,
    article VARCHAR(50) ,
    color VARCHAR(50) ,
    shirt_size VARCHAR(5) ,
    last_worn INT ,
    PRIMARY KEY (shirt_id)
    );
    
    -- Insert values
    
    INSERT INTO shirts (article, color, shirt_size, last_worn)
    VALUES 
	('t-shirt', 'white', 'S', 10),
	('t-shirt', 'green', 'S', 200),
	('polo shirt', 'black', 'M', 10),
	('tank top', 'blue', 'S', 50),
	('t-shirt', 'pink', 'S', 0),
	('polo shirt', 'red', 'M', 5),
	('tank top', 'white', 'S', 200),
	('tank top', 'blue', 'M', 15);

-- Get all the Data

SELECT * FROM shirts;

--  Add A New Shirt: Purple polo shirt, size M last worn 50 days ago

INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ('polo shirt', 'purple', 'M', 50);

-- select practice on shirts

SELECT article, color
FROM shirts;

SELECT * FROM shirts 
WHERE shirt_size='M';

SELECT article, color, shirt_size, last_worn 
FROM shirts 
WHERE shirt_size='M';

-- Updating practice

UPDATE shirts 
SET 
    shirt_size = 'L'
WHERE
    article = 'polo shirt';
  -- ----------------- --  
    UPDATE shirts 
SET 
    last_worn = 0
WHERE
    last_worn = 15;
  -- ----------------- --  
UPDATE shirts 
SET 
    color = 'off white',
    shirt_size = 'XS'
WHERE
    color = 'white';
    
    -- Deleting practice 
		-- always check the where clause with a SELECT statement to ensure deleting the right thing

SELECT * FROM shirts WHERE last_worn=200;
 
DELETE FROM shirts WHERE last_worn=200;

 -- ----------------- --
 
SELECT * FROM shirts WHERE article='tank top';
 
DELETE FROM shirts WHERE article='tank top';

 -- ----------------- --
 
 SELECT * FROM shirts;
 
DELETE FROM shirts;
 
 -- ----------------- --
 
 DROP TABLE shirts;
