-- Exercise 2

-- Create an employees table meeting the following rules
	-- id -> unique identifier and auto increments
    -- full names of employees maximum size 100, first and last names are mandatory
    -- employees age
    -- employment status with a default value as employes and a mandatory entry
    
CREATE TABLE Employees (
		id INT AUTO_INCREMENT,
        last_name VARCHAR(100) NOT NULL,
        first_name VARCHAR(100) NOT NULL,
        middle_name VARCHAR(100),
        age INT NOT NULL,
        current_status VARCHAR(100) NOT NULL DEFAULT  'employed',
        PRIMARY KEY (id)
	);
    
    DESC employees ;
