                --  Day Seven: Oracle Log 1: LOGIN
-- Let's Create de Table log
CREATE TABLE jr_login(
NM_USER VARCHAR(20) NOT NULL,
DT_DATETIME TIMESTAMP(0) NOT NULL,
NM_HOST VARCHAR(50)NOT NULL
);

-- A little detail, for get a better format
ALTER TABLE jr_login MODIFY DT_DATETIME TIMESTAMP(0);

-- Trigger
CREATE OR REPLACE TRIGGER trg_jr_login
    AFTER LOGON ON DATABASE
    WHEN(ora_login_user = 'JR')
DECLARE
name_host VARCHAR(50);
date_time TIMESTAMP(0);
BEGIN
    -- GETTING HOSTNAME AND DATE_HOUR
    SELECT sys_context ('USERENV', 'HOST') INTO name_host FROM DUAL;
    SELECT To_Char(SYSDATE,'DD/MM/YYYY HH24:MI:SS')INTO date_time FROM DUAL;
    
    INSERT INTO jr_login
    (NM_USER, DT_DATETIME, NM_HOST)
    VALUES
    (ora_login_user, date_time, name_host );
END;

select * from jr_login;

   SET SERVEROUTPUT ON; 
DECLARE
 x timestamp (0);
BEGIN
 
  SELECT To_Char(SYSDATE,'DD/MM/YYYY HH24:MI:SS')INTO x FROM DUAL;
  Dbms_Output.Put_Line('O valor é ' || x);
END;