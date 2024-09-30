## Options
```
$ ./ppprtk_run.exe -h

usage: D:\toystar\projects\PNT\examples\ppprtk_run.exe [-h] [options]
options:
    -h  show this message
    -f  specify the CFG file name
    -m  specify the mountpoint (default: POINT-KRISO-RT)
    -d  specify the GPS serial port or TCP icom port (default: ttyUSB4)
                TCP port number: 3001 - 3007 for Novatel and 4001 for U-Blox
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
                0*: normal NMEA GPGGA, 1: only GPGGA for SPP, 2: only GPGGA for PPPRTK w/ PL
                3 : SSRPOS,  4: (SPP + PPPRTK) GPGGA,   5: (SPP+PPPRTK) GPGGA + SSRPOS 
    -M  specify the MBC device serial port or TCP IP:port(default: ttymxc2) 
                        IP:port for TCP connection(default port: 14007) 
    -S  specify the SSR mode(h*: hybrid, p: POINT only, m: MBC only) 
    -P  specify the Reference Position(default: DASN POS) 
               e.g) -P "[-3027298.428, 4103289.187, 3818547.016]" 
               e.g) -P [] for empty RS pos
    -R  specify the rcv antenna name(default: "NOV850   NONE") 
               e.g) change : -R "TRM59800.00     SCIS" 
               e.g) not set: -R "" 
    -X  specify the diplay server IP:port(default: localhost:54321) 
    -U  enable to update the reference postion(dynamic positioning) 
    -l  enable the redirection of STDOUT/STDERR to a file
    -o  enable to log Output(GPGGA/SSRPOS) to a file
    -r  enable to log raw GPS/RTCM to a file
    -x  enable to log results to TXT files
    -z  enable to log results to MAT files
    -L  enable to split POS and Output log files every days

v2024.09.30
```

## Release Log

- 2024-09-30 :
    * add checkRange() for parsing SSR data
    * remove assert() in the ZeroDifferencer::selectPivot()
      
- 2024-09-09 :
    * add a function that check the validity of keys
    * add options for the CFG file
      
- 2024-09-03 :
    * use HDOP/PDOP of the SPP solver for POINT message
    * fix UTC bug in the NMEA GPGGA/POINT messages
    * add HDOP/VDOP computation for SPP position form RCV
    * default KF mode: MT
    * apply the last version of Monitor(2024-08-23) -- temporal
  
- 2024-08-16 :
    * fix TOW rollover problems: loadnav() and bcvelo()
    * organize the TTL of ephemeris
    * Monitor...
        * when the valid and handover flags of the monitor are true, 
        only accept the result of the PPPRTK solver
        * if age is the max. value and all buffers are cleared, set the age to 1
          
- 2024-08-09 :     
    * add Monitor; manual update states of the Solver modules
	* support TM(Time->Measurement) update mode in KalmanFilter
	* default KF mode: TM

- 2024-07-30 :
    * remove assert() in the Lambda class
    * fix bugs in the Lambda class  ==> transpose() function
    * add linear interpolation to reduce the singularity of Bilinear interpolations 
        for 2 grids in GridBasedInterpolator class 

- 2024-07-26 :
    * add EGM2008-5 model for computing the Geoid Height
    * write POINT log instead of GPGGA for PPPRTK

- 2024-07-08 :
  * add an option that split files every day
  * reduce the active memory size of gps_data_t and gps_osr_t
  * fix bug that grid list not applied
  * use the device or SPP solution instead of corrected SPP for NMEA SPP output 

- 2024-06-17 :
  * update PL computation
  * reset the PPPRTK solver after 10 seconds of inactivity
  * fix bug that the undulation(geoid separation) is not considered in the height in BESTPOS and GPGGA
  * remove the port number limitations for MBS SSR
  * change the default port for MBC SSR to 14007
    
- 2024-05-23 :
  * fix bugs when the internet is unavailable

- 2024-05-17 : 
    * increase the buffer size of NoVatel Parser

- 2024-05-14 : 
  * change the default Ublox UART baudrate to 115200
  * handle NaN value for TROP interpolation
  * reset the PNTSolver when solution is NaN value
    
- v2024-05-08
  * POINT SSR SMT05 changed
    
- v2024-05-08
  * support the output device and log stream
  * add the output format(NMEA GPGGA/SSRPOS with PL)

- v2024-05-03
  * support the dynamic positioning
  * add inital HDOP/VDOP compuation
    
- v2024-04-15
  * add command-line option for setting rcv antenna
  * change the interpolation method based on GRIDs
  * add an option for fixed RS position
