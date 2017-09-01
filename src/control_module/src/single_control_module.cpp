#include "ros/ros.h"
#include "serial_module/ArduinoCommand.h"
#include "vicon_module/ViconData.h"
#include "vicon_module/Position.h"
#include "control_module/CheckPoint.h"
#include "control_module/Trajectory.h"
#include <signal.h>

#include <unistd.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>

using namespace std;
using namespace vicon_module;
using namespace control_module;
using namespace serial_module;

Position state;

ros::Publisher pub_estimate;
ros::Publisher pub_command;
ArduinoCommand cmd;
ViconData state_estimate;
Position pos_estimate;

int SELF;

// constants for path line segments
double line_A;
double line_B;
double line_C;
double line_G;

const double PI = 3.1415926;
const int K = 200;
// constants and variables for PID
const int TURN_THRESHOLD = 422500; // 650 * 650
const double P_d = 0.27;
const double P_a = 465;
const double I = 0;
const double D = 0;
int speed;

int getSign(double val)
{
  if (val > 0) return 1;
  if (val < 0) return -1;
  return 0;
}

void stopCar()
{
  ArduinoCommand cmd;
  cmd.header.stamp = ros::Time::now();
  cmd.header.seq ++;
  cmd.header.frame_id = "command";
  cmd.mode = 'f';
  cmd.speed = 0;
  cmd.steering = 1550;
  ROS_INFO("[control_module.cpp] Stop the car.");
  pub_command.publish(cmd);
}

void controlCallback(const ViconData::ConstPtr& msg_vicon)
{
  ROS_DEBUG("[control_module.cpp] Previous state (%lf, %lf, %lf).", state.x, state.y, state.theta);

  double val = (line_A * state.x) + (line_B * state.y) + line_C;
  double error_a = state.theta - line_G;
  if (fabs(error_a) > PI)
  {
    error_a = -1 * getSign(error_a) * (2 * PI - fabs(error_a));
  }
  double error_d = getSign(val) * fabs(val) / sqrt(pow(line_A, 2) + pow(line_B, 2));
  ROS_DEBUG("[contorl_module.cpp] error_a: %lf, error_d: %lf.", error_a, error_d);

  double steering = 600 / (1 + exp(-(P_d * error_d + P_a * error_a) / K)) + 1250;

  cmd.header.stamp = ros::Time::now();
  cmd.header.seq ++;
  cmd.header.frame_id = "command";
  cmd.mode = 'f';
  cmd.speed = msg_vicon->positions[SELF].speed;
  cmd.steering = msg_vicon->positions[SELF].steering;
  ROS_DEBUG("[control_module.cpp] Send command speed %d, steering: %lf.", speed, steering);
  pub_command.publish(cmd);

  state_estimate.header.stamp = ros::Time::now();
  state_estimate.header.seq ++;
  state_estimate.header.frame_id = "/world";
  pos_estimate.x = msg_vicon->positions[SELF].x;
  pos_estimate.y = msg_vicon->positions[SELF].y;
  pos_estimate.theta = msg_vicon->positions[SELF].theta;
  //pos_estimate.speed = msg_vicon->positions[SELF].speed;
  //pos_estimate.steering = msg_vicon->positions[SELF].steering;
  state_estimate.positions.push_back(pos_estimate);
  pub_estimate.publish(state_estimate);

  // change unit from meter to milimeter
  state.x = msg_vicon->positions[SELF].x * 1000;
  state.y = msg_vicon->positions[SELF].y * 1000;
  state.theta = msg_vicon->positions[SELF].theta;
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "single_control_module");
  ros::NodeHandle ns;
  ros::NodeHandle np;
  ros::Rate loop_rate(50);
  pub_command = np.advertise<ArduinoCommand>("command", 100);
  pub_estimate = np.advertise<ViconData>("state_estimate", 100);
  ros::Subscriber sub = ns.subscribe("vicon_data", 1, &controlCallback);

  char* envvar = getenv("ROS_SELF");
  if (envvar != NULL)
  {
    SELF = atoi(envvar);
  } else
  {
    ROS_ERROR("[re_lidar_module.cpp] Environment variable ROS_SELF not set.");
    exit(-1);
  }

  if (argc != 4)
  {
    ROS_ERROR("[control_module.cpp] Need to specify [path name] [speed(mm/s)] [loop_num].");
    exit(-1);
  }
  ifstream f_path(argv[1]);
  speed = atof(argv[2]);
  int loop_num = atoi(argv[3]);
  ROS_INFO("[control_module.cpp] Speed %d, loop number %d.", speed, loop_num);

  Trajectory traj;
  CheckPoint chk;

  traj.num_chkpnt = 0;
  /*while (f_path >> chk.x >> chk.y)
  {
    ROS_INFO("Checkpoint: %lf, %lf.", chk.x, chk.y);
    // change unit from meter to milimeter
    chk.x *= 1000;
    chk.y *= 1000;
    traj.path.push_back(chk);
    traj.num_chkpnt ++;
  }
  ROS_INFO("[control_module.cpp] Path obtained. %d number of checkpoints.", traj.num_chkpnt);

  f_path.close();

  // initialize car state
  state.x = 0;
  state.y = 0;
  state.theta = 0;

  // wait for a few seconds to make sure everything else are started properly
  sleep(3);

  // line segment changing logic
  for (int i = 0; i < loop_num; i ++)
  {
    ROS_INFO("[control_module.cpp] The %dth. loop begins.", i+1);
    for (int j = 0; j < traj.num_chkpnt-1; j ++)
    {
      ROS_INFO("[control_module.cpp] Current line segment: between %dth and %dth.", j+1, j+2);
      line_A = traj.path[j].y - traj.path[j+1].y;
      line_B = traj.path[j+1].x - traj.path[j].x;
      line_C = (traj.path[j].x * traj.path[j+1].y) - (traj.path[j+1].x * traj.path[j].y);
      line_G = atan2(-line_A, line_B);
      if (line_G < 0)
      { 
        line_G += 2 * PI;
      }

      // running in line segment
      while(pow(state.x - traj.path[j+1].x, 2) + pow(state.y - traj.path[j+1].y, 2) > TURN_THRESHOLD && ros::ok())
      {
        ros::spinOnce();
        loop_rate.sleep();
      }
    }
  }

  stopCar();

  return 0;*/
	while (ros::ok())
	{
		ros::spinOnce();
		loop_rate.sleep();
	}
}
