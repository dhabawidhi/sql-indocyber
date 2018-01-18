select empid, salary, city
	from HR.employees_sal
	where salary > ANY
	(
		select salary
		from hr.employees_sal
		where city ='london'
	)

select empid, salary, city
	from HR.employees_sal
	where salary = ANY
	(
		select salary
		from hr.employees_sal
		where city ='london'
	)