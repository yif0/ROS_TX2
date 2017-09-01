#include "ros/ros.h"
#include <json/json.h>
#include <signal.h>
#include "serial_module/ArduinoCommand.h"
#include "vicon_module/ViconData.h"
#include "sensor_msgs/LaserScan.h"
#include "sensor_msgs/Imu.h"
#include "message_filters/subscriber.h"
#include "message_filters/synchronizer.h"
#include "message_filters/sync_policies/approximate_time.h"

#include <iostream>
#include <fstream>

using namespace vicon_module;
using namespace sensor_msgs;
using namespace serial_module;
using namespace message_filters;
using namespace std;

int f_count;
ofstream outfile;
Json::Value frames(Json::arrayValue);

void fileSigintHandler(int sig)
{
  ROS_INFO("Total %d frames written into file.", f_count);

  Json::StyledWriter writer;
  outfile << writer.write(frames);

  outfile.close();
  ros::shutdown();
}

void controlCallback(const ViconData::ConstPtr& msg_vicon, const Imu::ConstPtr& msg_imu, const LaserScan::ConstPtr& msg_front, const LaserScan::ConstPtr& msg_rear, const ArduinoCommand::ConstPtr& msg_command)
{
  f_count ++;
  ROS_INFO("Got %d frame.", f_count);

  Json::Value frame;

  frame["vicon_data"]["header"]["seq"] = msg_vicon->header.seq;
  frame["vicon_data"]["header"]["stamp"] = msg_vicon->header.stamp.toSec();
  frame["vicon_data"]["header"]["frame_id"] = msg_vicon->header.frame_id;
  frame["vicon_data"]["obj_num"] = msg_vicon->obj_num;
  Json::Value positionsArray(Json::arrayValue);
  for (int i = 0; i < msg_vicon->obj_num; i ++)
  {
    Json::Value position;
    position["x"] = msg_vicon->positions[i].x;
    position["y"] = msg_vicon->positions[i].y;
    position["theta"] = msg_vicon->positions[i].theta;
    positionsArray.append(position);
  }
  frame["vicon_data"]["positions"] = positionsArray;

  frame["imu_data"]["header"]["seq"] = msg_imu->header.seq;
  frame["imu_data"]["header"]["stamp"] = msg_imu->header.stamp.toSec();
  frame["imu_data"]["header"]["frame_id"] = msg_imu->header.frame_id;
  frame["imu_data"]["orientation"]["x"] = msg_imu->orientation.x;
  frame["imu_data"]["orientation"]["y"] = msg_imu->orientation.y;
  frame["imu_data"]["orientation"]["z"] = msg_imu->orientation.z;
  frame["imu_data"]["orientation"]["w"] = msg_imu->orientation.w;
  Json::Value orientation_covarianceArray(Json::arrayValue);
  for (int i = 0; i < 9; i ++)
  {
    orientation_covarianceArray.append(msg_imu->orientation_covariance[i]);
  }
  frame["imu_data"]["orientation_covariance"] = orientation_covarianceArray;
  frame["imu_data"]["angular_velocity"]["x"] = msg_imu->angular_velocity.x;
  frame["imu_data"]["angular_velocity"]["y"] = msg_imu->angular_velocity.y;
  frame["imu_data"]["angular_velocity"]["z"] = msg_imu->angular_velocity.z;
  Json::Value angular_velocity_covarianceArray(Json::arrayValue);
  for (int i = 0; i < 9; i ++)
  {
    angular_velocity_covarianceArray.append(msg_imu->angular_velocity_covariance[i]);
  }
  frame["imu_data"]["angular_velocity_covariance"] = angular_velocity_covarianceArray;
  frame["imu_data"]["linear_acceleration"]["x"] = msg_imu->linear_acceleration.x;
  frame["imu_data"]["linear_acceleration"]["y"] = msg_imu->linear_acceleration.y;
  frame["imu_data"]["linear_acceleration"]["z"] = msg_imu->linear_acceleration.z;
  Json::Value linear_acceleration_covarianceArray(Json::arrayValue);
  for (int i = 0; i < 9; i ++)
  {
    linear_acceleration_covarianceArray.append(msg_imu->linear_acceleration_covariance[i]);
  }
  frame["imu_data"]["linear_acceleration_covariance"] = linear_acceleration_covarianceArray;

  frame["lidar_front"]["header"]["seq"] = msg_front->header.seq;
  frame["lidar_front"]["header"]["stamp"] = msg_front->header.stamp.toSec();
  frame["lidar_front"]["header"]["frame_id"] = msg_front->header.frame_id;
  frame["lidar_front"]["angle_min"] = msg_front->angle_min;
  frame["lidar_front"]["angle_max"] = msg_front->angle_max;
  frame["lidar_front"]["angle_increment"] = msg_front->angle_increment;
  frame["lidar_front"]["time_increment"] = msg_front->time_increment;
  frame["lidar_front"]["scan_time"] = msg_front->scan_time;
  frame["lidar_front"]["range_min"] = msg_front->range_min;
  frame["lidar_front"]["range_max"] = msg_front->range_max;
  Json::Value rangesArray(Json::arrayValue);
  for (int i = 0; i < 680; i ++)
  {
    rangesArray.append(msg_front->ranges[i]);
  }
  frame["lidar_front"]["ranges"] = rangesArray;
//  Json::Value intensitiesArray(Json::arrayValue);
//  for (int i = 0; i < 680; i ++)
//  {
//    intensitiesArray.append(msg_front->intensities[i]);
//  }
//  frame["lidar_front"]["intensities"] = intensitiesArray;

  frame["lidar_rear"]["header"]["seq"] = msg_rear->header.seq;
  frame["lidar_rear"]["header"]["stamp"] = msg_rear->header.stamp.toSec();
  frame["lidar_rear"]["header"]["frame_id"] = msg_rear->header.frame_id;
  frame["lidar_rear"]["angle_min"] = msg_rear->angle_min;
  frame["lidar_rear"]["angle_max"] = msg_rear->angle_max;
  frame["lidar_rear"]["angle_increment"] = msg_rear->angle_increment;
  frame["lidar_rear"]["time_increment"] = msg_rear->time_increment;
  frame["lidar_rear"]["scan_time"] = msg_rear->scan_time;
  frame["lidar_rear"]["range_min"] = msg_rear->range_min;
  frame["lidar_rear"]["range_max"] = msg_rear->range_max;
  rangesArray.clear();
  for (int i = 0; i < 680; i ++)
  {
    rangesArray.append(msg_rear->ranges[i]);
  }
  frame["lidar_rear"]["ranges"] = rangesArray;
//  intensitiesArray.clear();
//  for (int i = 0; i < 680; i ++)
//  {
//    intensitiesArray.append(msg_rear->intensities[i]);
//  }
//  frame["lidar_rear"]["intensities"] = intensitiesArray;

  frame["command"]["header"]["seq"] = msg_command->header.seq;
  frame["command"]["header"]["stamp"] = msg_command->header.stamp.toSec();
  frame["command"]["header"]["frame_id"] = msg_command->header.frame_id;
  frame["command"]["mode"] = msg_command->mode;
  frame["command"]["speed"] = msg_command->speed;
  frame["command"]["steering"] = msg_command->steering;

  frames.append(frame);
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "sensor_sync");
  ros::NodeHandle ns;

  message_filters::Subscriber<ViconData> sub_vicon(ns, "vicon_data", 100);
  message_filters::Subscriber<Imu> sub_imu(ns, "imu", 100);
  message_filters::Subscriber<LaserScan> sub_front(ns, "scan_front", 1);
  message_filters::Subscriber<LaserScan> sub_rear(ns, "scan_rear", 1);
  message_filters::Subscriber<ArduinoCommand> sub_command(ns, "command", 100);

  ros::Duration duration(0, 250000000);

  typedef sync_policies::ApproximateTime<ViconData, Imu, LaserScan, LaserScan, ArduinoCommand> sensorSyncPolicy;
  Synchronizer<sensorSyncPolicy> sync(sensorSyncPolicy(100), sub_vicon, sub_imu, sub_front, sub_rear, sub_command);
  sync.setMaxIntervalDuration(duration);
  sync.registerCallback(boost::bind(&controlCallback, _1, _2, _3, _4, _5));

  f_count = 0;
  outfile.open(argv[1]);

  signal(SIGINT, fileSigintHandler);

  ros::spin();
}

