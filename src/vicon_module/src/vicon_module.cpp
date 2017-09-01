extern "C" {
  #include <stdio.h>
  #include <stdlib.h>
  #include <unistd.h>
  #include <string.h>
  #include <sys/types.h>
  #include <sys/socket.h>
  #include <netinet/in.h>
  #include <netdb.h>
  #include <time.h>
  #include <pthread.h>
}

#include "ros/ros.h"
#include "vicon_module/Position.h"
#include "vicon_module/ViconData.h"

using namespace std;

// Vicon server info
const int PORT = 3000;
const string HOST = "192.168.0.2";
const int BUFF_SIZE = 256;

void parse_position(char* buffer, vicon_module::ViconData* vicon_data)
{
  vicon_module::Position pos;
  char temp[16];
  int index = 0;
  int obj_num = 0;

  while (true)
  {
    int j;

    bzero(temp, 16);
    j = 0;
    while (buffer[index] != ',')
    {
      temp[j++] = buffer[index++];
    }
    index ++;
    pos.x = atof(temp);

    bzero(temp, 16);
    j = 0;
    while (buffer[index] != ',')
    {
      temp[j++] = buffer[index++];
    }
    index ++;
    pos.y = atof(temp);

    bzero(temp, 16);
    j = 0;
    while (buffer[index] != ',')
    {
      temp[j++] = buffer[index++];
    }
    index ++;
    pos.speed = atof(temp);

    bzero(temp, 16);
    j = 0;
   while (buffer[index] != ',')
    {
      temp[j++] = buffer[index++];
    }
    index ++;
    pos.steering = atof(temp);

    bzero(temp, 16);
    j = 0;
    while (buffer[index] != '|')
    {
      temp[j++] = buffer[index++];
    }
    index ++;
    pos.theta = atof(temp);

    obj_num ++;
    vicon_data->positions.push_back(pos);

    if (!buffer[index])
      break;
  }

  vicon_data->obj_num = obj_num;
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "vicon_module");
  ros::NodeHandle n;
  ros::Publisher vicon_pub = n.advertise<vicon_module::ViconData>("vicon_data", 100);

  // Vicon client initialization
  struct hostent* server = gethostbyname(HOST.c_str());
  struct sockaddr_in serv_addr;
  int sockfd;
  char buffer[BUFF_SIZE];
  if (server == NULL)
  {
    ROS_ERROR("[vicon_module.cpp] Vicon server initialization error.");
  }
  sockfd = socket(AF_INET, SOCK_STREAM, 0);
  if (sockfd < 0)
  {
    ROS_ERROR("[vicon_module.cpp] Vicon server socket open error.");
  }
  bzero((char *)&serv_addr, sizeof(serv_addr));
  serv_addr.sin_family = AF_INET;
  serv_addr.sin_port = htons(PORT);
  bcopy((char *)server->h_addr, (char *)&serv_addr.sin_addr.s_addr, server->h_length);
  if (connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
  {
    ROS_ERROR("[vicon_module.cpp] Vicon server socket connection error.");
  } else
  {
    ROS_INFO("[vicon_module.cpp] Vicon connection successful.");
  }
  sleep(2);

  while (ros::ok())
  {
    vicon_module::ViconData msg;

    bzero(buffer, BUFF_SIZE);
    strcpy(buffer, "get_all");
    int num = write(sockfd, buffer, strlen(buffer));
    if (num < 0)
    {
      ROS_ERROR("[vicon_module.cpp] Vicon server write error.");
    }
    bzero(buffer, BUFF_SIZE);
    num = read(sockfd, buffer, BUFF_SIZE-1);
    if (num < 0)
    {
      ROS_ERROR("[vicon_module.cpp] Vicon server read error.");
    }

    parse_position(buffer, &msg);
    
    ROS_INFO("[vicon_module.cpp] Tracking %d objects.", msg.obj_num);
    for (int i = 0; i < msg.obj_num; i ++)
    {
      ROS_INFO("[vicon_module.cpp] %d: (%lf, %lf, %lf, %d, %d).", i, msg.positions[i].x, msg.positions[i].y, msg.positions[i].theta,msg.positions[i].speed,msg.positions[i].steering);
    }

    msg.header.stamp = ros::Time::now();
    msg.header.seq ++;
    msg.header.frame_id = "/world";
    vicon_pub.publish(msg);
  }

  close(sockfd);

  return 0;
}
