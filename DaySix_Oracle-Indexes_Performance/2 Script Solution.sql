-- Analyzing Table Student before Index
  select * from students order by student_id;
  -- COST: 5.393
  select * from students where student_id = 703;
  -- COST: 3
  select * from students where cpf = '45197452186';
   -- COST: 1.087
   select * from students where age BETWEEN 17 and 31;
    -- COST: 1.075
   select * from students where age BETWEEN 17 and 31 ORDER BY age;
   -- COST: 3.290
  
-- Analyzing Table Student_Random before Index
   select * from students_random order by student_id;
  -- COST: 7.645
  select * from students_random where student_id = 703;
  -- COST: 1.087
  select * from students_random where cpf = '45197452186';
  -- COST: 1.103
  select * from students_random where age BETWEEN 17 and 31;
    -- COST: 1.091
   select * from students_random where age BETWEEN 17 and 31 ORDER BY age;
   -- COST: 3.306
   
   -- Index of Students Table
   CREATE INDEX IDX_STUDENT_CPF ON STUDENTS (cpf); --BTREE INDEX
   
   -- Now, Analyzing Table Student AFTER Index
  select * from students where cpf = '45197452186';
   -- COST BEFORE: 1.087  - COST AFTER BTREE INDEX: 5
   select * from students where age BETWEEN 17 and 31;
    -- COST: 
   select * from students where age BETWEEN 17 and 31 ORDER BY age;
   -- COST: 
   
   -- Students_random - Index
   CREATE INDEX IDX_AGE ON STUDENTS_RANDOM (age); --BTREE INDEX
   select * from students_random where age BETWEEN 17 and 31 ORDER BY age;
   -- COST BEFORE: 3.306 - COST AFTER: 3.306
  
    -- WE WEREN'T HAD MUCH DIFFERENCE, BUT, THE INDEX "BITMAP" IS MORE RECOMMENDED FOR SITUATIONS
    DROP INDEX IDX_AGE;
    
    CREATE BITMAP INDEX IDX_BIT_AGE ON STUDENTS_RANDOM (age); -- BITMAP
    select * from students_random where age BETWEEN 17 and 31 ORDER BY age;
   -- COST BEFORE BTREE: 3.306 - COST AFTER BTREE: 3.306  - COST WITH BITMAP: 2.721
  
   
   -- Students_random - Index
   CREATE INDEX IDX_ID_RANDOM ON STUDENTS_RANDOM (student_id); --BTREE INDEX
   select * from students_random where student_id = 703;
   -- COST AFTER INDEX: 4