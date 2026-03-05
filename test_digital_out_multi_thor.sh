#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

sleep_time=0.3

OUT0_PIN_NUM=568
OUT0_PIN=PE.01
OUT1_PIN_NUM=563
OUT1_PIN=PD.04
OUT2_PIN_NUM=564
OUT2_PIN=PD.05

sudo echo $OUT0_PIN_NUM > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/$OUT0_PIN/direction
sudo echo $OUT1_PIN_NUM > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/$OUT1_PIN/direction
sudo echo $OUT2_PIN_NUM > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/$OUT2_PIN/direction

sleep $sleep_time

echo "DIGITAL_OUT0 OFF"
sudo echo 0 > /sys/class/gpio/$OUT0_PIN/value
echo "DIGITAL_OUT1 OFF"
sudo echo 0 > /sys/class/gpio/$OUT1_PIN/value
echo "DIGITAL_OUT2 OFF"
sudo echo 0 > /sys/class/gpio/$OUT2_PIN/value

#Single Test
echo "step: 1/14"
echo "DIGITAL_OUT0 ON"
sudo echo 1 > /sys/class/gpio/$OUT0_PIN/value
sleep $sleep_time

echo "step: 2/14"
echo "DIGITAL_OUT0 OFF"
sudo echo 0 > /sys/class/gpio/$OUT0_PIN/value
sleep $sleep_time

echo "step: 3/14"
echo "DIGITAL_OUT1 ON"
sudo echo 1 > /sys/class/gpio/$OUT1_PIN/value
sleep $sleep_time

echo "step: 4/14"
echo "DIGITAL_OUT1 OFF"
sudo echo 0 > /sys/class/gpio/$OUT1_PIN/value
sleep $sleep_time

echo "step: 5/14"
echo "DIGITAL_OUT2 ON"
sudo echo 1 > /sys/class/gpio/$OUT2_PIN/value
sleep $sleep_time

echo "step: 6/14"
echo "DIGITAL_OUT2 OFF"
sudo echo 0 > /sys/class/gpio/$OUT2_PIN/value
sleep $sleep_time

#Double Test
echo "step: 7/14"
echo "DIGITAL_OUT0 ON"
echo "DIGITAL_OUT1 ON"
sudo echo 1 > /sys/class/gpio/$OUT0_PIN/value
sudo echo 1 > /sys/class/gpio/$OUT1_PIN/value
sleep $sleep_time

echo "step: 8/14"
echo "DIGITAL_OUT0 OFF"
echo "DIGITAL_OUT1 OFF"
sudo echo 0 > /sys/class/gpio/$OUT0_PIN/value
sudo echo 0 > /sys/class/gpio/$OUT1_PIN/value
sleep $sleep_time

echo "step: 9/14"
echo "DIGITAL_OUT1 ON"
echo "DIGITAL_OUT2 ON"
sudo echo 1 > /sys/class/gpio/$OUT1_PIN/value
sudo echo 1 > /sys/class/gpio/$OUT2_PIN/value
sleep $sleep_time

echo "step: 10/14"
echo "DIGITAL_OUT1 OFF"
echo "DIGITAL_OUT2 OFF"
sudo echo 0 > /sys/class/gpio/$OUT1_PIN/value
sudo echo 0 > /sys/class/gpio/$OUT2_PIN/value
sleep $sleep_time

echo "step: 11/14"
echo "DIGITAL_OUT0 ON"
echo "DIGITAL_OUT2 ON"
sudo echo 1 > /sys/class/gpio/$OUT0_PIN/value
sudo echo 1 > /sys/class/gpio/$OUT2_PIN/value
sleep $sleep_time

echo "step: 12/14"
echo "DIGITAL_OUT0 OFF"
echo "DIGITAL_OUT2 OFF"
sudo echo 0 > /sys/class/gpio/$OUT0_PIN/value
sudo echo 0 > /sys/class/gpio/$OUT2_PIN/value
sleep $sleep_time

#Triple Test
echo "step: 13/14"
echo "DIGITAL_OUT0 ON"
echo "DIGITAL_OUT1 ON"
echo "DIGITAL_OUT2 ON"
sudo echo 1 > /sys/class/gpio/$OUT0_PIN/value
sudo echo 1 > /sys/class/gpio/$OUT1_PIN/value
sudo echo 1 > /sys/class/gpio/$OUT2_PIN/value
sleep $sleep_time

echo "step: 14/14"
echo "DIGITAL_OUT0 OFF"
echo "DIGITAL_OUT1 OFF"
echo "DIGITAL_OUT2 OFF"
sudo echo 0 > /sys/class/gpio/$OUT0_PIN/value
sudo echo 0 > /sys/class/gpio/$OUT1_PIN/value
sudo echo 0 > /sys/class/gpio/$OUT2_PIN/value

echo "Completed"

sleep 1
sudo echo 1 > /sys/class/gpio/$OUT0_PIN/value
sudo echo 1 > /sys/class/gpio/$OUT1_PIN/value
sudo echo 1 > /sys/class/gpio/$OUT2_PIN/value
sleep 1

sudo echo $OUT0_PIN_NUM > /sys/class/gpio/unexport
sudo echo $OUT1_PIN_NUM > /sys/class/gpio/unexport
sudo echo $OUT2_PIN_NUM > /sys/class/gpio/unexport

