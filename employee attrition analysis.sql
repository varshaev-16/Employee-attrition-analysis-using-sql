create database employee;
use employee;
alter table employee_attrition rename column ï»¿Age to Age;

select * from employee_attrition;
SELECT COUNT(*) FROM employee_attrition;


-- -- 
select distinct Attrition from employee_attrition;
select distinct Department from employee_attrition;
select distinct EducationField from employee_attrition;
select distinct JobRole from employee_attrition;
select distinct MaritalStatus from employee_attrition;
select distinct EmployeeCount from employee_attrition;
select distinct count(EmployeeNumber) from employee_attrition;

-- -- 

 
--  What is the average age of employees who have left the company, and how does it differ for each department  

SELECT Department, AVG(Age) 
FROM employee_attrition
WHERE Attrition = 'Yes'
GROUP BY Department;


--  the average monthly income for employees with a Marketing educational background who have worked for more than 5 years at the company

SELECT AVG(CASE
             WHEN YearsAtCompany > 5 AND EducationField = 'Marketing' THEN MonthlyIncome
             ELSE NULL  
           END) AS AvgMonthlyIncome
FROM employee_attrition;

--  Identify the employees who have received the highest performance rating and are still with the company

CREATE VIEW HighPerformingEmployees AS
SELECT *
FROM employee_attrition
WHERE PerformanceRating = (SELECT MAX(PerformanceRating) FROM employee_attrition)
AND Attrition = 'No';
select * from highperformingemployees;

--  What is the average monthly income for employees whose job role includes the term 'Manager

SELECT AVG(MonthlyIncome)  AS AvgMonthlyIncome
FROM employee_attrition
WHERE JobRole LIKE '%Manager%';


--  Find the employees who have worked in multiple companies before joining the current one and have left the company.

SELECT count(*)
FROM employee_attrition
WHERE NumCompaniesWorked > 1 AND Attrition = 'Yes';
  
--  Which job roles experience the highest attrition, and how many employees from each role have left the company

SELECT JobRole, COUNT(EmployeeNumber) AS AttritionCount
FROM employee_attrition
WHERE Attrition = 'Yes'
GROUP BY JobRole
ORDER BY AttritionCount DESC;

--  How does marital status correlate with employee attrition, and what is the attrition count for each marital status category 
         
SELECT MaritalStatus, COUNT(EmployeeNumber) AS AttritionCount
FROM employee_attrition
WHERE Attrition = 'Yes'
GROUP BY MaritalStatus;

--  How does total working years influence employee attrition, and what is the attrition count for different 
-- ranges of total working years

SELECT TotalWorkingYears, COUNT(EmployeeNumber) AS AttritionCount
FROM employee_attrition
WHERE Attrition = 'Yes'
GROUP BY TotalWorkingYears
ORDER BY TotalWorkingYears;

--  Does working overtime have an impact on employee attrition, and how many employees who left the company had
--  overtime commitments

SELECT OverTime, COUNT(EmployeeNumber) AS AttritionCount
FROM employee_attrition
WHERE Attrition = 'Yes'
GROUP BY OverTime;


--  SQL query to find details of employee under attrition having 5+ years of experience and between the age group of 27 - 55 --
SELECT * FROM employee_attrition
WHERE YearsAtCompany > 5 
AND Age BETWEEN 27 AND 55 ;

--   Fetch the details of employees having maximum and minimum salary working in different departments 
--  who received less than 13% salary hike 

SELECT department,MIN(MonthlyIncome),MAX(MonthlyIncome)
FROM employee_attrition 
WHERE PercentSalaryHike < 13
GROUP BY department;

--   Calculate the average monthly income of all the employees who worked more than 3 years whose educational 
-- background  is medical

SELECT avg(MonthlyIncome)
FROM employee_attrition
WHERE YearsAtCompany >3 AND 
EducationField = 'Medical';
select * from employee_attrition;

--   identify the total number of male and female employee under attrition whose marital status is married and  haven't
--  received promotion in the last 2 years where attrition is 'yes'--

SELECT Gender,COUNT(EmployeeNumber)
FROM employee_attrition
WHERE MaritalStatus = 'Married'
AND YearsSinceLastPromotion = '2'
and Attrition = 'yes'
GROUP BY Gender;

--  Employee working overtime but given a minimum salary hike and are more than 5 years within the company--

select *
from employee_attrition
where OverTime = 'yes'
and PercentSalaryHike = ( select (min(PercentSalaryHike)) from employee_attrition)
and YearsAtCompany > 5
and Attrition = 'yes';


--  What is the distribution of attrition based on education field, and how many employees have left from each field
SELECT EducationField, COUNT(*) AS AttritionCount
FROM employee_attrition
WHERE Attrition = 'Yes'
GROUP BY EducationField;

-- . Calculate the average years since the last promotion for employees who have left the company, grouped by education level.

SELECT Education, AVG(YearsSinceLastPromotion) AS AvgYearsSinceLastPromotion
FROM employee_attrition
WHERE Attrition = 'Yes'
GROUP BY Education;

-- . Find the average distance from home for employees who have left the company due to attrition, categorized by business travel frequency.

SELECT BusinessTravel, AVG(DistanceFromHome) AS AvgDistanceFromHome
FROM employee_attrition
WHERE Attrition = 'Yes'
GROUP BY BusinessTravel;

-- . Top 5 Employees with the Most Years at the Company

SELECT EmployeeNumber, YearsAtCompany
FROM employee_attrition
ORDER BY YearsAtCompany DESC
LIMIT 5;

-- 6. Is there a correlation between the distance employees live from the workplace and attrition, 
-- and what is the attrition count for different distance ranges

SELECT DistanceFromHome, COUNT(EmployeeNumber) AS AttritionCount
FROM employee_attrition
WHERE Attrition = 'Yes'
GROUP BY DistanceFromHome
ORDER BY DistanceFromHome desc;

--  list of employees who have not worked overtime, received the maximum percentage salary hike,
--  and have been with the company for less than 5 years

select *
from employee_attrition
where OverTime = 'no'
and PercentSalaryHike = ( select (max(PercentSalaryHike)) from employee_attrition)
and YearsAtCompany < 5;


  

  


