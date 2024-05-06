-- Consultas SQL

SELECT * FROM employee;
SELECT Ssn, COUNT(Essn) FROM employee e JOIN dependent d ON e.Ssn = d.Essn;
SELECT * FROM dependent;

SELECT Bdate, Address FROM employee
WHERE Fname = 'John' AND Minit = 'B' AND Lname = 'Smith';

SELECT * FROM department WHERE Dname = 'Research';

SELECT Fname, Lname, Address
FROM employee JOIN department ON department.Dnumber = employee.Dno
WHERE department.Dname = 'Research';

SELECT * FROM project;

-- Expressões e concatenação de strings

-- recuperando informações dos departamentos presentes em Stafford
SELECT Dname AS Department, Mgrssn AS Manager FROM department d JOIN dept_locations l ON d.Dnumber = l.Dnumber;

-- padrão SQL -> || no MySQL usa a função concat()
SELECT Dname AS Department, Fname || ' ' || Lname FROM department d JOIN dept_locations l ON d.Dnumber = l.Dnumber
JOIN employee e ON d.Mgrssn = e.Ssn;

-- recuperando info dos projetos em Stafford
SELECT * FROM project JOIN department ON project.Dnum = department.Dnumber WHERE Plocation = 'Stafford';

-- recuperando info sobre os departamentos e projetos localizados em Stafford
SELECT Pnumber, Dnum, Dname, Address, Bdate
FROM project JOIN department ON project.Dnum = department.Dnumber
JOIN employee ON department.Mgrssn = employee.Ssn
WHERE Plocation = 'Stafford';

SELECT * FROM employee WHERE Dno IN (3,6,9);

-- Operadores lógicos

SELECT Bdate, Address
FROM employee
WHERE Fname = 'John' AND Minit = 'B' AND Lname = 'Smith';

SELECT Fname, Lname, Address
FROM employee JOIN department ON employee.Dno = department.Dnumber
WHERE department.Dname = 'Research';

-- Expressões e alias

-- recolhendo o valor do INSS-*
SELECT Fname, Lname, Salary, Salary * 0.011 FROM employee;
SELECT Fname, Lname, Salary, Salary * 0.011 AS INSS FROM employee;
SELECT Fname, Lname, Salary, ROUND(Salary * 0.011, 2) AS INSS FROM employee;

-- definir um aumento de salário para os gerentes que trabalham no projeto associado ao ProdutoX
SELECT e.Fname, e.Lname, 1.1 * e.Salary AS increased_sal FROM employee AS e
JOIN works_on AS w ON e.Ssn = w.Essn
JOIN project AS p ON w.Pno = p.Pnumber
WHERE p.Pname = 'ProductX';

-- concatenando e fornecendo alias
SELECT Dname AS Department, e.Fname || ' ' || e.Lname AS Manager FROM department d
JOIN dept_locations l ON d.Dnumber = l.Dnumber
JOIN employee e ON d.Mgrssn = e.Ssn;

-- recuperando dados dos empregados que trabalham para o departamento de pesquisa
SELECT Fname, Lname, Address FROM employee
JOIN department ON department.Dnumber = employee.Dno
WHERE department.Dname = 'Research';

-- definindo alias para legibilidade da consulta
SELECT e.Fname, e.Lname, e.Address FROM employee e
JOIN department d ON d.Dnumber = e.Dno
WHERE d.Dname = 'Research';
