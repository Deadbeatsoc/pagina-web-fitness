
create or replace function max_aumento3(emp_id INT)
returns numeric(8,2)
as $$ 
declare 
	select_employee employees%rowtype;
	select_job jobs%rowtype;
	posible_aumento numeric(8,2);
begin 
--almacenar el salario maximo del empleado

select * from employees into select_employee
	where employee_id = emp_id;


--almacenar el salario maximo del trabajo
select * into select_job from jobs
	where job_id = select_employee.job_id;



--realizar calculo


 posible_aumento = select_job.max_salary - select_employee.salary;

  if (posible_aumento < 0) then 
  raise exception 'empleado con salario mayor a max_salary: name:% , id:% ',select_employee.first_name,select_employee.employee_id;
  end if;

return posible_aumento;

end;
$$
language plpgsql;



select first_name, max_aumento3(employee_id) from employees;

