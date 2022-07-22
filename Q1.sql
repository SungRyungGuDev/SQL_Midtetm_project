set echo on 

spool C:\Users\ryang\OneDrive\Desktop\q1spool.txt

DROP Table xyz_EmployeeWebsites;
DROP Table xyz_employee;
DROP Table xyz_access;
DROP Table xyz_website;

CREATE TABLE xyz_Access (
    accessCode CHAR(1),
    accessDescription VARCHAR2(20)
);

ALTER TABLE xyz_Access
ADD CONSTRAINT SYS_xyz_Access_PK PRIMARY KEY (accessCode);

ALTER TABLE xyz_Access
ADD CONSTRAINT SYS_Access_accessCode_CK CHECK (accessCode IN ('M', 'A', 'E', 'C'));

CREATE TABLE xyz_Website (
    URL VARCHAR2(50),
    CONSTRAINT SYS_xyz_Website_PK PRIMARY KEY (URL)
);

CREATE TABLE xyz_Employee (
    staffID NUMBER,
    emailAddress VARCHAR2(50),
    firstName VARCHAR2(30) CONSTRAINT SYS_Employee_firstName_NN NOT NULL,
    LastName VARCHAR2(30) CONSTRAINT SYS_Employee_lastName_NN NOT NULL,
    phoneNumber NUMBER(10),
    accessCode CHAR(1) CONSTRAINT SYS_Access_Employee_FK REFERENCES xyz_Access (accessCode),
    CONSTRAINT SYS_xyz_Employee_PK PRIMARY KEY (staffID)
);

CREATE TABLE xyz_EmployeeWebsites (
    URL VARCHAR2(50),
    staffID NUMBER,
    datetimeAccessed DATE,
    CONSTRAINT SYS_xyz_EmployeeWebsites_PK PRIMARY KEY (URL, staffID),
    CONSTRAINT SYS_Website_EmployeeWebsites_FK FOREIGN KEY (URL) REFERENCES xyz_Website (URL),
    CONSTRAINT SYS_Employee_EmployeeWebsites_FK FOREIGN KEY (staffID) REFERENCES xyz_Employee (staffID)
);

COMMIT;

spool OFF;