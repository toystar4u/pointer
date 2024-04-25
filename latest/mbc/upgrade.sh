#!/bin/bash

REPO_URL=https://github.com/toystar4u/pointer/raw/main/latest/pointer

ROOT=/home/mendel/toystar/pnt-distro
TARGET=$ROOT/examples

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

	SWLIST="ppprtk_run ssr2osr_run ssr_test ssr_test_debug mbcssr_test mbcssr_test_debug"

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

	echo "[UPGRADE] Done: upgraded to $CVER" 
else 
	echo "[UPGRADE] The latest version is already installed: $PVER"

	rm -rf ./version.txt.tmp
fi