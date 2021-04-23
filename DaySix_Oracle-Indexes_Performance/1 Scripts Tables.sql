 -- DaySix: Indexes and Performance
-- Lets create a example table (it's a VERY SIMPLE table, only for example, all right?),
CREATE TABLE students (
    student_id INTEGER NOT NULL, 
    first_name varchar2(30), 
    age integer, 
    cpf char(11),
    CONSTRAINT PK_STUDENT PRIMARY KEY(student_id)); 
desc students;

 -- This code it's for generate a random cpf
SELECT to_char((power(10, 12)) * val_random, 'FM000000000000') AS cpf
FROM (SELECT dbms_random.VALUE val_random FROM dual CONNECT BY LEVEL <= 1);

-- Test cpf into var
SET SERVEROUTPUT ON; 
DECLARE
 x char (11);
BEGIN
 SELECT to_char((power(10, 11)) * val_random, 'FM00000000000')INTO x
FROM (SELECT dbms_random.VALUE val_random  FROM dual CONNECT BY LEVEL <= 1);
  Dbms_Output.Put_Line('O valor é ' || x);
END;

-- Insert a lot of registers
DECLARE
 var_cpf char(11);
 Begin 
 
    For i in 1..800000 
    Loop 
     SELECT to_char((power(10, 11)) * val_random, 'FM00000000000')INTO var_cpf
        FROM (SELECT dbms_random.VALUE val_random  FROM dual CONNECT BY LEVEL <= 1);
     Insert into students
        values(i, dbms_random.string('U',9), dbms_random.value(17,60),var_cpf); 
    If mod(i, 800000 ) = 0 then 
     Commit; 
    End if; 
    End loop; 
 End; 
  / 
  select * from students;
  -- Lets create a table with random datas
 Create table students_random 
 as 
 select /*+ append */ * from students order by dbms_random.random; 
 
  select * from students_random;