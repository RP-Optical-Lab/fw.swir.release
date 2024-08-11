#!/bin/bash

prints () {
	echo "# "$@
}

usage () {
	prints usage:   ./update.sh file
	prints example: ./update.sh fw.tar.gz
	exit 1
}

action () {
	prints $@
	eval $@
	if [ $? -ne 0 ]; then
		prints error: Command failed!
		usage
	fi
}

prints "#####################################################################"

if [ "$#" -ne 1 ]; then
    prints error: Provide version
    usage
fi

FILE="$1"
FW="$(basename "$FILE" .tar.gz)"

if pgrep -x "sve" > /dev/null; then
    action sudo killall sve
fi

prints Setting $FW
action sudo tar xvf $FILE -C /lib/firmware/xilinx
action 'echo '$FW' | sudo tee /etc/dfx-mgrd/'$FW''
action sudo ln -sf /etc/dfx-mgrd/$FW /etc/dfx-mgrd/default_firmware
action ls -l /etc/dfx-mgrd
action more /etc/dfx-mgrd/$FW
prints Done!
prints Restart the system!


# RM FW
# sudo rm -rf /lib/firmware/FW* /lib/firmware/xilinx/FW /etc/dfx-mgrd/FW
