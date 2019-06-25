#####################
## chmod 777 project-template.sh
#
##
############ SET UP ##############################
##
# *Mantener sin espacios la declaración*

read -p "Nombre de la serie: " SERIE

read -p "Cliente: " CLIENTE
read -p "Episodio inicial: " EP_INICIAL
read -p "Episodio final: " EP_FINAL

PREFIX='Ep'


#
##
########### CREACIÓN DE CARPETA MADRE ############
##
#

mkdir `expr $SERIE`__`expr $CLIENTE`

cd `expr $SERIE`__`expr $CLIENTE`
mkdir AUX__`expr $SERIE`
mkdir COORDINACIÓN__`expr $SERIE`
mkdir EPISODIOS__`expr $SERIE`
cd EPISODIOS__`expr $SERIE`
#
##
########## SCRIPT GENERADOR DE CARPETAS ##########
##
#
CHUNK=`expr $EP_INICIAL + 10`
CHUNK=`expr $CHUNK / 10`
CHUNK=`expr $CHUNK * 10`
while [ $EP_INICIAL -lt $EP_FINAL ]
do	
   echo "###################################################"
   mkdir $PREFIX$EP_INICIAL-`expr $CHUNK`__$SERIE
	x=0	
	while [ `expr $EP_INICIAL + $x` -lt `expr $CHUNK + 1` ]
	do
	   	   
	   mkdir $PREFIX$EP_INICIAL-`expr $CHUNK`__$SERIE/$PREFIX`expr $EP_INICIAL + 									$x`__$SERIE
	   
	   echo "Carpeta "`expr $EP_INICIAL + $x`__`expr $SERIE`" creada"	
	   if [ `expr $EP_INICIAL + $x` -eq $EP_FINAL ]
	   then
	      break
	   fi
	   x=`expr $x + 1`
	done
   if [ $EP_INICIAL -eq $EP_FINAL ]
   then
      break
   fi
   EP_INICIAL=`expr $CHUNK + 1`
   CHUNK=`expr $CHUNK + 10`
  
done

echo "########### CARPETAS CREADAS CON ÉXITO ############"
###################################################

