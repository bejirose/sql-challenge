DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS departments cascade;
DROP TABLE IF EXISTS salaries cascade;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
  emp_no integer PRIMARY KEY NOT NULL,
  emp_title_id varchar(5) not null,
  birth_date date,
  first_name varchar(30) not null,
  last_name varchar(30) not null,
  sex varchar(1) not null,
  hire_date date
);

CREATE TABLE departments (
  dept_no varchar(4) PRIMARY KEY NOT NULL,
  dept_name varchar(30) NOT NULL
);

CREATE TABLE dept_emp (
  emp_no integer NOT NULL,
  dept_no varchar(4) not null,
  primary key(emp_no, dept_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager (
  dept_no varchar(4) not null,
  emp_no integer PRIMARY KEY NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles (
  title_id varchar(5) primary key not null,
  title varchar(30) NOT NULL
);

CREATE TABLE salaries (
  emp_no integer PRIMARY KEY NOT NULL,
  salary int not null,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


