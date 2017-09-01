#!/usr/bin/env python

import rospy
import serial
import string
import math
import sys

from sensor_msgs.msg import LaserScan
from hokuto_node.msg import hokuyo
from serial_module.msg import ArduinoCommand
import numpy as np
import tensorflow as tf


pub_command = rospy.Publisher('command',ArduinoCommand,queue_size=100)

sub_lidar_front = rospy.Subscriber('scan_front', LaserScan,callback_front)
sub_lidar_rear = rospy.Subscriber('scan_rear', LaserScan,queue_size = 100)

x = np.zeros((10,680))
flag = False #flag for first time data collection


rospy.init_node('learned_control_module', anonymous=True)
rate = rospy.Rate(100)
def callback_front(data):
	if not flag: #first time data collection
		for i in range(10):
			x[i] = data.intensities
		flag = True
	else:
		for i in range(10):
			x[9-i] = x[9-i-1]
		x[0] = data.intensities

	# feed x into trained classifier to obtain y
	#
	#
	if y==0:
		cmd.steering = 1218
	elif y==1:	
		cmd.steering = 1318
	elif y==2:	
		cmd.steering = 1418
	elif y==3:	
		cmd.steering = 1468
	elif y==4:	
		cmd.steering = 1518
	elif y==5:	
		cmd.steering = 1618
	else y==6:	
		cmd.steering = 1718

	cmd.mode='f'
	cmd.speed = 50

	rospy.loginfo(y)
	rospy.loginfo(cmd)
	pub_command.publish(cmd)

	
while not rospy.is_shutdown():
	rospy.spin()
