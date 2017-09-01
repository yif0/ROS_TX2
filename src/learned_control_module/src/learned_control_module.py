#!/usr/bin/env python

import rospy
import serial
import string
import math
import sys

from sensor_msgs.msg import LaserScan
#from hokuto_node.msg import hokuyo
from serial_module.msg import ArduinoCommand 
import numpy as np
import tensorflow as tf



global flag 
flag= False
global x
x = np.zeros((10,512))
def callback_front(data):
	y = 0
	#print('data...')
	length = len(data.ranges)
	#rospy.loginfo(length)
	cmd = ArduinoCommand()
	global flag
	global x
	if flag is False: #first time data collection
		for i in range(10):
			x[i] = data.ranges
		flag = True
	else:
		for i in range(9):
			x[i] = x[i+1]
		x[9] = data.ranges
	
	x[x>10]=10
	x[np.isnan(x)]=10
        
	# feed x into trained classifier to obtain y
	#
	#
	
	feed = {X_in: x.reshape(-1,512,1,1),
                keep_prob: 1.,
           	p_keep_conv:1.0, p_keep_hidden: 1.0}
	y = sess.run(model_prediction, feed_dict=feed)
	y = np.argmax([y[-1,:]])
	
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
	elif y==6:	
		cmd.steering = 1718

	cmd.mode= 1
	cmd.speed = 50
      
	rospy.loginfo(y)
	#rospy.loginfo(cmd)
	#rospy.loginfo(np.max(x))
	#rospy.loginfo(np.min(x))
	pub_command.publish(cmd)

if __name__ == '__main__':
	rospy.loginfo('Learned control module starting....')
	print('Learned control module starting....printed')
	pub_command = rospy.Publisher('command',ArduinoCommand,queue_size=100)

	sub_lidar_front = rospy.Subscriber('scan_front', LaserScan,callback_front)
	#sub_lidar_rear = rospy.Subscriber('scan_rear', LaserScan,callback_rear)
	
	rospy.loginfo('Loading tensorflow graph....')
	checkpoint = tf.train.latest_checkpoint('/home/nvidia/RosWorkspace/src/learned_control_module/src/lstm_model/checkpoints/')
	#print checkpoint
	sess = tf.Session()
	new_saver = tf.train.import_meta_graph('/home/nvidia/RosWorkspace/src/learned_control_module/src/graph/inference_graph.meta')
	new_saver.restore(sess, checkpoint)
	graph = tf.get_default_graph()
	X_in = graph.get_tensor_by_name('cnn_input:0')
	p_keep_conv=graph.get_tensor_by_name('keep_conv:0')
	p_keep_hidden = graph.get_tensor_by_name('keep_hidden:0')
	model_prediction = graph.get_tensor_by_name('predictions:0')
	keep_prob = graph.get_tensor_by_name('keep_prob:0')
	
	

	rospy.init_node('learned_control_module', anonymous=True)
	rate = rospy.Rate(100)	
        #flag for first time data collection
	

	
	while not rospy.is_shutdown():
		print('in loop...')

		rospy.spin()
