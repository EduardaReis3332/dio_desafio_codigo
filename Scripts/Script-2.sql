-- Verificação dos cabeçalhos e tipos de dados
PRAGMA table_info(employee);
PRAGMA table_info(dependent);
PRAGMA table_info(department);
PRAGMA table_info(dept_locations);
PRAGMA table_info(project);

-- Modificação dos valores monetários para o tipo double preciso
ALTER TABLE employee MODIFY COLUMN salary REAL;

-- Verificação e tratamento de valores nulos
SELECT * FROM employee WHERE superssn IS NULL;
UPDATE employee SET superssn = 0 WHERE superssn IS NULL;

-- Identificação e tratamento de funcionários e departamentos sem gerentes
SELECT * FROM employee WHERE superssn IS NULL;
SELECT * FROM department WHERE mgrssn IS NULL;
UPDATE employee SET superssn = ssn WHERE superssn IS NULL;
UPDATE department SET mgrssn = 888665555 WHERE mgrssn IS NULL;
