#!/sbin/sh
#
# Handles mosquitto service start/refresh
#

. /lib/svc/share/smf_include.sh

CONFIGFILE=/opt/local/etc/mosquitto.conf
PIDFILE=/var/run/mosquitto.pid

# Handle our 
case $1 in 
'start')
        /opt/local/sbin/mosquitto -c $CONFIGFILE -d
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
