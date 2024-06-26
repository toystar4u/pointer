# POINTer S/W
POINTer S/W Release

### S/W Upgrade

- Individual software update
  ```
  $ cd <SW root>
  $ wget https://github.com/toystar4u/pointer/raw/main/latest/<platform>/<sw>
  $ sudo chmod +x <sw>
  ```
  * `platform`: win64, pointer, rpi, mbc
  * `sw`      : ppprtk_run, ssr2osr_run

- POINTer: Batch update
  ```
  $ cd ~/toystar/pnt-distro
  $ wget https://github.com/toystar4u/pointer/raw/main/latest/pointer/upgrade.sh
  $ sudo chmod +x upgrade.sh
  $ ./upgrade.sh
  ```
- MBC: Batch update
  ```
  $ cd ~/keti
  $ wget https://github.com/toystar4u/pointer/raw/main/latest/mbc/upgrade.sh
  $ sudo chmod +x upgrade.sh
  $ ./upgrade.sh
  ```



## Latest Version

### PPPRTK
- [WIN64](https://github.com/toystar4u/pointer/raw/main/latest/win64/ppprtk_run.exe) : https://github.com/toystar4u/pointer/raw/main/latest/win64/ppprtk_run.exe
- [POINTer](https://github.com/toystar4u/pointer/raw/main/latest/pointer/ppprtk_run) : https://github.com/toystar4u/pointer/raw/main/latest/pointer/ppprtk_run
- [RPi](https://github.com/toystar4u/pointer/raw/main/latest/rpi/ppprtk_run)         : https://github.com/toystar4u/pointer/raw/main/latest/rpi/ppprtk_run

### SSR2OSR
- [WIN64](https://github.com/toystar4u/pointer/raw/main/latest/win64/ssr2osr_run.exe) : https://github.com/toystar4u/pointer/raw/main/latest/win64/ssr2osr_run.exe
- [POINTer](https://github.com/toystar4u/pointer/raw/main/latest/pointer/ssr2osr_run) : https://github.com/toystar4u/pointer/raw/main/latest/pointer/ssr2osr_run
- [RPi](https://github.com/toystar4u/pointer/raw/main/latest/rpi/ssr2osr_run)        : https://github.com/toystar4u/pointer/raw/main/latest/rpi/ssr2osr_run
- [MBC](https://github.com/toystar4u/pointer/raw/main/latest/mbc/ssr2osr_run)        : https://github.com/toystar4u/pointer/raw/main/latest/mbc/ssr2osr_run

### Display Server
- [POINTer](https://github.com/toystar4u/pointer/raw/main/latest/pointer/dispserver) : https://github.com/toystar4u/pointer/raw/main/latest/pointer/dispserver
