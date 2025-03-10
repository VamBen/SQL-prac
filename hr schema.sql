use hr;
-- 1. retrieve all data from employees
select * from employees;
-- 2. Display the first name, last name, and email of all employees
select first_name, last_name, email from employees;
-- 3. Retrieve the distinct job titles from the jobs table. 
select distinct job_title  from jobs;
-- 4. Find the total number of employees in the company.
select count(*) from employees;
-- 5. Retrieve the employees who were hired after January 1, 2015. 
select * from employees where hire_date > '2015-01-01';
-- 6. List all employees who have a salary greater than 5000. 
select * from employees where salary > 5000;
-- 7. Retrieve employees with job titles containing the word ‘Manager.’
select employee_id, first_name, last_name, job_id, email from employees  
where job_id like '%MGR%';
-- 8. Retrieve all employees whose first name starts with ‘A’ and ends with ‘n.’
select employee_id, first_name, last_name from employees where first_name like 'A%n';
-- 9. Display the employees who do not have a commission. 
select * from employees;
select employee_id first_name, last_name, commission_pct from employees  
where commission_pct is null;
-- 10. Retrieve the top 5 highest-paid employees. 
select employee_id first_name, last_name, salary from employees  
order by salary desc limit 5;
-- 11. Find the average salary of all employees. 
select avg(salary) as average_salary from employees;
-- 12. Retrieve the total number of employees working in each department. 
select department_id, count(*) as total_emps from employees group by department_id;
-- 13. Display the employee's first name and the length of their first name. 
select first_name, length(first_name) as len from employees;
-- 14. Convert the hire_date of employees to display only the year. 
select first_name, last_name, year(hire_date) as yearr from employees;
-- 15. Retrieve the minimum and maximum salary for each job title. 
select job_id, min(salary) as min_salary, max(salary) as max_salary  
from employees group by job_id;
          -- or --
select * from jobs;    
-- 16. Retrieve the employee names along with their department names. 
select e.first_name, e.last_name, d.department_name from employees e  
join departments d on e.department_id = d.department_id;
-- 17. List the employees along with their job titles and the location of their department. 
select e.first_name, e.last_name, j.job_title, l.city, l.state_province, l.country_id  
from employees e join jobs j on e.job_id = j.job_id  
join departments d on e.department_id = d.department_id  
join locations l on d.location_id = l.location_id;
-- 18. Retrieve the department names along with the count of employees in each department. 
select d.department_name, count(e.employee_id) as employee_count  
from departments d left join employees e on d.department_id = e.department_id  
group by d.department_name;  -- left join ensures even 0 count departments get included!

-- 19. Find employees who have the same job as their manager. 
select e.employee_id, e.first_name, e.last_name, e.job_id, m.employee_id as manager_id,
 m.first_name as manager_name from employees e join employees m 
on e.manager_id = m.employee_id where e.job_id = m.job_id;

-- 20. Display the names of employees who worked in different jobs in the past (use job_history). 
select distinct e.first_name, e.last_name from employees e join job_history j 
on e.employee_id = j.employee_id where e.job_id <> j.job_id;



      










