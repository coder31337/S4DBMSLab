-- This script creates the schema of the six tables
-- EMPLOYEE, DEPARTMENT, DEPT_LOCATIONS, PROJECT, WORKS_ON and DEPENDENT
-- and inserts the values.


-- Delete any existing tables

-- For Oracle
-- DROP TABLE IF EXISTS [table] CASCADE CONSTRAINTS;

-- For MySQL
-- SET FOREIGN_KEY_CHECKS = 0;
-- DROP TABLE IF EXISTS EMPLOYEE, DEPARTMENT, DEPT_LOCATIONS, PROJECT, WORKS_ON, DEPENDENT;
-- SET FOREIGN_KEY_CHECKS = 1;



CREATE TABLE EMPLOYEE
(
    Fname VARCHAR(7) NOT NULL,
    Minit CHAR,
    Lname VARCHAR(15) NOT NULL,
    Ssn CHAR(9) PRIMARY KEY,
    Bdate DATE,
    Address VARCHAR(30),
    Sex CHAR,
    Salary DECIMAL(10, 2),
    Super_ssn CHAR(9),
    Dno INT NOT NULL
);

CREATE TABLE DEPARTMENT
(
    Dname VARCHAR(15) NOT NULL,
    Dnumber INT PRIMARY KEY,
    Mgr_ssn CHAR(9) NOT NULL,
    Mgr_start_date DATE,
    FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn)
);

CREATE TABLE DEPT_LOCATIONS
(
    Dnumber INT NOT NULL,
    Dlocation VARCHAR(15) NOT NULL,
    PRIMARY KEY (Dnumber, Dlocation),
    FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber)
);

CREATE TABLE PROJECT
(
    Pname VARCHAR(15) NOT NULL UNIQUE,
    Pnumber INT NOT NULL PRIMARY KEY,
    Plocation VARCHAR(15),
    Dnum INT NOT NULL,
    FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber)
);

CREATE TABLE WORKS_ON
(
    Essn CHAR(9) NOT NULL,
    Pno INT NOT NULL,
    Hours DECIMAL(3, 1) NOT NULL,
    PRIMARY KEY (Essn, Pno),
    FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn),
    FOREIGN KEY (Pno) REFERENCES PROJECT(Pnumber)
);

CREATE TABLE DEPENDENT
(
    Essn CHAR(9) NOT NULL,
    Dependent_name VARCHAR(15) NOT NULL,
    Sex CHAR,
    Bdate DATE NOT NULL,
    Relationship VARCHAR(8),
    PRIMARY KEY (Essn, Dependent_name),
    FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn)
);



INSERT INTO EMPLOYEE VALUES ('John',     'B', 'Smith',   '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, '333445555', 5);
INSERT INTO EMPLOYEE VALUES ('Franklin', 'T', 'Wong',    '333445555', '1955-12-08', '628 Voss, Houston, TX',    'M', 40000, '888665555', 5);
INSERT INTO EMPLOYEE VALUES ('Alicia',   'J', 'Zelaya',  '999887777', '1968-01-19', '3321 Castle, Spring, TX',  'F', 25000, '987654321', 4);
INSERT INTO EMPLOYEE VALUES ('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire, TX',  'F', 43000, '888665555', 4);
INSERT INTO EMPLOYEE VALUES ('Ramesh',   'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', 5);
INSERT INTO EMPLOYEE VALUES ('Joyce',    'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX',   'F', 25000, '333445555', 5);
INSERT INTO EMPLOYEE VALUES ('Ahmad',    'V', 'Jabbar',  '987987987', '1969-03-29', '980 Dallas, Houston, TX',  'M', 25000, '987654321', 4);
INSERT INTO EMPLOYEE VALUES ('James',    'E', 'Borg',    '888665555', '1937-11-10', '450 Stone, Houston, TX',   'M', 55000, NULL,        1);
