#!/sbin/sh
#
# Handles mosquitto service start/refresh
#

. /lib/svc/share/smf_include.sh

CONFIGFILE=${PREFIX}/etc/mosquitto.conf
PIDFILE=/var/run/mosquitto.pid

case $1 in
'start')
        ${PREFIX}/sbin/mosquitto -c $CONFIGFILE -d
        ;;

'reload')
        if [ -f "$PIDFILE" ]; then
                /usr/bin/kill -HUP `/usr/bin/cat $PIDFILE`
        fi
        ;;

*)
        echo "Usage: $0 { start | reload }"
        exit 1
        ;;
esac

exit $?
