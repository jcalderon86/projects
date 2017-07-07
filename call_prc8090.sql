-- ********************************************************
-- SHELL   : shbosd3.sh
-- COMPANIA: TCS
-- AUTOR:JOHN CALDERON
-- FECHA: 10/06/2015
-- OBJETIVO : LLENAR DIAS DE PLAZO EN TABLA BOSD
-- ********************************************************
set line 1000;
set trim on;
set serveroutput on;
variable v_exitcode number;
spool $sysout/call_prc8090.sql.out;
declare
  result        VARCHAR2(10); --0/1/null <--> false/true/null
  mensaje       VARCHAR2(200); --0/1/null <--> false/true/null
begin
  select 1 into :v_exitcode from dual;
  -- Call the function

  FNSONLM.ACTUALIZA_PLAZO('&1');

  select 0 into :v_exitcode from dual;
  exception
     when others then
      DBMS_OUTPUT.PUT_LINE('ERROR EN EJECUCION...call_prc8090 '||sqlerrm);
end;
/
spool off;
exit :v_exitcode;
/
