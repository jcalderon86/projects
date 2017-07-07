create or replace procedure SCHEMA.PICOYPLACA( p_plate_no in varchar2,
                                               p_DAY in varchar2,
                                               p_hora date                                                                                  
) is

  PLATE          PLATE_NUMBER.PLATE_NO%TYPE;
  n_tran_date_dp DATE;
  LAST_DIGIT     VARCHAR2(1);

/*
   Author: John Calderon
   PLATE_NUMBER   TABLA GENERAL DE PLACAS
   
*/

begin

 -- VALIDATE IF PLATE NUMBER EXIST IN TABLE   
  BEGIN
    SELECT substr(c.plate_no,-1,1)
      FROM PLATE_NUMBER c as LAST_DIGIT   -- GET LAST DIGIT  
      where c.plate_no = p_plate_no;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN 
          DBMS_OUTPUT.put_line('PLATE NUMBER DOES NOT EXIST')   
    WHEN OTHERS THEN
          DBMS_OUTPUT.put_line('Invalid plate number' ||
                               SQLERRM); 
    
  END;

   BEGIN
    SELECT TO_CHAR(p_hora, 'HH:MI')
      INTO n_tran_date_dp
      FROM DUAL;

   EXCEPTION
    WHEN OTHERS THEN
      SELECT TO_DATE(SYSDATE, 'HH:MI')
        INTO n_tran_date_dp
        FROM DUAL;

     IF (n_tran_date_dp BETWEEN '09:30' AND '16:00') THEN 
       DBMS_OUTPUT.PUT_LINE('CAR IS ALLOWED TO DRIVE BETWEEN 9:30 A.M AND 4:00 PM ');
     ELSE 
       DBMS_OUTPUT.PUT_LINE('VALIDATING  PLATE NUMBER: ' || plate );
     
        
   END;


   IF p_day = 'MONDAY' and (LAST_DIGIT in (1,2))  THEN 
       DBMS_OUTPUT.PUT_LINE('automobile with plate number ' || plate 'is 
                                             allowed to be on the road');
   else 
       DBMS_OUTPUT.PUT_LINE('automobile with plate number ' || plate 'is
                                         NOT allowed to be on the road');
   END IF;
  
   IF p_day = 'TUESDAY' and (LAST_DIGIT in (3,4))  THEN 
       DBMS_OUTPUT.PUT_LINE('automobile with plate number ' || plate 'is 
                                             allowed to be on the road');
   else 
       DBMS_OUTPUT.PUT_LINE('automobile with plate number ' || plate 'is
                                         NOT allowed to be on the road');
   END IF;

   IF p_day = 'WEDNESDAY' and (LAST_DIGIT in (5,6))  THEN 
       DBMS_OUTPUT.PUT_LINE('automobile with plate number ' || plate 'is 
                                             allowed to be on the road');
   else 
       DBMS_OUTPUT.PUT_LINE('automobile with plate number ' || plate 'is
                                         NOT allowed to be on the road');
   END IF;

   IF p_day = 'THRUSDAY' and (LAST_DIGIT in (7,8))  THEN 
       DBMS_OUTPUT.PUT_LINE('automobile with plate number ' || plate 'is 
                                             allowed to be on the road');
   else 
       DBMS_OUTPUT.PUT_LINE('automobile with plate number ' || plate 'is
                                         NOT allowed to be on the road');
   END IF;

   IF p_day = 'FRIDAY' and (LAST_DIGIT in (9,0))  THEN 
       DBMS_OUTPUT.PUT_LINE('automobile with plate number ' || plate 'is 
                                             allowed to be on the road');
   else 
       DBMS_OUTPUT.PUT_LINE('automobile with plate number ' || plate 'is
                                         NOT allowed to be on the road');
   END IF;
  


end PICOYPLACA;
/