            -- DayTwo: Oracle Junior Tests
            SET SERVEROUTPUT ON;
select * from jr_employees WHERE first_name LIKE 'H%';
select * from jr_jobs;
-- ok - Access to Synonyms, not tables
select * from HR.countries;
-- Blocked !
-- Now, let's to try update !
UPDATE jr_jobs SET min_salary = 200 WHERE job_id = 'AD_PRES';
-- block !
UPDATE jr_employees SET email = 'HBAER@oracle.COM' WHERE employee_id = 204; -- old email =HBAER
UPDATE jr_employees SET email = 'HBLOOM@GOOGLE.COM' WHERE employee_id = 169; -- old email HBLOOM
-- ok, both
UPDATE jr_employees SET PHONE_NUMBER = '212.989.0011' WHERE employee_id = 204; -- old phone_number = 515.123.8888
--ok --- can i update salary ?
UPDATE jr_employees SET SALARy = 700 WHERE employee_id = 204; -- old salary = 10000
-- BLOCK ! I only can update specific fields !
