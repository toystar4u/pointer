#!/bin/bash

REPO_URL=https://github.com/toystar4u/pointer/raw/main/latest/mbc

ROOT=/home/pi/keti
TARGET=$ROOT

#download version file
wget ${REPO_URL}/version.txt -O $ROOT/version.txt.tmp


PVER="$(cat version.txt)"
CVER="$(cat version.txt.tmp)"

if [ -z $CVER ];
then
	echo "[UPGRADE] Version Check Failed :: check the network connection"
	exit 0
fi


if [ -z $PVER ] || (( $(echo "$CVER > $PVER" |bc -l) ));
then
	echo "[UPGRADE] New version available: $CVER"
	mv version.txt.tmp version.txt

	SWLIST="ssr2osr_run ssr_test mbcssr_test"

	for SW in $SWLIST
	do
		echo "==> $SW backup...."
		mv $TARGET/$SW $TARGET/$SW.bak

		echo "==> $SW downloading"
		wget ${REPO_URL}/$SW -P $TARGET
		sudo chmod +x $TARGET/$SW

		## cleanup
		#echo "==> cleanup...."
		#rm -rf $TARGET/S$W.*
	done
	
 	## update keti.sh
  	echo "==> update keti.sh...."
   	MBCRTK=/home/pi/mbcrtk
    	mv $MBCRTK/keti.sh $MBCRTK/keti.sh.bak
     
   	wget ${REPO_URL}/keti.sh -P $MBCRTK
	sudo chmod +x $MBCRTK/keti.sh
 
	echo "[UPGRADE] Done: upgraded to $CVER" 
else 
	echo "[UPGRADE] The latest version is already installed: $PVER"

	rm -rf ./version.txt.tmp
fi
