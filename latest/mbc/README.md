usage: ./ssr2osr_run [-h] [options]
options:
    -h  show this message
    -f  specify the CFG file name
    -m  specify the mountpoint (default: POINT-KRISO-RT)
    -d  specify the GPS serial port or TCP icom port (default: ttyUSB4)
                TCP port number: 3001 - 3007 for Novatel and 4001 for U-Blox
    -n  use Novatel receiver instead of UBlox(deprecivated. use `-D` option)
    -D  specify the type of receiver(u*:UBlox, n:NovAtel, x: any device that supports GPGGA+RTCM1019)
    -o  specify OSR RTCM output device/port(default: GPS input port)
    -M  specify MBC POINT-SSR input port(default: tcp:localhost:14007)
    -t  specify the time in minutes (default: 0(infinite))
    -i  specify interpolation mode for Iono/Trop 
              0*   : automatic grid selection, 
              1 ~ 9: single grid(1 ~ 9 grid id), 
              a ~ w: single grid(10 ~ 32 grid id),
                    a:10, b:11, c:12, d:13, e:14, f:15, g:16, h:17, i:18, j:19 
                    k:20, l:21, m:22, n:23, o:24, p:25, q:26, r: 27, s:28, t:29
                    u:30, v:31, w:32 
              z    : grid list
    -g  specify the grid list when '-i z' 
               e.g) -i z -g "[18,19,23,24]" 
    -P  specify the RS Position(default: empty) 
               e.g) -P "[-3027298.428, 4103289.187, 3818547.016]" 
               e.g) -P [] for empty RS pos
    -R  specify the rcv antenna name(default: none) 
               e.g) -R "NOV850   NONE" 
               e.g) -R "TRM59800.00     SCIS" 
    -T  specify the Timing Reference 
               g*: GPS-based, s: SSR-based, h: SSR-based @ GPS
    -a  specify the ATX file name(default: ./cfgs/igs14.atx)
    -p  specify the folder path for logging(default: ./data) 
    -s  specify the SSR mode(h*: hybrid, p: POINT only, m: MBC only) 
    -N  disable the relocation of RS position when too far from the origin RS 
    -l  enable the redirection of STDOUT/STDERR to a file
    -r  enable to log raw GPS/RTCM to a file
    -x  enable to log results to TXT files
    -z  enable to log results to MAT files

v2024.05.28
