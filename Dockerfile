FROM alpine:3.18
LABEL David Chidell (dchidell@cisco.com)

RUN apk --no-cache add net-snmp
ADD mibs.tar.gz /mibs/
ADD snmptrapd.conf /etc/snmp/snmptrapd.conf

EXPOSE 1062
ENTRYPOINT [ "snmptrapd" ]
CMD ["-c", "/etc/snmp/snmptrapd.conf", "-n", "-L", "o", "-f", "-M", "/mibs", "-m", "ALL"]

