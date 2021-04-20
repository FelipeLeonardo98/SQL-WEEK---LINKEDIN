                            -- Day Two - Oracle: User JR and setting permissions: Synonyms
/* In this example, the user HR (been using righ now), represents THE USER SÊNIOR (or DBA, if you prefer) */

 /* We have 7 tables (REGIONS, LOCATIONS, JOBS, JOB_HISTORY, EMPLOYEES, DEPARTMENTS and COUNTRIES), HOWEVER, 
     we going to use just TWO - EMPLOYEES and JOBS */
    
-- Let's CREATE SYNONYMS, for user JR can use objects/tables without much access
-- for table EMPLOYEES
CREATE PUBLIC SYNONYM JR_EMPLOYEES FOR EMPLOYEES;
-- for table JOBS
CREATE PUBLIC SYNONYM JR_JOBS FOR JOBS;

-- NOW, CRETE USER
CREATE USER JR IDENTIFIED BY i_am_junior;
-- Priviligies settings
GRANT CONNECT TO JR; 

-- ACCESS TO SYNONYMS
GRANT SELECT ON JR_EMPLOYEES TO JR;
GRANT SELECT ON JR_JOBS TO JR;

-- SPECIFIC UPDATE FIELD
GRANT UPDATE (EMAIL, PHONE_NUMBER) ON JR_EMPLOYEES TO JR;
COMMIT;
-- VERIFY
SELECT * FROM dba_sys_privs;