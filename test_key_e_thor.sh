#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

M2E_ENABLE1=PQ.01
M2E_ENABLE1_NUM=674
M2E_ENABLE2=PP.06
M2E_ENABLE2_NUM=671

#echo $M2E_ENABLE1_NUM > /sys/class/gpio/export
#echo $M2E_ENABLE2_NUM > /sys/class/gpio/export

#echo high > /sys/class/gpio/$M2E_ENABLE1/direction
#echo high > /sys/class/gpio/$M2E_ENABLE2/direction

trap interrupt_func INT
interrupt_func() {
	echo -n ""
	#echo $M2E_ENABLE1_NUM > /sys/class/gpio/unexport
	#echo $M2E_ENABLE2_NUM > /sys/class/gpio/unexport
}

watch -n 0.1 "lsusb && echo '' && lspci"

