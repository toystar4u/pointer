## Options
```
$  ./ppprtk_run -h

usage: ./ppprtk_run [-h] [options]
options:
    -h  show this message
    -f  specify the CFG file name
    -m  specify the mountpoint (default: POINT-RTCM32)
    -N  specify the NTRIP Caster in 'ip:port' format(default: NMPNT caster:2101)
    -A  specify username:passwd for the NTRIP Caster(default: NMPNT caster)
    -d  specify the GPS serial port or TCP icom port
                Serial port: ttyUSB4 - ttyUSB6 for Novatel and ttyACM0 for U-Blox
                TCP port   : 3001 - 3007 for Novatel and 4001 for U-Blox(ONLY DASN)
    -u  use U-Blox receiver instead of Novatel
    -j  specify the R-Mode port(default: ttyMAX2)
    -b  specify the broker IP or sever name
    -p  specify the broker port
    -n  specify the client name
    -t  specify the time in minutes (default: 0(infinite))
    -s  specify solution option(0: sync., 1*: async.)
    -i  specify interpolation mode for Iono/Trop 
              0*   : automatic grid selection, 
              1 ~ 9: single grid(1 ~ 9 grid id), 
              a ~ w: single grid(10 ~ 32 grid id),
                    a:10, b:11, c:12, d:13, e:14, f:15, g:16, h:17, i:18, j:19 
                    k:20, l:21, m:22, n:23, o:24, p:25, q:26, r:27, s:28, t:29
                    u:30, v:31, w:32 
              z    : grid list
    -g  specify the grid list when '-i z' option is used 
               e.g) -i z -g "[18,19,23,24]" 
    -w  specify interpolation mode for Iono/Trop (depreciated)
    -y  specify the ATX file name(default: ./cfgs/igs14.atx)
    -c  specify the DCB file name(default: ./cfgs/P1C1_RINEX.DCB)
    -a  enable NoVatel ASCII mode(default: Binary mode)
    -k  specify the folder path for logging(default: ./data) 
    -O  specify output port(default: ttyMAX0) 
    -F  specify output format when the output port or output logging are avaialble 
                0*: normal NMEA GPGGA, 1: only GPGGA for SPP, 2: POINT
                3 : SSRPOS,  4: SPP GPGGA + POINT,   5: SPP GPGGA + POINT + SSRPOS 
    -M  specify the MBC device serial port or TCP IP:port(default: ttymxc2) 
                        IP:port for TCP connection(default port: 14007) 
    -S  specify the SSR mode(h*: hybrid, p: POINT only, m: MBC only) 
    -P  specify the Reference Position(default: none 
               e.g) -P "[-3027298.428, 4103289.187, 3818547.016]" 
               e.g) -P [] for empty RS pos
    -R  specify the rcv antenna name(default: "NOV850   NONE") 
               e.g) change : -R "TRM59800.00     SCIS" 
               e.g) not set: -R "" 
    -X  specify the diplay server IP:port(default: localhost:54321) 
    -U  disable to update the reference postion(dynamic positioning) 
    -K  use KGD2002
    -l  enable the redirection of STDOUT/STDERR to a file
    -o  enable to log Output(GPGGA/SSRPOS) to a file
    -r  enable to log raw GPS/RTCM to a file
    -x  enable to log results to TXT files
    -z  enable to log results to MAT files
    -L  enable to split POS and Output log files every days

v2025.03.27
```

## Release Log
- 2025-03-27  :
    * changed default options

- 2024-12-05 :
    * added a command-line option for KGD2002 transformation
    * added command-line options for setting the NTRIP caster's IP, port, username, and password 
    * fixed the singularity problem when all z values are same in the Interpolator2D

- 2024-09-30 :
    * added checkRange() for parsing SSR data
    * removed assert() in the ZeroDifferencer::selectPivot()
     
- 2024-09-09 :
    * added a function that check the validity of keys
    * added options for the CFG file 

- 2024-09-03 :
    * used HDOP/PDOP of the SPP solver for POINT message
    * fixed UTC bug in the NMEA GPGGA/POINT messages
    * added HDOP/VDOP computation for SPP position form RCV
    * default KF mode: MT
    * applied the last version of Monitor(2024-08-23) -- temporal

- 2024-08-16 :
    * fixed TOW rollover problems: loadnav() and bcvelo()
    * organized the TTL of ephemeris
    * Monitor...
        * when the valid and handover flags of the monitor are true, 
        only accept the result of the PPPRTK solver
        * if age is the max. value and all buffers are cleared, set the age to 1
          
- 2024-08-09 :     
    * added Monitor; manual update states of the Solver modules
	* supported TM(Time->Measurement) update mode in KalmanFilter
	* default KF mode: TM

- 2024-07-30 :
    * removed assert() in the Lambda class
    * fixed bugs in the Lambda class  ==> transpose() function
    * added linear interpolation to reduce the singularity of Bilinear interpolations 
        for 2 grids in GridBasedInterpolator class 

- 2024-07-26 :
    * added EGM2008-5 model for computing the Geoid Height
    * written the POINT log instead of GPGGA for PPPRTK

- 2024-07-08 :
  * added an option that split files every day
  * reduced the active memory size of gps_data_t and gps_osr_t
  * fixed the bug that grid list not applied
  * used the device or SPP solution instead of corrected SPP for NMEA SPP output 

- 2024-06-17 :
  * updated PL computation
  * reset the PPPRTK solver after 10 seconds of inactivity
  * fixed bug that the undulation(geoid separation) is not considered in the height in BESTPOS and GPGGA
  * removed the port number limitations for MBS SSR
  * changed the default port for MBC SSR to 14007
    
- 2024-05-23 :
  * fixed bugs when the internet is unavailable
  
- 2024-05-17 :
  * increased the buffer size of NoVatel Parser
  
- 2024-05-14 :
  * changed the default Ublox UART baudrate to 115200
  * handled NaN values for TROP interpolation
  * reset the PNTSolver when solution is NaN value
    
- v2024-05-13
  * POINT SSR SMT05 changed
    
- v2024-05-08
  * supported the output device and log stream
  * added the output format(NMEA GPGGA/SSRPOS with PL)
    
- v2024-05-03
  * supported the dynamic positioning
  * added inital HDOP/VDOP compuation
    
- v2024-04-15
  * added command-line option for setting rcv antenna
  * changed the interpolation method based on GRIDs
  * added an option for fixed RS position
