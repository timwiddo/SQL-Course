-- Exercise 1
CREATE TABLE people (
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT
);

-- Insert a person
INSERT INTO people (first_name, last_name, age)
VALUES ('Tina', 'Belcher', 13);

-- Insert multiple persons
INSERT INTO people (first_name, last_name, age)
VALUES ('Linda', 'Belcher',  45),
				('Phillip', 'Frond', 38),
                ('Calvin', 'Fischoeder', 70);

SELECT * FROM people 