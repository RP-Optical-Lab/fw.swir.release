#!/bin/bash

usage () {
	echo "# usage:   ./update.sh fw-name"
	echo "# example: ./update.sh rp-swir-sdi-isp-v001a"
	echo
	exit 1
}

say_and_do () {
	echo $@
	eval $@
	if [ $? -ne 0 ]; then
		echo "# - error: Command failed!"
		echo
		exit 1
	fi
}

echo "##############################################"
echo

FW="$1"
if [ -z "$FW" ]; then
	echo "# - error: FW name must be specified"
	usage
else
	echo "# - FW found, setting $FW"
fi

# echo "# download"
# say_and_do git clone https://github.com/RP-Optical-Lab/fw.swir.release.git
# say_and_do cd fw.swir.release
say_and_do tar xvf $FW.tar.gz
say_and_do sudo mv $FW /lib/firmware/xilinx
# say_and_do cd ..
echo

echo "# update"
say_and_do 'echo '$FW' | sudo tee /etc/dfx-mgrd/'$FW''
say_and_do sudo ln -sf /etc/dfx-mgrd/$FW /etc/dfx-mgrd/default_firmware
say_and_do ls -l /etc/dfx-mgrd
say_and_do more /etc/dfx-mgrd/$FW

echo
echo "# - done"
echo "# - restart the system"
echo