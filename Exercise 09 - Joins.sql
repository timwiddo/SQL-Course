-- Exercise 9 - Joins
-- create tables shown in udemy course

CREATE TABLE students(
	id INT AUTO_INCREMENT,
    first_name VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE papers (
	title VARCHAR(255),
    grade INT,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id)
);

-- insert the given data

    INSERT INTO students (first_name) VALUES 
    ('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
     
    INSERT INTO papers (student_id, title, grade ) VALUES
    (1, 'My First Book Report', 60),
    (1, 'My Second Book Report', 75),
    (2, 'Russian Lit Through The Ages', 94),
    (2, 'De Montaigne and The Art of The Essay', 98),
    (4, 'Borges and Magical Realism', 89);
    
  -- print name title and grade
  
SELECT first_name, title, grade
FROM students s
JOIN papers p ON s.id = p.student_id
ORDER BY grade DESC;
    
  -- print name title and grade event with students who havent written anything   
    
SELECT first_name, title, grade
FROM students s
LEFT JOIN papers p ON s.id = p.student_id;
 
-- if no paper exists it should show the value null as missing and the grade as 0
    
SELECT first_name, IFNULL(title, 'MISSING'), IFNULL(grade, 0)
FROM students s
LEFT JOIN papers p ON s.id = p.student_id;
    
-- get the average grade of each student    
    
SELECT first_name,  AVG(IFNULL(grade, 0)) AS average_grade
FROM students s
LEFT JOIN papers p ON s.id = p.student_id
GROUP BY first_name
ORDER BY average_grade DESC;
    
 -- get the average grade of each student and if the avg is over 75 they pass the semester
    
 SELECT first_name,  AVG(IFNULL(grade, 0)) AS average_grade,
 CASE
	WHEN AVG(IFNULL(grade, 0)) > 75 THEN 'PASSING'
    ELSE 'FAILING'
 END AS passing_test
FROM students s
LEFT JOIN papers p ON s.id = p.student_id
GROUP BY first_name
ORDER BY average_grade DESC;   
    
    
