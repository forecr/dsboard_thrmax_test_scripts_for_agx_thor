#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

M2B_RESET=PZ.06
M2B_RESET_NUM=619
M2B_PWR_ON=PP.03
M2B_PWR_ON_NUM=668
M2B_FULLCARD_PWRON=PP.04
M2B_FULLCARD_PWRON_NUM=669
M2B_W_ENABLE1=PL.03
M2B_W_ENABLE1_NUM=654
M2B_W_ENABLE2=PAL.02
M2B_W_ENABLE2_NUM=604

#echo $M2B_RESET_NUM > /sys/class/gpio/export
#echo $M2B_PWR_ON_NUM > /sys/class/gpio/export
#echo $M2B_FULLCARD_PWRON_NUM > /sys/class/gpio/export
#echo $M2B_W_ENABLE1_NUM > /sys/class/gpio/export
#echo $M2B_W_ENABLE2_NUM > /sys/class/gpio/export

#echo low > /sys/class/gpio/$M2B_RESET/direction
#echo high > /sys/class/gpio/$M2B_PWR_ON/direction
#echo high > /sys/class/gpio/$M2B_FULLCARD_PWRON/direction
#echo high > /sys/class/gpio/$M2B_W_ENABLE1/direction
#echo high > /sys/class/gpio/$M2B_W_ENABLE2/direction

trap interrupt_func INT
interrupt_func() {
	echo -n ""
	#echo $M2B_RESET_NUM > /sys/class/gpio/unexport
	#echo $M2B_PWR_ON_NUM > /sys/class/gpio/unexport
	#echo $M2B_FULLCARD_PWRON_NUM > /sys/class/gpio/unexport
	#echo $M2B_W_ENABLE1_NUM > /sys/class/gpio/unexport
	#echo $M2B_W_ENABLE2_NUM > /sys/class/gpio/unexport
}

watch -n 0.1 lsusb

