create or replace procedure FNSONLM.ACTUALIZA_PLAZO(tran_date in varchar2) is

  lnContador     NUMBER;
  CUENTA         BOSD.ACCT_NO%TYPE;
  DUE_DATE       INVM.MAT_DT%TYPE;
  PLAZO          NUMBER(5);
  n_tran_date_dp NUMERIC;
  PLAZO_INSERT   NUMBER(5);

  CURSOR LIST_CURSOR IS
  
    SELECT c.acct_no, c.tran_date
      FROM BOSD c
     WHERE c.SUB_CTA_CONT LIKE '%2103%'
       AND C.TRAN_DATE = n_tran_date_dp;

  CURSOR LIST_CURSOR3 IS
    select A.MAT_DT from invm a where a.key_1 = '003' || CUENTA;

begin

  BEGIN
    SELECT TO_NUMBER(TO_CHAR(TO_DATE(tran_date, 'DD/MM/YYYY'), 'J') -
                     2415020)
      INTO n_tran_date_dp
      FROM DUAL;
  EXCEPTION
    WHEN OTHERS THEN
      SELECT TO_NUMBER(TO_CHAR(TRUNC(SYSDATE), 'J') - 2415020)
        INTO n_tran_date_dp
        FROM DUAL;
  END;

  lnContador := 0;
  FOR LIST_REC_CURSOR IN LIST_CURSOR LOOP
    CUENTA := LIST_REC_CURSOR.acct_no;
  
    FOR LIST_REC_CURSOR3 IN LIST_CURSOR3 LOOP
      DUE_DATE := LIST_REC_CURSOR3.MAT_DT;
    
      lnContador   := lnContador + 1;
      PLAZO        := (DUE_DATE - n_tran_date_dp);
      PLAZO_INSERT := PLAZO;
      begin
      
        UPDATE fnsonlf.BOSD A
           SET A.PLAZO = PLAZO_INSERT ,
               A.DATE_IN = DUE_DATE
         WHERE A.ACCT_NO = CUENTA
           AND A.TRAN_DATE = n_tran_date_dp;

      
        COMMIT;
      
      EXCEPTION
        WHEN OTHERS THEN
          DBMS_OUTPUT.put_line('No se pudo realizar el update de dias plazo ' ||
                               SQLERRM);
      end;
    
    END LOOP;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('REGISTROS PROCESADOS ' || lnContador);

end ACTUALIZA_PLAZO;
/