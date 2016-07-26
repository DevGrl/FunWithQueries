--number of employees
--1) select count (*) from employee

--2) employees per department (departmentname, numberofemployees)
/*
select count (*) NumberOfEmployees, d.DepartmentName
from employee e
join department d on e.departmentid = d.departmentid
group by d.departmentname
*/

--3) number of employees per city (city, numberofemployees)
/*select count(*) numberOfEmployees, l.city
from employee e
join department d on e.departmentid = d.departmentid
join location l on d.locationid = l.locationid
group by l.city
*/

--4) number of employees per country (CountryName, NumberOfEmployees) What countries have no employees?
/*
select count(*) NumberOfEmployees, c.countryname CountryName
from employee e
join department d on e.departmentid = d.departmentid
join location l on d.locationid = l.locationid
join country c on l.countryid = c.countryid
group by c.countryname
*/

--5)number of employees per region (RegionName, NumberOfEmployees)
/*
select count(*) NumberOfEmployees, r.RegionName
from employee e
join department d on e.departmentid = d.departmentid
join location l on d.locationid = l.locationid
join country c on l.countryid = c.countryid
join region r on c.regionid = r.regionid
group by r.regionname
*/

--6) number of reports for each manager id (ManagerID, NumberOfReports
/*
select count(*) employeeCount, e.managerid
  from employee e
  group by e.managerid
*/

--7) Generate a list of managers with the department they belong to and the number
--of reports (DepartmentName, EmployeeID, FirstName, LastName, NumberOfReports
/*select d.DepartmentName, e1.EmployeeID, e1.FirstName, e1.LastName
  from employee e1
  join department d on e1.departmentid = d.departmentid
  where employeeid in (select managerid from employee)
  group by d.departmentname, e1.employeeid, e1.firstname, e1.lastname
  

select count(*) NumberOfReports, e2.managerid 
  from employee e2
  where e2.managerid in (select managerid from employee)
  group by e2.managerid
  
--inefficient solution but it works  
select t1.DepartmentName, t1.EmployeeID, t1.FirstName, t1.LastName, x.NumberOfReports
from (select d.DepartmentName, e1.EmployeeID, e1.FirstName, e1.LastName
   from employee e1
   join department d on e1.departmentid = d.departmentid
   where employeeid in (select managerid from employee)
   group by d.departmentname, e1.employeeid, e1.firstname, e1.lastname) t1
join (select count(*) NumberOfReports, e2.managerid 
   from employee e2
   where e2.managerid in (select managerid from employee)
   group by e2.managerid) x on x.managerid = t1.EmployeeID
   
--slightly improved
  SELECT x.DepartmentName, x.EmployeeID, x.FirstName, x.LastName, y.NumberOfReports
  FROM 
	(
	  SELECT d.DepartmentName, e.EmployeeID, e.FirstName, e.LastName
		  FROM employee e
		  JOIN department d ON e.departmentid = d.departmentid
		  WHERE employeeid in (SELECT managerid FROM employee)
	) x
  JOIN
	(
	  SELECT ManagerID , count(employeeid) NumberOfReports
		FROM employee
		GROUP BY managerid
	) y
  ON
	y.ManagerID = x.EmployeeID
	
  --DO THIS. More efficient
  select ManagerID , count(employeeid) NumberOfReports
  from employee
  group by managerid
  order by managerid
  --INSTEAD OF THIS. Less efficient
  select count(*) NumberOfReports, managerid 
  from employee
  where managerid in (select managerid from employee)
  group by managerid
  */

  /*
  --8 Same as #7 but only for managers that have 5 or more reports
  
  SELECT x.DepartmentName, x.EmployeeID, x.FirstName, x.LastName, y.NumberOfReports
  FROM 
	(
	  SELECT d.DepartmentName, e.EmployeeID, e.FirstName, e.LastName
		  FROM employee e
		  JOIN department d ON e.departmentid = d.departmentid
		  WHERE employeeid in (SELECT managerid FROM employee)
	) x
  JOIN
	(
	  SELECT ManagerID , count(employeeid) NumberOfReports
		FROM employee
		GROUP BY managerid
	) y
  ON
	y.ManagerID = x.EmployeeID
WHERE y.NumberOfReports > 5	
*/

/*
--9) Generate a list of all employees with their job titles and salaries
Select e.FirstName, e.LastName, j.JobTitle, e.Salary
from employee e
join job j on j.jobid = e.jobid
*/

/*
--11) What is the min, max, and average salary for each position ?
select j.JobTitle, j.MinSalary, j.MaxSalary, e.AvgSalary
 from job j
 join 
 (select jobid, avg(salary) AvgSalary from employee
 group by jobid) e
 on j.jobid = e.jobid
 */
