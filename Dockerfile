FROM ubuntu
LABEL Robert Jonczy (robert.jonczy@gmail.com)

RUN apt-get update && apt-get install vim iputils-ping snmptrapd -y
ADD snmptrapd.conf /etc/snmp/snmptrapd.conf

EXPOSE 1062
CMD ["snmptrapd", "-C", "-c", "/etc/snmp/snmptrapd.conf", "-n", "-L", "o", "-f", "-M", "/mibs", "-m", "ALL"]

