set echo on



spool C:\Users\ryang\OneDrive\Desktop\Q2Spool.txt
/*For my instructor, I will spooling this Data*/

/*Before inputting Datas, Show previous table*/

SELECT * FROM GHC_COURSE;

/*Input the Datas for Course*/

INSERT INTO GHC_COURSE (Course_code, Course_title, credits)
    VALUES ('ASTR100', 'Intro to Astronomy', 3);

INSERT INTO GHC_COURSE (Course_code, Course_title, credits)
    VALUES ('ASTR202', 'The Planets', 3);

INSERT INTO GHC_COURSE (Course_code, Course_title, credits)
    VALUES ('ASTR203', 'Nebula and Distant Galaxies', 5);        


/*After inputting Datas, Show table result*/
SELECT * FROM GHC_COURSE;

COMMIT;


SPOOL OFF;