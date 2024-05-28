#!/bin/bash

echo "--------------------------------------< keti.sh >------------------------------------------------"

# USB-to-RS232로 RTCM 출력
/usr/bin/socat -u udp-listen:12007,fork /dev/ttyUSB0,b115200,raw,echo=0 &

# TCP 포트로 출력
sudo /usr/bin/socat -u udp-listen:13006,fork tcp-listen:9999,reuseaddr,fork &   # NMEA+UBX TCP output
sudo /usr/bin/socat -u udp-listen:13007,fork tcp-listen:7777,reuseaddr,fork &   # [X] SSR RTCM TCP output
sudo /usr/bin/socat -u udp-listen:10007,fork tcp-listen:5555,reuseaddr,fork &   # SSR RTCM TCP output
sudo /usr/bin/socat -u udp-listen:12007,fork tcp-listen:6666,reuseaddr,fork &   # SSR RTCM TCP output


#sudo /usr/bin/socat -u tcp-listen:5555,reuseaddr,fork upd:localhost:10010 &     # OSR input 

## SSR2OSR  basic options
#
# -d [tty|udp|tcp] : GPS device port
# -o [tty|udp|tcp] : OSR RTCM3 output port
# -s [h|p|m]       : POINT-SSR source option 
#     h*: hybrid, p: POINT only, m: MBC only
# -i [0*|1-9|a-w|z] : Grid-based Interpolation option
#         0 : automatic grid selection
#         1-9 a-w : 1-32(w) single grid
#         z  : grid list
#            e.g) -i z -g "[1,2,3,4]" 


## UDP-based
#sleep 1.5
#/home/pi/keti/ssr2osr_run -d udp:0.0.0.0:14006 -o udp:localhost:10010 -s m  &    # SSR2OSR

## TCP-based
sudo /usr/bin/socat -u udp-listen:14006 tcp-listen:14006,reuseaddr,fork &     # UDP->TCP
sleep  5
/home/pi/keti/ssr2osr_run -d tcp:localhost:14006 -o udp:localhost:10010 -s m   &  # SSR2OSR


exit 0
