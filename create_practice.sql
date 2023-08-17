
CREATE TABLE employees (
  id int IDENTITY(1,1) PRIMARY KEY,
  name varchar(200) NOT NULL,
  dept int NOT NULL
) ;
INSERT INTO employees (name, dept) VALUES
  ('Daniel', 1),
  ('Jim', 1),
  ('Storm', 2),
  ('Pete', 3);

CREATE TABLE departments (
  id int NOT NULL PRIMARY KEY,
  name varchar(200)
) ;
INSERT INTO departments (id, name) VALUES
  (1, 'Admin'),
  (2, 'Sales'),
  (3, 'Ops'),
  (4, 'Legal');
  
  CREATE TABLE Persons (
    ID int NOT NULL PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

