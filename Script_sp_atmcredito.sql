 /* NUMERO DE ODT: 6103702
 * CREADO POR: John Calderon
 * FECHA CREACION: 07/11/2014
 * MOTIVO: alter table to add 15 fields, change size, add comments
 */
  
 spool c:\Script_sp_atmcredito.txt      
 PROMPT INICIO ACTUALIZACION
 
--select antes

select * from b2000.sp_atmcredito WHERE rownum < 1;

--alter table--

 ALTER TABLE b2000.sp_atmcredito 
  ADD (Mto_xV1a5a number, 
       Mto_xV5a10a number,
       Mto_xVm10a number, 
       DIAS_MORA number(5), 
       Provision_NIIF number,
       Provision_complementaria number,
       APLICA_FECI VARCHAR2(2),
       GENERO VARCHAR2(2),
       NUM_FACILIDAD_ANTERIOR VARCHAR2(10),
       FECHA_PROXIMO_PAGO_CAPITAL DATE,
       PERIODICIDAD_PAGO_CAPITAL VARCHAR2(2),
       FECHA_PROXIMO_PAGO_INTERES	DATE,
       PERIODICIDAD_PAGO_INTERES VARCHAR2(2),
       PERFIL_VENCIMIENTO VARCHAR2(2),
       MONTO_CUOTA_PAGAR NUMBER);

--alter size--

ALTER TABLE b2000.sp_atmcredito MODIFY TIP_GAR_1 VARCHAR2(4);
ALTER TABLE b2000.sp_atmcredito MODIFY TIP_GAR_2 VARCHAR2(4);
ALTER TABLE b2000.sp_atmcredito MODIFY TIP_GAR_3 VARCHAR2(4);
ALTER TABLE b2000.sp_atmcredito MODIFY TIP_GAR_4 VARCHAR2(4);
ALTER TABLE b2000.sp_atmcredito MODIFY TIP_GAR_5 VARCHAR2(4);


 -- add comments--
  
 comment on column b2000.sp_atmcredito.APLICA_FECI
  is 'Corresponde a si la facilidad le aplica FECI ';
 comment on column b2000.sp_atmcredito.GENERO
  is 'GENERO '; 
 comment on column b2000.sp_atmcredito.NUM_FACILIDAD_ANTERIOR
  is 'numero de facilidad anterior ';
   comment on column b2000.sp_atmcredito.FECHA_PROXIMO_PAGO_CAPITAL
  is 'fecha de proximo pago capital ';
   comment on column b2000.sp_atmcredito.PERIODICIDAD_PAGO_CAPITAL
  is 'Periocidad de pago de capital ';
   comment on column b2000.sp_atmcredito.FECHA_PROXIMO_PAGO_INTERES
  is 'fecha de proximo pago de interes ';
   comment on column b2000.sp_atmcredito.PERIODICIDAD_PAGO_INTERES
  is 'periocidad de pago interes ';
   comment on column b2000.sp_atmcredito.PERFIL_VENCIMIENTO
  is 'Perfil de vencimiento ';
   comment on column b2000.sp_atmcredito.MONTO_CUOTA_PAGAR
  is 'Monto de cuota a paga';
     comment on column b2000.sp_atmcredito.Mto_xV1a5a
  is 'Monto por vencer  de 1 a 5 years';
     comment on column b2000.sp_atmcredito.Mto_xV5a10a
  is 'Monto por vencer de 5 a 10 years';
     comment on column b2000.sp_atmcredito.Mto_xVm10a
  is 'Monto por vencer mas de 10 years';
     comment on column b2000.sp_atmcredito.DIAS_MORA
  is 'dias de mora';
     comment on column b2000.sp_atmcredito.Provision_NIIF
  is 'PROVISION NIIF';
     comment on column b2000.sp_atmcredito.Provision_complementaria
  is 'PROVISION COMPLEMENTARIA NO NIIF';



commit;

--select despues

select * from b2000.sp_atmcredito WHERE rownum < 1;
                                                         

PROMPT FIN ACTUALIZACION 
spool off;
show errors;
exit;