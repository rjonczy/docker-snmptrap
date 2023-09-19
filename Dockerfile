FROM ubuntu
LABEL Robert Jonczy (robert.jonczy@gmail.com)

RUN apk --no-cache add net-snmp
ADD snmptrapd.conf /etc/snmp/snmptrapd.conf

EXPOSE 1062
ENTRYPOINT [ "snmptrapd" ]
CMD ["-C", "-c", "/etc/snmp/snmptrapd.conf", "-n", "-L", "o", "-f", "-M", "/mibs", "-m", "ALL"]

