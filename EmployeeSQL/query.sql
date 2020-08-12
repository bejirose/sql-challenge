--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no, last_name, first_name, sex, salary from employees e
left join salaries s on e.emp_no = s.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, to_char(hire_date, 'mm/dd/yyyy'), hire_date from employees e
where hire_date::date  between '1986-01-01' and '1986-12-31'; 
--where EXTRACT (YEAR FROM hire_date) = 1986;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select dm.dept_no, dept.dept_name, dm.emp_no, emp.last_name, emp.first_name
from dept_manager dm
left join departments dept on dm.dept_no = dept.dept_no
left join employees emp on emp.emp_no = dm.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employees emp
left join dept_emp de on emp.emp_no = de.emp_no
left join departments dept on de.dept_no = dept.dept_no;  -- emp: 10219 has mulitple records in dept_emp

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employees emp
left join dept_emp de on emp.emp_no = de.emp_no
left join departments dept on de.dept_no = dept.dept_no
where dept.dept_name='Sales';  -- emp_no such as 10219 have mulitple records in dept_emp

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
from employees emp
left join dept_emp de on emp.emp_no = de.emp_no
left join departments dept on de.dept_no = dept.dept_no
where dept.dept_name in ('Sales', 'Development');

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(*) frequency_count
from employees
group by last_name
order by frequency_count desc;