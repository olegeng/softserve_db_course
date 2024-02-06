create function full_salary(
	salary numeric(10,2),
	allowance_iw numeric(3,2),
	dep_harm_allowance numeric(3, 2))	
returns numeric(10,2)
as $$
begin
	return @salary * @allowance_iw * @dep_harm_allowance;
end; $$
LANGUAGE plpgsql;

create function free_vacancies()	
returns table(
	id int,
	job_title varchar(120),
	salary numeric(10,2))
as $$
begin
	RETURN QUERY SELECT
		idk, 
		su.job_title, 
		su.salary
		from (select staff_id as idk, count(worker_id) as number
					from staff_workers
					group by staff_id) as u
			join staff_units su
				on u.idk =su.staff_id
		where su.max_number_of_vacancies>u.number;		
end; $$
LANGUAGE plpgsql;


create function hired_after(
	date_to_find date)
returns table(
	worker int,
	l_name varchar(64),
	f_name varchar(64),
	start_date date)
as $$
begin
		return query select
			worker_id,
			last_name,
			first_name,
			date_of_start_work
			from workers
			where date_of_start_work > date_to_find;
end; $$
language plpgsql 


create or replace procedure add_staff(
	staff_id int,
	dep_id int,
	job_title varchar(120),
	max_number_of_vacancies int,
	salary numeric(10,2),
	allowance_irregular_work numeric(3,2))
language plpgsql
as $$
begin 
	insert into staff_units values
	(staff_id, dep_id, job_title, max_number_of_vacancies, salary, allowance_irregular_work);
end; $$

create or replace procedure add_worker(
	worker_id int,
	last_name varchar(64),
	first_name varchar(64),
	report_card int,
	diplomas varchar(100),
	experience int,
	date_of_start_work date)
language plpgsql
as $$
begin 
	insert into workers values
	(worker_id, last_name, first_name, report_card, diplomas, experience, date_of_start_work);
end; $$

call add_worker(14, 'Pavlish', 'Oleg', 3, 'test', 4, '2019-01-20') 

CREATE OR REPLACE PROCEDURE get_department_allowance_by_name(inout dep_n VARCHAR(100), inout allowance numeric(3,2) default null)
AS $$
BEGIN
    SELECT d.dep_name, d.dep_harm_cond_perc into dep_n, allowance
    FROM departments d
    WHERE d.dep_name = dep_n;
END;
$$ LANGUAGE plpgsql;
call get_department_allowance_by_name('Sales')


CREATE OR REPLACE PROCEDURE get_most_paid_staff(inout job_t varchar(120) default null, inout salary_of_staff numeric(10,2) default null)
AS $$
BEGIN
    SELECT job_title, salary into job_t, salary_of_staff
    FROM staff_units
    order by salary desc;
END;
$$ LANGUAGE plpgsql;
call get_most_paid_staff()