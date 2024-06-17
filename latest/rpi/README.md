## 1️⃣ Suported Devies

### Using Vender-specific Messages
Vender | Device | Messages | Option | Tested| Note
---|---|---|---|:---:|---
UBlox | ZED-F9P | UBX-NAV-POSECEF,UBX-RXM-SFBRX | -D u | ✅ |default 
NoVatel | OEM-7 | BESTPOS, GPSEPHEM | -D n | ✅ |  



### Using NMEA GPGGA and RTCM1019 Messages
- Common : `-D x` used
- CASE 1
  * `-d` port  : GPGGA + RTCM1019
- CASE 2
  * `-d` port : GPGGA
  * `-e` port : RTCM1019

    
Vender | Device | Messages | Option | Tested
---|---|---|---|:---:
UBlox | ZED-F9P | GPGGA/GNGGA, RTCM1019(not supported) | | ❌ 
NoVatel | OEM-7 | GPGGA, RTCM1019| -D x | ✅
Treamble | ? | ?, ? | -D x | ❓





## 2️⃣ Options
```
usage: ./ssr2osr_run [-h] [options]
options:
    -h  show this message
    -f  specify the CFG file name
    -m  specify the mountpoint (default: POINT-KRISO-RT)
    -d  specify the GPS serial port or TCP icom port
              default serial: ttyACM0 for UBlox and ttyUSB4 for Novatel 
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

v2024.06.04
```


## 3️⃣ Usage
### UBlox
```
$ ./ssr2osr_run -d ttyAMA0
```

### NovAtel
- OSR input port: USB2 port(ttyUSB1)
```
# USB COM port
$ ./ssr2osr_run -d ttyUSB2 -o ttyUSB1 -D n
```
```
# ICOM port
$ ./ssr2osr_run -d tcp:192.168.1.5:3002 -o ttyUSB1 -D n
```

### Any devices that are supporting NMEA GPGGA and RTCM1019 messages
```
# NoVatel ICOM port
$ ./ssr2osr_run -d tcp:192.168.1.5:3002 -o ttyUSB1 -D x
```

## 4️⃣ Release Log
- 2024-06-04 : 
  * fix bug that the undulation(geoid separation) is not considered in the height in BESTPOS and GPGGA
  * the universal receiver mode is tested on NoVatel 

- 2024-05-23 : 
  * fix bug: relocate RS position
  * add an option(`-N`) for disabling the relocation of RS position when too far from the origin RS
  * ignore the port number restriction for the OSR output port


- 2024-05-17 : 
  * support NovAtel RTK(PwrPak7) with `-n` option
  * increase the buffer size of NoVatel Parser
  * remove duplicated GPS OBS data

- 2024-05-14 :
  * change the default Ublox UART baudrate to 115200
  * change the default `-T` option to `g`
  * handle NaN value for TROP interpolation
  
- 2024-05-13 : 
  * POINT SSR SMT05 changed
  * add a Timing Reference option(`-T`)

- v2024-05-03
  * change the SatPOS/VEL/EL/AZ computation methods for SSR2OSR
  * save the floating-point GPS epoch for logging OSR data
    
- v2024-04-15
