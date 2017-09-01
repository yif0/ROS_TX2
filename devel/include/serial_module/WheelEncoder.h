// Generated by gencpp from file serial_module/WheelEncoder.msg
// DO NOT EDIT!


#ifndef SERIAL_MODULE_MESSAGE_WHEELENCODER_H
#define SERIAL_MODULE_MESSAGE_WHEELENCODER_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace serial_module
{
template <class ContainerAllocator>
struct WheelEncoder_
{
  typedef WheelEncoder_<ContainerAllocator> Type;

  WheelEncoder_()
    : header()
    , we_speed(0.0)
    , we_aspeed(0.0)  {
    }
  WheelEncoder_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , we_speed(0.0)
    , we_aspeed(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef float _we_speed_type;
  _we_speed_type we_speed;

   typedef float _we_aspeed_type;
  _we_aspeed_type we_aspeed;




  typedef boost::shared_ptr< ::serial_module::WheelEncoder_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::serial_module::WheelEncoder_<ContainerAllocator> const> ConstPtr;

}; // struct WheelEncoder_

typedef ::serial_module::WheelEncoder_<std::allocator<void> > WheelEncoder;

typedef boost::shared_ptr< ::serial_module::WheelEncoder > WheelEncoderPtr;
typedef boost::shared_ptr< ::serial_module::WheelEncoder const> WheelEncoderConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::serial_module::WheelEncoder_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::serial_module::WheelEncoder_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace serial_module

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'serial_module': ['/home/nvidia/RosWorkspace/src/serial_module/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::serial_module::WheelEncoder_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::serial_module::WheelEncoder_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::serial_module::WheelEncoder_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::serial_module::WheelEncoder_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::serial_module::WheelEncoder_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::serial_module::WheelEncoder_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::serial_module::WheelEncoder_<ContainerAllocator> >
{
  static const char* value()
  {
    return "85e6a7e4dd9ef07d01bd4179c2a9b1be";
  }

  static const char* value(const ::serial_module::WheelEncoder_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x85e6a7e4dd9ef07dULL;
  static const uint64_t static_value2 = 0x01bd4179c2a9b1beULL;
};

template<class ContainerAllocator>
struct DataType< ::serial_module::WheelEncoder_<ContainerAllocator> >
{
  static const char* value()
  {
    return "serial_module/WheelEncoder";
  }

  static const char* value(const ::serial_module::WheelEncoder_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::serial_module::WheelEncoder_<ContainerAllocator> >
{
  static const char* value()
  {
    return "std_msgs/Header header\n\
float32 we_speed\n\
float32 we_aspeed\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
";
  }

  static const char* value(const ::serial_module::WheelEncoder_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::serial_module::WheelEncoder_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.we_speed);
      stream.next(m.we_aspeed);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct WheelEncoder_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::serial_module::WheelEncoder_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::serial_module::WheelEncoder_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "we_speed: ";
    Printer<float>::stream(s, indent + "  ", v.we_speed);
    s << indent << "we_aspeed: ";
    Printer<float>::stream(s, indent + "  ", v.we_aspeed);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SERIAL_MODULE_MESSAGE_WHEELENCODER_H
