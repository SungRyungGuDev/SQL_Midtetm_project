SELECT * FROM GHC_FACULTY;

UPDATE GHC_FACULTY
SET date_fired = '01-May-21', is_active = 0
WHERE Surname = 'Bradfield' AND Firstname = 'William';
COMMIT;

SELECT * FROM GHC_FACULTY;

