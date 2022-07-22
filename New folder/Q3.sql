SET echo on

/*Before updating show current table*/

SELECT * FROM GHC_COURSE;

/*Updating Datas on course table*/

UPDATE GHC_COURSE
SET credits = 4 WHERE COURSE_CODE LIKE '____2__';

/*After updaing show current table result*/

SELECT * FROM GHC_COURSE;

COMMIT;