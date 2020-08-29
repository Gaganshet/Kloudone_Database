
//Publisher running on port:7001

CREATE DATABASE employee;

CREATE TABLE employees(Id INT,Name VARCHAR(100),Salary INT);    //To create  table

CREATE ROLE repuser REPLICATION LOGIN PASSWORD 'password';      // To create user

CREATE PUBLICATION my_pub FOR TABLE employees;                 //To create a publisher

GRANT SELECT ON employees TO repuser; // To grant the priviliges 

INSERT INTO employee VALUES(1,'Ram',100000);

INSERT INTO employee VALUES(2,'sham',100000);

INSERT INTO employee VALUES(3,'arjun',100000);

INSERT INTO employee VALUES(4,'Shanker',100000);

INSERT INTO employee VALUES(5,'Shatish',100000);

INSERT INTO employee VALUES(6,'Sharen',100000);

INSERT INTO employee VALUES(7,'Suma',100000);

INSERT INTO employee VALUES(8,'vishal',100000);
INSERT INTO employee VALUES(9,'vignesh',100000);


SELECT * FROM employee;

//Subscriber running on port:7001

CREATE DATABASE employee;

CREATE TABLE employees(Id INT,Name VARCHAR(100),Salary INT); //To create the table

CREATE SUBSCRIPTION my_sub CONNECTION 'host=localhost port=7001 password=password user=repuser 
dbname=employee' PUBLICATION my_pub; // To subscribe to the publisher node

SELECT * FROM employees;

 


