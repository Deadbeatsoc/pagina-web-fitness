select first_name, saludo_employee(first_name) from employees;

select * from employees;

select * from jobs;


select employees.first_name, employees.last_name,max(jobs.max_salary) as maxi,min(jobs.min_salary) as mini,max(jobs.max_salary) - min(jobs.min_salary) 
	from employees
	join jobs on employees.job_id = jobs.job_id
		group by employees.first_name,employees.last_name
		where employees.employee_id = 101; 





create or replace function saludo_employee (first_name_employee varchar) 
returns varchar
as $$ 
begin 
	return 'hola ' || first_name_employee;



end;
$$
language plpgsql;



create or replace function max_aumento2 (emp_id INT)
returns numeric(8,2)
as $$ 
declare 
	salario_empl numeric(8,2);
	salario_max numeric(8,2);
	posible_aumento numeric(8,2);
	trabajo_id int;
begin 
--almacenar el salario maximo del empleado

select job_id,salary into trabajo_id,salario_empl from employee
	where employee_id = emp_id


--almacenar el salario maximo del trabajo
select max_salary into salario_max from jobs
	where job_id = trabajo_id;



--realizar calculo


 posible_aumento = salario_max - salario_empl;


end;
$$
language plpgsql;



