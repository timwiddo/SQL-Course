-- Exercise 6 - More on Data Types

/*
1. What is a good usecase for CHAR over VARCHAR?

    Consistent Data Length:
        State/Country Abbreviations

    Performance Optimization:
         Fixed amount of storage space/ optimizes DB searching for values

    Indexing Efficiency:
         more efficient to look after if column is frequently used

    Memory Usage:
        Takes less memory space

    String Padding:
        When you need to ensure that all entries in a column are the same length (ZIP Codes) 123 becomes 00123
        
2. Fill in the blanks

CREATE TABLE inventory (
	item_name _____,
    price _________, (less than a million dollars, 2 decimals)
    quantity _______
    );
    
CREATE TABLE inventory (
item_name VARCHAR(255),
price DECIMAL(8, 2),
quantity INT
);

3. Whats the difference between DATETIME and TIMESTAMP

	The difference lies within the range:
			DATETIME -> 1000-01-01 until 9999-12-31
			while TIMESTAMP goes roughly from 1970 to 2038.
            So timestamp takes up less space.
	
4. Print out the current time! */

SELECT CURTIME();

-- 5. Print the current Date without the time!

SELECT CURDATE();

-- 6. Print the current day of the week as a number

SELECT DAYOFWEEK(CURDATE()); -- (Sunday = 1, Monday = 2,....)

-- 7. Print the current day of the week (the name)

SELECT DAYNAME(CURDATE());

-- 8. Print the current date in this format mm/dd/yyyy

SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y') AS formatted_date1;

-- 9.  Print the current date in this format January 2nd at 9:15
    
SELECT DATE_FORMAT(NOW(), '%M %D at %k:%i') AS formatted_date2; 
    
-- 10.Create a tweets table that stores tweet content, username, time it was created

USE exercises_udemy;

CREATE TABLE tweets (
    content VARCHAR(180),
    username VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
    );
 
 INSERT INTO tweets (content, username)
VALUES ('How are you guys?', 'Beefeater432');

SELECT *
FROM tweets;


