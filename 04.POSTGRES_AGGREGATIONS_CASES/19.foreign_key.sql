CREATE TABLE employees_projects (
	id INT PRIMARY KEY,
	employee_id INT,
	project_id INT,
	
	FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE,
	FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
);