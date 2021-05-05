---- 1b
SELECT job, COUNT(empID) as count  FROM Employee GROUP BY job ORDER BY job asc ;

---- 1e
SELECT deptID from 
(SELECT deptID, COUNT(empID) as SIZE FROM Employee where job = "engineer"  GROUP BY deptID ORDER BY deptID asc) as output 
WHERE SIZE = (SELECT MAX(SIZE) from (SELECT deptID, COUNT(empID) as SIZE FROM Employee where job = "engineer"  GROUP BY deptID ORDER BY deptID asc) as output) ;


---- 1g
SELECT empID 
    from Employee 
        where salary = 
            (SELECT DISTINCT salary 
                from Employee 
                    ORDER BY salary desc 
                        LIMIT 1 OFFSET 1);


---- 2a
Select distinct empName, empID from Employee 
    where empName not in
        (SELECT distinct empName from Employee 
            natural join Assigned);



---- 2e
select projID, sum(salary) as projectSalary from Employee natural left outer join Assigned natural left outer join Project group by projID;



---- 3a
UPDATE Employee,
       (SELECT DISTINCT empID FROM 
        Employee natural join Assigned natural join Project
        where title = "compiler")
        AS compilerWorkers
SET Employee.salary = Employee.salary * 1.1
WHERE Employee.empID = compilerWorkers.empID;


---- 3b
UPDATE Employee,
       (SELECT DISTINCT empID, job, location    FROM 
        Employee natural join Department
        where job = "janitor" or location = "Waterloo")
        AS raiseWorkers
SET Employee.salary = Employee.salary * 
    (CASE
        WHEN location = "Waterloo" then 1.08
        WHEN location != "Waterloo" then 1.05
    end)
WHERE Employee.empID = raiseWorkers.empID;


---- 3c
Alter table Employee
ADD shift VARCHAR(5);


---- 3d
UPDATE Employee,
       (SELECT empID, projID FROM 
        Employee natural left outer join Assigned natural left outer join Project)
        AS shiftList
SET Employee.shift =  
    (CASE
        WHEN projID IS NULL then "N.A."
        WHEN Employee.empID MOD 2 = 0 then "DAY"
        ELSE "NIGHT"
        -- When MOD(empID,2) = 1 then "NIGHT"
    end)
WHERE Employee.empID = shiftList.empID;
