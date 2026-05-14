#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

#DSBOARD-THRMAX REV 1.1
#IN1_PIN_NUM=641
#IN1_PIN=PJ.06

IN1_PIN_NUM=534
IN1_PIN=PDD.04

sudo echo $IN1_PIN_NUM > /sys/class/gpio/export
sudo echo in > /sys/class/gpio/$IN1_PIN/direction

trap interrupt_func INT
interrupt_func() {
	sudo echo $IN1_PIN_NUM > /sys/class/gpio/unexport
}

watch -n 0.1 sudo cat /sys/class/gpio/$IN1_PIN/value

