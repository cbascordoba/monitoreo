#!/bin/sh
DIA=`date +%d/%m/%Y`
HORA=`date +%H:%M`
#Servicio a monitorear
SERVICIO='mysqld'



if ps ax | grep -v grep | grep $SERVICIO > /dev/null
	then
        echo "El servicio $SERVICIO esta ejecutándose"
else
        #Guardo en el archivo monitor.log información relacionada con la caida del servicio
       	echo "El servicio $SERVICIO se detuvo a las $HORA del dia $DIA" >> /home/monitor.log
        #reinicio el servicio
        /etc/init.d/mysql start
        #Envio un correo electronico informando. 
       	echo "El servicio $SERVICIO se detuvo a las $HORA del dia $DIA" | mail -s "servicio $SERVICIO - detenido" micorreo@gmail.com
fi
