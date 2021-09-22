Drop Table retirement_info;
Select emp_no, first_name, last_name Into retirement_info From employees Where (birth_date between '1952-01-01' and '1955-12-31') AND (hire_date between '1985-01-01' and '1988-12-31');
Select * from retirement_info;

Select departments.dept_name,
	dept_manager.emp_no,
	dept_manager.from_date,
	dept_manager.to_date
From departments
Inner Join dept_manager
On departments.dept_no = dept_manager.dept_no;

Select ret.emp_no,
	ret.first_name,
	ret.last_name,
	de.to_date
Into current_emp
From retirement_info as ret
Left Join dept_employee as de
On ret.emp_no = de.emp_no
Where de.to_date = ('9999-01-01');

Select Count(emp_no)
From retirement_info;

Select Count(ce.emp_no), de.dept_no
Into dept_retire
From current_emp as ce
Left Join dept_employee as de
On ce.emp_no = de.emp_no
Group By de.dept_no
Order By de.dept_no asc;