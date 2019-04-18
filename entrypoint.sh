#!/bin/bash
set -e

if [ "$1" = 'freeswitch' ]; then
  shift

while :; do
  case $1 in 
  -i|--local-ip)
    if [ -n "$2" ]; then
      sed -i -e "s/my_local_ip4=.*\"/my_local_ip4=$2/g" /usr/local/freeswitch/conf/vars_diff.xml
    fi
    ;;

  -s|--sip-port)
    if [ -n "$2" ]; then
      sed -i -e "s/sip_port=[[:digit:]]\+/sip_port=$2/g" /usr/local/freeswitch/conf/vars_diff.xml
    fi
    ;;

  -t|--tls-port)
    if [ -n "$2" ]; then
      sed -i -e "s/tls_port=[[:digit:]]\+/tls_port=$2/g" /usr/local/freeswitch/conf/vars_diff.xml
    fi
    ;;

  -e|--event-socket-port)
    if [ -n "$2" ]; then
      sed -i -e "s/event_socket_port=[[:digit:]]\+/event_socket_port=$2/g" /usr/local/freeswitch/conf/vars_diff.xml
    fi
    ;;

  -a|--rtp-range-start)
    if [ -n "$2" ]; then
      sed -i -e "s/rtp_range_start=[[:digit:]]\+/rtp_range_start=$2/g" /usr/local/freeswitch/conf/vars_diff.xml
    fi
    ;;

  -z|--rtp-range-end)
    if [ -n "$2" ]; then
      sed -i -e "s/rtp_range_end=[[:digit:]]\+/rtp_range_end=$2/g" /usr/local/freeswitch/conf/vars_diff.xml
    fi
    ;;

  --ext-rtp-ip)
    if [ -n "$2" ]; then
      sed -i -e "s/ext_rtp_ip=.*\"/ext_rtp_ip=$2\"/g" /usr/local/freeswitch/conf/vars_diff.xml
    fi
    ;;

  -p|--password)
    if [ -n "$2" ]; then
      sed -i -e "s/password=.*\"/password=$2\"/g" /usr/local/freeswitch/conf/vars_diff.xml
    fi
    ;;

  --)
    shift
    break
    ;;

  *)
    break
  esac

  shift
  shift

done
    exec freeswitch "$@"
fi

exec "$@"