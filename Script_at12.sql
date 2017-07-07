 /* NUMERO DE ODT: 6103702
 * CREADO POR: John Calderon
 * FECHA CREACION: 07/11/2014
 * MOTIVO: alter table to add three fields
 */
  
 spool c:\Script_at12.txt      
 PROMPT INICIO ACTUALIZACION
 
--select antes

  select *
  from  B2000.TSP_GARANTIAS WHERE rownum < 1;

--alter--

ALTER TABLE B2000.TSP_GARANTIAS
  ADD (NUMERO_DE_PRESTAMO VARCHAR2(10),
       TIPO_FACILIDAD_CREDITICIA VARCHAR2(2),
       VALOR_PONDERADO_GARANTIA NUMBER(18,2));

--comment--

 comment on column B2000.TSP_GARANTIAS.NUMERO_DE_PRESTAMO
  is 'Numero de Prestamo';

 comment on column B2000.TSP_GARANTIAS.TIPO_FACILIDAD_CREDITICIA
  is 'Tipo de Facilidad Crediticia'; 

 comment on column B2000.TSP_GARANTIAS.VALOR_PONDERADO_GARANTIA
  is 'Valor ponderado de Garantia';



commit;

--select despues

  select *
  from  B2000.TSP_GARANTIAS WHERE rownum < 1;
                                                         

PROMPT FIN ACTUALIZACION 
spool off;
show errors;
exit;