-- list of technical departments
CREATE VIEW technical_departments AS
	SELECT dep_name, dep_type 
	FROM departments d 
	WHERE dep_type LIKE 'Technical'

-- all vacancies of the company
CREATE VIEW all_quantity_vacancies AS
	SELECT job_title, max_number_of_vacancies
	FROM staff_units su 
	
-- free vacancies in company		
CREATE VIEW free_quantity_vacancies AS
	SELECT d.dep_name, su.job_title, 
	max_number_of_vacancies-count(sw.worker_id) AS free_vacancies  
	FROM staff_workers sw 
	JOIN staff_units su ON sw.staff_id = su.staff_id
	JOIN departments d ON su.dep_id = d.dep_id 
	GROUP BY su.staff_id, d.dep_id  
	ORDER BY d.dep_name, su.job_title
	
-- salary with all allowances	
CREATE VIEW full_salary_of_vacancie AS
	SELECT su.job_title, (su.salary*su.allowance_irregular_work*d.dep_harm_cond_perc) AS full_salary
	FROM staff_units su
	JOIN departments d ON su.dep_id = d.dep_id
	ORDER BY su.job_title 
	
-- staff for salary allowance for extensive work experience with diplomas
CREATE VIEW extensive_work_experience AS
	SELECT (last_name||' '|| first_name) AS names, experience, diplomas
	FROM workers w
	WHERE experience > 5 AND diplomas IS NOT NULL 
