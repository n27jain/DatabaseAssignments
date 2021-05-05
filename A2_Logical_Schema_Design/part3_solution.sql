#
# ECE356 - Lab 2
# Fall 2020
#
# Modify this file to achieve the requirements listed in Part 3 of the Lab 2
# specifications.
#
# The entirety of this script will be run and the resulting databases will be
# analyzed to determine the correctness of your implementation, and whether you
# performed the decomposition correctly.

#
# DROP tables

DROP TABLE IF EXISTS Assigned;
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;

#
# CREATE tables

CREATE TABLE Department(
deptID INT,
deptName VARCHAR(100),
location VARCHAR(100)
);

CREATE TABLE Employee(
empID INT,
emp_fname VARCHAR(20),
emp_initials VARCHAR(3),
emp_lname VARCHAR(20),
job VARCHAR(100),
deptID INT,
salary INT
);

CREATE TABLE Project(
projID INT,
title VARCHAR(100),
phase VARCHAR(20),
budget DECIMAL(10,2),
funds DECIMAL(10,2)
);

CREATE TABLE Assigned(
empID INT,
projID INT,
roleID INT,
role_description VARCHAR(100),
role_level VARCHAR(100),
start_date DATE,
end_date DATE,
assigned_status VARCHAR(20)
);

#
# Insert

INSERT INTO Department(deptID, deptName, location) VALUES(3, 'Marketing', '200 University Av W, Waterloo, ON, N2L3G1');
INSERT INTO Department(deptID, deptName, location) VALUES(7, 'Research', '10 Victoria St A, Kitchener, ON, N2G1C5');
INSERT INTO Department(deptID, deptName, location) VALUES(12, 'Software', '27 King College Cir, Toronto, ON, M5S5R5');
INSERT INTO Department(deptID, deptName, location) VALUES(13, 'Computing', '1265 Military Trail, Scarborough, ON, M1C14A');
INSERT INTO Department(deptID, deptName, location) VALUES(24, 'Training', '27 King College Cir, Toronto, ON, M5S5R5');
INSERT INTO Department(deptID, deptName, location) VALUES(25, 'Human Resources', '1265 Military Trail, Scarborough, ON, M1C14A');
INSERT INTO Department(deptID, deptName, location) VALUES(27, 'Food Services', '1265 Military Trail, Scarborough, ON, M1C14A');

INSERT INTO Employee(empID, emp_fname,emp_initials,emp_lname, job, deptID, salary) VALUES(23, 'Peter','M','Lewis', 'Programmer', 12, 35000);
INSERT INTO Employee(empID, emp_fname,emp_initials,emp_lname, job, deptID, salary) VALUES(45, 'Kelly','M','Baldwin', 'Engineer', 7, 37000);
INSERT INTO Employee(empID, emp_fname,emp_initials,emp_lname, job, deptID, salary) VALUES(56, 'Henrri',' ','Twain','Janitor', 7, 26000);
INSERT INTO Employee(empID, emp_fname,emp_initials,emp_lname, job, deptID, salary) VALUES(89, 'Williams','R','King', 'Analyst', 12, 36000);
INSERT INTO Employee(empID, emp_fname,emp_initials,emp_lname, job, deptID, salary) VALUES(77, 'Hergot',' ','Dickens','Secretary', 7, 28000);
INSERT INTO Employee(empID, emp_fname,emp_initials,emp_lname, job, deptID, salary) VALUES(66, 'Hess','J','Joyce', 'Technician', 7, 32000);
INSERT INTO Employee(empID, emp_fname,emp_initials,emp_lname, job, deptID, salary) VALUES(92, 'Mays',' ','Woolf','Engineer', 7, 45000);
INSERT INTO Employee(empID, emp_fname,emp_initials,emp_lname, job, deptID, salary) VALUES(68, 'Morris',' ','Austen','Secretary', 3, 23000);
INSERT INTO Employee(empID, emp_fname,emp_initials,emp_lname, job, deptID, salary) VALUES(69, 'Maria',' ','Jimenes','Engineer', 3, 32000);
INSERT INTO Employee(empID, emp_fname,emp_initials,emp_lname, job, deptID, salary) VALUES(78, 'Margaret',' ','Lee','Secretary', 25, 23000);
INSERT INTO Employee(empID, emp_fname,emp_initials,emp_lname, job, deptID, salary) VALUES(79, 'Paul',' ','Wilde','Engineer', 27, 32000);
INSERT INTO Employee(empID, emp_fname,emp_initials,emp_lname, job, deptID, salary) VALUES(99, 'Victor','L ','Kelly','Recruter', 27, 50000);

INSERT INTO Project(projID, title, phase,budget, funds) VALUES(345, 'Compiler', 'development', 500000.00, 250000.00);
INSERT INTO Project(projID, title, phase, budget, funds) VALUES(123, 'Display', 'testing',650000.00, 370000.00);
INSERT INTO Project(projID, title, phase, budget, funds) VALUES(333, 'Database', 'released',650000.00, 370000.00);

INSERT INTO Assigned(empID, projID, roleID, role_description,role_level,start_date,end_date,assigned_status)
               VALUES(23, 345, 1,'Programmer','L1','2016-06-20',NULL,'active');
INSERT INTO Assigned(empID, projID,roleID, role_description,role_level, start_date,end_date,assigned_status)
               VALUES(66, 123, 1,'Programmer','L1','2016-08-25','2016-12-25','inactive');
INSERT INTO Assigned(empID, projID,roleID, role_description,role_level, start_date,end_date,assigned_status)
               VALUES(77, 123, 2,'Admin Assistant','L1','2015-01-03',NULL,'active');
INSERT INTO Assigned(empID, projID,roleID, role_description,role_level, start_date,end_date,assigned_status)
               VALUES(45, 123,3, 'Manager','L4','2015-02-03',NULL,'active');
INSERT INTO Assigned(empID, projID,roleID, role_description,role_level, start_date,end_date,assigned_status)
               VALUES(89, 123,3, 'Manager','L4','2017-02-03',NULL,'active');
INSERT INTO Assigned(empID, projID, roleID,role_description,role_level, start_date,end_date,assigned_status)
               VALUES(92, 345, 4,'Database specialist','L1','2017-02-03',NULL,'active');
INSERT INTO Assigned(empID, projID,roleID, role_description,role_level, start_date,end_date,assigned_status)
               VALUES(89, 345, 3,'Manager','L4','2017-05-03',NULL,'active');
INSERT INTO Assigned(empID, projID,roleID, role_description,role_level, start_date,end_date,assigned_status)
               VALUES(92, 345, 5,'Engineer','L2','2017-01-03',NULL,'active');
INSERT INTO Assigned(empID, projID,roleID, role_description,role_level, start_date,end_date,assigned_status)
               VALUES(78, 345, 3,'Manager','L4','2016-01-03','2017-01-03','inactive');
INSERT INTO Assigned(empID, projID,roleID, role_description,role_level, start_date,end_date,assigned_status)
               VALUES(79, 123, 5,'Engineer','L2','2016-01-03',NULL,'active');