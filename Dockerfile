FROM alpine:3.8
LABEL David Chidell (dchidell@cisco.com)

RUN apk --no-cache add net-snmp
ADD mibs.tar.gz /mibs/
ADD snmptrapd.conf /etc/snmp/snmptrapd.conf

EXPOSE 162
ENTRYPOINT [ "snmptrapd" ]
CMD ["-n","-L","o","-f","-M","/mibs","-m","ALL"]
