#********************************************************************************************
# OBJETIVO : ACTUALIZAR PLAZO EN TABLA BOSD
#*******************************************************************************************/
# INSTALLATION: TCS
# CREATE      : 10/06/2015
# AUTHOR      : John Calderon
# PARAMETROS  : $1  fecha
#                                     
#*******************************************************************************************/
pgm=`basename $0`


ARCHIVEDIR=$data/file
export DD_MFLAGS=$data/file/MFLAGS

yyyy=`cut -c 9-12  $data/file/MFLAGS`
mm=`cut -c 13-14 $data/file/MFLAGS`
dd=`cut -c 15-16 $data/file/MFLAGS`
todays_date=`echo $dd$mm$yyyy`

. controlmRC ; crtlM_Init
sqlplus -s / @$sql/call_prc8090.sql $todays_date
exit_code=$?; if [ $exit_code -ne 0 ]; then  exit_code=99; CrtlM_Func $exit_code $LINENO ; fi

echo "  Process Successfull for PLAZO on table BOSD... " 
echo '\n'
