#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi
#DSBOARD-THRMAX REV 1.1
#IN0_PIN_NUM=640
#IN0_PIN=PJ.05

IN0_PIN_NUM=533
IN0_PIN=PDD.03

sudo echo $IN0_PIN_NUM > /sys/class/gpio/export
sudo echo in > /sys/class/gpio/$IN0_PIN/direction

trap interrupt_func INT
interrupt_func() {
	sudo echo $IN0_PIN_NUM > /sys/class/gpio/unexport
}

watch -n 0.1 sudo cat /sys/class/gpio/$IN0_PIN/value

