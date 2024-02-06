insert into departments (dep_name, dep_type, dep_harm_cond_perc) values 
	('Human Resources', 'Administrative', 1.17),
	('Finance', 'Administrative', 1.1),
	('Research and Development', 'Technical', 1.9),
	('Quality Assurance', 'Technical', 1.6),
	('Marketing', 'Sales and Marketing', 1.3),
	('Logistics', 'Operations', 1.25),
	('Product Management', 'Sales and Marketing', 1.43),
	('Engineering', 'Technical', 1.75),
	('Sales', 'Sales and Marketing', 1.35),
	('Training', 'Administrative', 1.5);

insert into staff_units (dep_id, job_title, max_number_of_vacancies, salary, allowance_irregular_work) values 
	(1, 'HR Manager', 2, 3200, 1.2),
	(2, 'Finance Manager', 3, 2900, 1.15),
	(2, 'Office Manager', 2, 2100, 1.05),
	(3, 'Development Engineer', 6, 4900, 1.7),
	(3, 'Research Scientist', 7, 5300, 1.85),
	(4, 'QA Manager', 4, 3400, 1.35),
	(5, 'Marketing Manager', 2, 2500, 1.17),
	(6, 'Logistics Coordinator', 2, 1750, 1.24),
	(7, 'Product Manager', 3, 2390, 1.28),
	(8, 'Software Engineer', 5, 3900, 1.8),
	(8, 'Hardware Engineer', 5, 3800, 1.7),
	(9, 'Sales Manager', 3, 3100, 1.42),
	(10, 'Training Specialist', 2, 2700, 1.55),
	(10, 'Training Coordinator', 2, 1500, 1.3);




INSERT INTO workers (last_name, first_name, report_card, diplomas, experience, date_of_start_work) VALUES
	('Williams', 'Irene', 92, 'Master in Conflict Management', 6, '2019-09-10'),
	('Williams', 'Sophia', 78, 'Bachelor in Economics', 2, '2022-02-01'),
	('Miller', 'Robert', 93, 'Master in Accounting', 6, '2019-09-10'),
	('Johnson', 'Emily', 71, 'Master in Information Technology', 2, '2022-02-01'),
	('Williams', 'David', 94, 'Bachelor in Software Engineering', 6, '2019-09-10'),
	('Smith', 'Victoria', 81, 'Master in Quality Management', 4, '2020-03-15'),
	('Davis', 'Emma', 88, 'Bachelor in Operations Management', 3, '2021-07-20'),
	('Smith', 'Matthew', 87, 'Master in Logistics and Supply Chain Management', 4, '2020-03-15'),
	('Smith', 'Michael', 25, 'Master in Product Management', 4, '2020-03-15'),
	('Williams', 'Daniel', 12, 'Master in Electrical Engineering', 6, '2019-09-10'),
	('Davis', 'Matthew', 38, 'Bachelor in Information Technology', 3, '2021-07-20'),
	('Smith', 'Emily', 65, 'Master in Marketing and Sales Management', 4, '2020-03-15'),
	('Smith', 'Natalie', 75, 'Master in Education and Training Management', 4, '2020-03-15');

insert into staff_workers (staff_id, worker_id) values
	(1,1),
	(2,3),
	(3,2),
	(4,4),
	(5,5),
	(6,6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10),
	(11, 11),
	(12, 12),
	(14, 13),
	(13, 13);
