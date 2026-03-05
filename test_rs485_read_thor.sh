#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

HALF_FULL=PY.00
HALF_FULL_NUM=605
RS422_232=PK.03
RS422_232_NUM=646
TX_ENABLE=PE.03
TX_ENABLE_NUM=570
RX_DISABLE=PE.02
RX_DISABLE_NUM=569

sudo echo $HALF_FULL_NUM > /sys/class/gpio/export
sudo echo $RS422_232_NUM > /sys/class/gpio/export
sudo echo $TX_ENABLE_NUM > /sys/class/gpio/export
sudo echo $RX_DISABLE_NUM > /sys/class/gpio/export

sudo echo high > /sys/class/gpio/$HALF_FULL/direction
sudo echo high > /sys/class/gpio/$RS422_232/direction
sudo echo low > /sys/class/gpio/$TX_ENABLE/direction
sudo echo low > /sys/class/gpio/$RX_DISABLE/direction

sudo gtkterm -p /dev/ttyAMA10 -s 115200 -w RS485

sudo echo $HALF_FULL_NUM > /sys/class/gpio/unexport
sudo echo $RS422_232_NUM > /sys/class/gpio/unexport
sudo echo $TX_ENABLE_NUM > /sys/class/gpio/unexport
sudo echo $RX_DISABLE_NUM > /sys/class/gpio/unexport

