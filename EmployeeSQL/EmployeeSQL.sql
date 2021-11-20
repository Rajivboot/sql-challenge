create table department
(dept_no varchar primary key, dept_name varchar)

create table titles
(title_id varchar primary key, title varchar)

create table employees
(emp_no varchar primary key, 
emp_title_id varchar,
birth_date date,
first_name varchar,
last_name varchar,
sex varchar,
hire_date date,
foreign key (emp_title_id) references titles (title_id))

create table dep_emp
(emp_no varchar, 
dept_no varchar, 
Primary key(emp_no, dept_no),
foreign key (emp_no) references employees (emp_no),
foreign key (dept_no) references department (dept_no))

create table dep_manager
(dept_no varchar, 
emp_no varchar, 
foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references department (dept_no), Primary key(emp_no, dept_no))

create table Salaries
(emp_no varchar, 
salary int, 
foreign key (emp_no) references employees (emp_no))


---details of each employee: employee number, last name, first name, sex, and salary---
select employees.emp_no, last_name, first_name , sex, salary
from employees left join salaries on employees.emp_no = salaries.emp_no

---List first name, last name, and hire date for employees who were hired in 1986--
select first_name, last_name, hire_date
from employees 
where hire_date between '1/1/1986' and '12/31/1986'
order by hire_date 

--list the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.-
select dep_manager.dept_no as "Department number", 
      department.dept_name as "Department name", 
	  dep_manager.emp_no as "Employee number",
	  employees.last_name as "Last Name" , 
	  employees.first_name as "First Name"
from dep_manager left join department on dep_manager.dept_no = department.dept_no 
                 left join employees on dep_manager.emp_no = employees.emp_no

--list the department of each employee with the following information: employee number, last name, first name, and department name--
select employees.emp_no as "Employee Number",
       employees.last_name as "Last Name", 
	   employees.first_name as "First Name",
	   department.dept_name as "Department Name"
from employees left join dep_emp on employees.emp_no = dep_emp.emp_no
               left join department on dep_emp.dept_no = department.dept_no
			   
--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B
Select first_name, last_name, sex
from employees 
where first_name = 'Hercules' and last_name like 'B%'
order by last_name
	   
--List all employees in the Sales department, including their employee number, last name, first name, and department name.	   
select employees.emp_no as "Employee Number",
       last_name as "Last Name", 
	   first_name as "First Name",
	   dept_name as "Department Name"
from employees left join dep_emp on employees.emp_no = dep_emp.emp_no
               left join department on dep_emp.dept_no = department.dept_no
where dept_name = 'Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no as "Employee Number",
       last_name as "Last Name", 
	   first_name as "First Name",
	   dept_name as "Department Name"
from employees left join dep_emp on employees.emp_no = dep_emp.emp_no
               left join department on dep_emp.dept_no = department.dept_no
where dept_name = 'Sales' or dept_name = 'Development'


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no as "Employee Number",
       last_name as "Last Name", 
	   first_name as "First Name",
	   dept_name as "Department Name"
from employees left join dep_emp on employees.emp_no = dep_emp.emp_no
               left join department on dep_emp.dept_no = department.dept_no
where dept_name in ('Sales','Development')
	   
--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name as "Last Name", 
	   Count(last_name) as "Frequency"
from employees 
group by last_name
order by "Frequency" DESC
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	   
	 





