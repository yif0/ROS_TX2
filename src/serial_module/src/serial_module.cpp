#include "ros/ros.h"
#include "serial_module/ArduinoCommand.h"
#include "serial_module/WheelEncoder.h"

#include <fcntl.h>
#include <termios.h>
#include <errno.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

using namespace serial_module;

// socket fd to communicate with Arduino
static int fd;
// buffer 
const int BUFF_SIZE = 128;
char buffer[BUFF_SIZE];
// wheel encoder sensor measurements
double we_speed = 0;
double we_aspeed = 0;

ros::Publisher pub_we;
WheelEncoder data;

void parse_we_readings(char *buff)
{
  int index = 0;
  int i = 0;
  char temp[64];

  while (buff[index] != '$')
  {
    temp[i++] = buff[index++];
  }
  temp[i] = '\0';
  we_speed = atof(temp);

  i = 0;
  index ++;
  while (buff[index] != '&')
  {
    temp[i++] = buff[index++];
  }
  temp[i] = '\0';
  we_aspeed = atof(temp);

  // publish results to topic
  data.header.stamp = ros::Time::now();
  data.header.seq ++; 
  data.header.frame_id = "/wheel_encoder";
  data.we_speed = we_speed;
  data.we_aspeed = we_aspeed;
  pub_we.publish(data);

  ROS_INFO("[serial_module.cpp] we_speed: %lf, we_aspeed: %lf.", we_speed, we_aspeed);
}

void serializeCommand(unsigned char* tx_buff, const ArduinoCommand::ConstPtr& msg)
{
  unsigned char* tx_ptr = tx_buff;
  if (msg->mode == 1) *tx_ptr = 'f';
  if (msg->mode == 2)  *tx_ptr = 'b';
  *tx_ptr = msg->mode;
  tx_ptr ++;

  // fill the array with command
  int speed = msg->speed;
  for (int i = 3; i >= 0; i --)
  {
    *(tx_ptr+i) = (speed % 10) + '0';
    speed /= 10;
  }
  tx_ptr += 4;

  int steering = msg->steering;
  for (int i = 3; i >= 0; i --)
  {
    *(tx_ptr+i) = (steering % 10) + '0';
    steering /= 10;
  }
  tx_ptr += 4;

  *tx_ptr = '#';
  tx_ptr ++;
  *tx_ptr = '\0';
}

void sendCommandCallback(const ArduinoCommand::ConstPtr& msg)
{
  ROS_INFO("[serial_module.cpp] Received command: mode: %d, speed: %d, steering: %d.", msg->mode, msg->speed, msg->steering);

  // stream command into Arduino
  unsigned char tx_buff[10];

  memset(tx_buff, 0, sizeof(tx_buff));

  serializeCommand(tx_buff, msg);

  int num = write(fd, tx_buff, 10);
  ROS_INFO("[serial_module.cpp] Sent command: %u", tx_buff);
  if (num < 0)
  {
    ROS_ERROR("[serial_module.cpp] Arduino write error.");
  }

  usleep(20000);

  tcflush(fd, TCOFLUSH);

  // // read current speed in cm/s and angular speed rad/s from Arduino
  // bzero(buffer, BUFF_SIZE);
  // num = read(fd, buffer, BUFF_SIZE-1);
  // if (num < 0)
  // {
  //   ROS_ERROR("[serial_module.cpp] Cannot read wheel encoder sensor measurements from Arduino.");
  // } else if (num > 0)
  // {
  //   parse_we_readings(buffer);
  // }
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "serial_module");
  ros::NodeHandle n;
  ros::NodeHandle np;
  ros::Subscriber sub = n.subscribe("command", 1, sendCommandCallback);
  ros::Rate loop_rate(50);
  pub_we = np.advertise<WheelEncoder>("we", 100);

  sleep(3);

  fd = open("/dev/arduino_uno", O_RDWR | O_NOCTTY);
  if (fd < 0)
  {
    ROS_ERROR("[serial_module.cpp] Arduino socket open error.");
  } else
  {
    ROS_INFO("[serial_module.cpp] Arduino opened with fd: %d.", fd);
  }

  // wait for Arduino reboot
  usleep(3500000);

  struct termios toptions;
  memset(&toptions, 0, sizeof(toptions));
  if(tcgetattr(fd, &toptions) != 0)
  {
    ROS_ERROR("[serial_module.cpp] Arduino socket tcgetattr error.");
    close(fd);
  }

  // set 9600 baud both ways
  cfmakeraw(&toptions);

  cfsetispeed(&toptions, B115200);
  cfsetospeed(&toptions, B115200);

  if(tcsetattr(fd, TCSANOW, &toptions) != 0)
  {
    ROS_ERROR("[serial_module.cpp] Arduino socket tcsetattr error.");
    close(fd);
  }

  sleep(2);

  tcflush(fd, TCIOFLUSH);

  while (ros::ok())
  {
    ros::spinOnce();
    loop_rate.sleep();
  }

  close(fd);

  return 0;
}
