#!/sbin/sh
#
# Handles mosquitto service start/refresh
#

. /lib/svc/share/smf_include.sh

case $1 in
'start')
  @PREFIX@/sbin/mosquitto -c @PKG_SYSCONFDIR@/mosquitto.conf -d
  ;;

'reload')
  PIDFILE=@VARBASE@/run/mosquitto.pid
  if [ -f "${PIDFILE}" ]; then
    /usr/bin/kill -HUP $(/usr/bin/cat "${PIDFILE}")
  fi
  ;;

*)
  echo "Usage: $0 { start | reload }"
  exit 1
  ;;
esac

exit $?
