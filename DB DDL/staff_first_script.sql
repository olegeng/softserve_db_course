CREATE TABLE departments (
	dep_id serial,
	dep_name varchar(100) NOT NULL UNIQUE,
	dep_type varchar(32) NOT NULL,
	dep_harm_cond_perc decimal(3,2) NOT NULL,
	CONSTRAINT departments_pk PRIMARY KEY (dep_id)
);

CREATE TABLE staff_units (
	staff_id serial,
	dep_id integer NOT NULL,
	job_title varchar NOT NULL UNIQUE,
	max_number_of_vacancies integer NOT NULL,
	salary decimal(3,2) NOT NULL,
	allowance_irregular_work decimal(3,2) NOT NULL,
	CONSTRAINT staff_units_pk PRIMARY KEY (staff_id)
);


CREATE TABLE workers (
	worker_id serial,
	last_name varchar NOT NULL,
	first_name varchar NOT NULL,
	report_card integer NOT NULL,
	diplomas varchar NOT NULL,
	experience integer,
	date_of_start_work DATE NOT NULL,
	CONSTRAINT workers_pk PRIMARY KEY (worker_id)
);


CREATE TABLE staff_workers (
	staff_id integer,
	worker_id integer NOT NULL,
	CONSTRAINT staff_workers_pk PRIMARY KEY (staff_id,worker_id)
);


ALTER TABLE staff_units ADD CONSTRAINT staff_units_fk0 FOREIGN KEY (dep_id) REFERENCES departments(dep_id);


ALTER TABLE staff_workers ADD CONSTRAINT staff_workers_fk0 FOREIGN KEY (staff_id) REFERENCES staff_units(staff_id);
ALTER TABLE staff_workers ADD CONSTRAINT staff_workers_fk1 FOREIGN KEY (worker_id) REFERENCES workers(worker_id);