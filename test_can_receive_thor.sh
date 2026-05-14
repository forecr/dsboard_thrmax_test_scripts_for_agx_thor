#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

sudo modprobe can
sudo modprobe can_raw
sudo modprobe mttcan
#sudo ip link set can0 type can bitrate 500000 dbitrate 2000000 berr-reporting on fd on
#sudo ip link set can1 type can bitrate 500000 dbitrate 2000000 berr-reporting on fd on
sudo ip link set can2 type can bitrate 500000 dbitrate 2000000 berr-reporting on fd on
#sudo ip link set can3 type can bitrate 500000 dbitrate 2000000 berr-reporting on fd on
#sudo ip link set up can0
#sudo ip link set up can1
sudo ip link set up can2
#sudo ip link set up can3

trap interrupt_func INT
interrupt_func() {
	#sudo ip link set can0 down
	#sudo ip link set can1 down
	sudo ip link set can2 down
	#sudo ip link set can3 down
}

candump can2

