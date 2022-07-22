SET echo on

spool C:\Users\ryang\OneDrive\Desktop\Q1Spool.txt

DROP TABLE xyz_EmployeeWebsites;
DROP TABLE xyz_Employee;
DROP TABLE xyz_Access;
DROP TABLE xyz_Website;

CREATE TABLE xyz_Website (
    URL VARCHAR2(50),
    CONSTRAINT SYS_xyzWebsite_PK PRIMARY KEY (URL)   
);

CREATE TABLE xyz_Access (
    accessCode CHAR(1),
    accessDescription VARCHAR2(20)
);

ALTER TABLE xyz_Access
ADD CONSTRAINT SYS_xyzAccess_PK PRIMARY KEY(accessCode);
ALTER TABLE xyz_Access
ADD CONSTRAINT SYS_Access_accessCode_CK CHECK(accessCode IN ('M', 'A', 'E', 'C'));



CREATE TABLE xyz_Employee (
    staffID NUMBER,
    emailAddress VARCHAR2(50),
    firstName VARCHAR2(30) CONSTRAINT SYS_Employee_firstName_NN NOT NULL,
    lastName VARCHAR2(30) CONSTRAINT SYS_Employee_lastName_NN NOT NULL,
    phoneNumber NUMBER(10),
    accessCode CHAR(1),
    CONSTRAINT SYS_xyzEmployee_PK PRIMARY KEY (staffID),
    CONSTRAINT SYS_xyzEmployee_emailAddress_UK UNIQUE (emailAddress),
    CONSTRAINT SYS_Access_Employee_FK FOREIGN KEY (accessCode) REFERENCES xyz_Access (accessCode) 
);



CREATE TABLE xyz_EmployeeWebsites(
    URL VARCHAR2(50),
    staffID NUMBER,
    datetimeAccessed DATE,
    CONSTRAINT SYS_xyzEmployeeWebsites_PK PRIMARY KEY (URL, staffID),
    CONSTRAINT SYS_Website_EmployeeWebsites_FK FOREIGN KEY (URL) REFERENCES xyz_Website (URL),
    CONSTRAINT SYS_Employee_EmployeeWebsites_FK FOREIGN KEY (staffID) REFERENCES xyz_Employee (staffID)
);

SET LINESIZE 50
describe xyz_Website;
describe xyz_Access;
describe xyz_Employee;
describe xyz_EmployeeWebsites;

SET LINESIZE 500
COLUMN constraint_name FORMAT A45
COLUMN column_name FORMAT A30
SELECT constraint_name, column_name
FROM user_cons_columns
WHERE table_name = 'XYZ_WEBSITE';

SET LINESIZE 500
COLUMN constraint_name FORMAT A45
COLUMN column_name FORMAT A30
SELECT constraint_name, column_name
FROM user_cons_columns
WHERE table_name = 'XYZ_ACCESS';

SET LINESIZE 500
COLUMN constraint_name FORMAT A45
COLUMN column_name FORMAT A30
SELECT constraint_name, column_name
FROM user_cons_columns
WHERE table_name = 'XYZ_EMPLOYEE';

SET LINESIZE 500
COLUMN constraint_name FORMAT A45
COLUMN column_name FORMAT A30
SELECT constraint_name, column_name
FROM user_cons_columns
WHERE table_name = 'XYZ_EMPLOYEEWEBSITES';

COMMIT;

SPOOL OFF;