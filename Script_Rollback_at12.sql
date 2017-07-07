 /* NUMERO DE ODT: 6103702
 * CREADO POR: John Calderon
 * FECHA CREACION: 07/11/2014
 * MOTIVO: ROLLBACK de las tabla B2000.TSP_GARANTIAS PARA ELIMINAR TRES CAMPOS
 */
 spool c:\Script_Rollback_at12.txt      
 PROMPT INICIO ROLLBACK
 
--select antes

  select *
  from  B2000.TSP_GARANTIAS
  WHERE rownum < 1;

--alter--

  ALTER TABLE B2000.TSP_GARANTIAS
  DROP (NUMERO_DE_PRESTAMO,
       TIPO_FACILIDAD_CREDITICIA,
       VALOR_PONDERADO_GARANTIA);


commit;

--select despues

  select *
  from  B2000.TSP_GARANTIAS
  WHERE rownum < 1;
                                                         

PROMPT FIN ROLLBACK
spool off;
show errors;
exit;