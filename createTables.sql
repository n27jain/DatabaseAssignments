DROP TABLE IF EXISTS Department;           
CREATE TABLE Department(deptID INT,deptName VARCHAR(100),location VARCHAR(100));                    
          
DROP TABLE IF EXISTS Employee;  
CREATE TABLE Employee(empID INT,empName VARCHAR(100),job VARCHAR(100),deptID INT,salary INT);
                  
 DROP TABLE IF EXISTS Assigned;             
CREATE TABLE Assigned(empID INT,projID INT,role VARCHAR(100));                 
        
DROP TABLE IF EXISTS Project;           
CREATE TABLE Project(projID INT,title VARCHAR(100),budget INT,funds INT);



INSERT INTO Department(deptID, deptName, location) VALUES(3, 'marketing', 'Toronto');
INSERT INTO Department(deptID, deptName, location) VALUES(7, 'research', 'Waterloo');
INSERT INTO Department(deptID, deptName, location) VALUES(12, 'software', 'Markham'); 
INSERT INTO Department(deptID, deptName, location) VALUES(13, 'computing', 'Kitchener'); 



INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(23, 'Smith', 'programmer', 12, 35000); 
INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(45, 'Kelly', 'engineer', 7, 37000); 
INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(56, 'Herr', 'janitor', 7, 26000); 
INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(89, 'Williams', 'analyst', 12, 36000); 
INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(77, 'Hergot', 'secretary', 7, 28000);
INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(66, 'Hess', 'technician', 7, 32000); 
INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(92, 'Mays', 'engineer', 7, 45000); 
INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(68, 'Morris', 'secretary', 3, 23000);
INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(69, 'Maria', 'engineer', 3, 32000); 
            
          
            
INSERT INTO Assigned(empID, projID, role) VALUES(23, 345, 'programmer');            
INSERT INTO Assigned(empID, projID, role) VALUES(66, 123, 'programmer');        
INSERT INTO Assigned(empID, projID, role) VALUES(77, 123, 'secretary');           
INSERT INTO Assigned(empID, projID, role) VALUES(45, 123, 'manager'); 
INSERT INTO Assigned(empID, projID, role) VALUES(89, 345, 'manager');     
INSERT INTO Assigned(empID, projID, role) VALUES(92, 123, 'engineer'); 


           
INSERT INTO Project(projID, title, budget, funds) VALUES(345, 'compiler', 500000, 250000);
INSERT INTO Project(projID, title, budget, funds) VALUES(123, 'display', 650000, 370000);




