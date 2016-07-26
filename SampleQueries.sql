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
