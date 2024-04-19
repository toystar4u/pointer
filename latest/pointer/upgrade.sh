#!/bin/bash

REPO_URL=https://github.com/toystar4u/pointer/raw/main/latest/pointer

ROOT =/home/mendel/toystar/pnt-distro
TARGET=$ROOT/examples

#download version file
wget ${REPO_URL}/version.txt -O $ROOT/version.txt.tmp


PVER="$(cat version.txt)"
CVER="$(cat version.txt.tmp)"

if [ -z $CVER ];
then
	echo "Version Check Failed :: check the network connection"
	exit 0
fi


if [ -z $PVER ] || (( $(echo "$CVER > $PVER" |bc -l) ));
then
	echo "New version available: $CVER"
	mv version.txt.tmp version.txt


	## backup
	echo "==> clbackupeanup...."
	mv $TARGET/ppprtk_run $TARGET/ppprtk_run.bak
	mv $TARGET/ssr2osr_run $TARGET/ssr2osr_run.bak
	mv $TARGET/ssr_test $TARGET/ssr_test.bak
	mv $TARGET/ssr_test_debug $TARGET/ssr_test_debug.bak
	mv $TARGET/mbcssr_test $TARGET/mbcssr_test.bak
	mv $TARGET/mbcssr_test_debug $TARGET/mbcssr_test_debug.bak

	## downloading
	echo "==> downloading"
	wget ${REPO_URL}/ppprtk_run -P $TARGET
	sudo chmod +x $TARGET/ppprtk_run

	wget ${REPO_URL}/ssr2osr_run -P $TARGET
	sudo chmod +x $TARGET/ssr2osr_run

	wget ${REPO_URL}/ssr_test -P $TARGET
	sudo chmod +x $TARGET/ssr_test

	wget ${REPO_URL}/ssr_test_debug -P $TARGET
	sudo chmod +x $TARGET/ssr_test_debug

	wget ${REPO_URL}/mbcssr_test -P $TARGET
	sudo chmod +x $TARGET/mbcssr_test

	wget ${REPO_URL}/mbcssr_test_debug -P $TARGET
	sudo chmod +x $TARGET/mbcssr_test_debug

	## cleanup
	echo "==> cleanup...."
	#rm -rf $TARGET/ppprtk_run.* $TARGET/ssr2osr_run.* $TARGET/ssr_test.*
	#rm -rf $TARGET/mbcssr_test.* $TARGET/mbcssr_test_debug.* $TARGET/ssr_test_debug.*
else 
	echo "The latest version $PVER used"

	rm -rf ./version.txt.tmp
fi
