SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date INTO retiring_emp_by_title
FROM employees AS e
INNER JOIN titles AS ti ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title INTO unique_titles
FROM retiring_emp_by_title
ORDER BY emp_no,
	TO_DATE DESC;


SELECT count(emp_no) AS ct,
	title INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY ct DESC;


SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_employee AS de ON e.emp_no = de.emp_no
INNER JOIN titles AS ti ON e.emp_no = ti.emp_no
WHERE (de.to_date = '9999-01-01')
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no