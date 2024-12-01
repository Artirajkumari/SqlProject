# Q1
create  database Employee;
use Employee;
show tables;
select * from emp_record_table;
select * from proj_table;
select * from data_science_team;
/* Q2 write a query to fetch EMO_ID,FIRST_NAME,LAST_NAME, GENDERAND DEPARTMENT FROM THE EMPLOYEES RECORD
TABLE ,and make a list of employees and details of their department.*/
select EMP_ID,FIRST_NAME,LAST_NAME, GENDER ,DEPT
from emp_record_table;

/* Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, 
and EMP_RATING if the EMP_RATING is:  
• less than two 
• greater than four  
• between two and four*/
show databases;
use employee;
select * from emp_record_table;
select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
from emp_record_table where  EMP_RATING< 2;

select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
from  emp_record_table where  EMP_RATING>2;
select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
from  emp_record_table where  EMP_RATING  between 2 and 4 ;
/* Q3  Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees in the 
Finance department from the employee table and then give the resultant column alias as 
NAME. */

select concat( FIRST_NAME," ",LAST_NAME) as E_Name,dept from  emp_record_table
where DEPT = "Finance";

/*Q5. Write a query to list down all the employees from the healthcare and finance departments 
using union. Take data from the employee record table. */
select * from emp_record_table
where DEPT= "finance" union
 select * from emp_record_table
where DEPT="healthcare";
/* Q7. Write a query to list down employee details such as EMP_ID, FIRST_NAME, LAST_NAME, 
ROLE, DEPARTMENT, and EMP_RATING grouped by dept. Also include the respective 
employee rating along with the max emp rating for the department.
*/
select e.EMP_ID, e.FIRST_NAME, e.LAST_NAME, e.ROLE,  e.EMP_RATING,e.DEPT,
 max(e.EMP_RATING)over(partition by e.DEPT) as max_dept_rating
from emp_record_table as e
order by e.DEPT,e.EMP_RATING desc;
/*Write a query to calculate the minimum and the maximum salary of the employees in each 
role. Take data from the employee record table. 
 */select  EMP_ID,FIRST_NAME,LAST_NAME,EXP FROM EMP_RECORD_table
WHERE EMP_ID IN (SELECT manager_id from emp_record_table);
DELIMITER &&
CREATE PROCEDURE  get_experience_details()
Begin
Select EMP_ID,FIRST_NAME,LAST_NAME,EXP 
FROM EMP_RECORD_TABLE
WHERE EXP>3;
END&&
CALL GET_EXPERIENCE_DETAILS;



 
 /*Q8Write a query to assign ranks to each employee based on their experience. Take data from 
the employee record table.
 */
 select  EMP_ID, FIRST_NAME, LAST_NAME,EXP,
 rank() over (order by exp desc) as rank_by_experience
 from emp_record_table;
 
 

/*Q9. Write a query to create a view that displays employees in various countries whose salary is 
more than six thousand. Take data from the employee record table. */
create view high_salary_employees as
select EMP_ID, FIRST_NAME, LAST_NAME,SALARY,COUNTRY
from emp_record_table
where salary>6000;
select * from  high_salary_employees
order by country,salary desc;

/*Q10. Write a nested query to find employees with experience of more than ten years. Take data 
from the employee record table. */
use employee;
select * from employee_record_table
where EXP>10;

/*11. Write a query to create a stored procedure to retrieve the details of the employees whose 
experience is more than three years. Take data from the employee record table. */
call getnew_procedureEXP();

/*Q12. Write a query to calculate the bonus for all the employees, based on their ratings and 
salaries (Use the formula: 5% of salary * employee rating). */
select EMP_ID,FIRST_NAME,LAST_NAME,SALARY,EMP_RATING,
(SALARY *0.05* EMP_RATING) AS BONOUS
FROM EMP_RECORD_TABLE;
/*Q13. Write a query to calculate the average salary distribution based on the continent and country. 
Take data from the employee record table. */
SELECT CONTINENT,COUNTRY,AVG(SALARY) AS AVERAGE_SALARY
FROM emp_record_table
group by
continent,country
order by
continent,country;




