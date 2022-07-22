
/*Before updaing show current Datas*/

SELECT * FROM GHC_FACULTY;

UPDATE GHC_FACULTY
SET date_fired = '01-May-21' , is_active = 0
WHERE Surname = 'Bradfield' AND Firstname = 'William';

/*After updating show change result*/

SELECT * FROM GHC_FACULTY;

/*After Checking, Data commit*/

COMMIT;