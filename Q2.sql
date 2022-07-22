set echo on

INSERT INTO GHC_DEPARTMENT (Dept_no, Dept_name)
    VALUES (101, 'Astronomy Department');

INSERT INTO GHC_FACULTY (Faculty_id, Surname, Firstname, date_hired, date_fired, is_active, Dept_no)
    VALUES (37422, 'Brorsen', 'John', '1-Mar-02', NULL, 1, 101);

INSERT INTO GHC_FACULTY (Faculty_id, Surname, Firstname, date_hired, date_fired, is_active, Dept_no)
    VALUES (388231, 'Bradfield', 'William', '1-Jul-10', NULL, 1, 101);
