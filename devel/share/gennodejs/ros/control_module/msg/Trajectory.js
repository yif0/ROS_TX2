// Auto-generated. Do not edit!

// (in-package control_module.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let CheckPoint = require('./CheckPoint.js');

//-----------------------------------------------------------

class Trajectory {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.num_chkpnt = null;
      this.path = null;
    }
    else {
      if (initObj.hasOwnProperty('num_chkpnt')) {
        this.num_chkpnt = initObj.num_chkpnt
      }
      else {
        this.num_chkpnt = 0;
      }
      if (initObj.hasOwnProperty('path')) {
        this.path = initObj.path
      }
      else {
        this.path = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Trajectory
    // Serialize message field [num_chkpnt]
    bufferOffset = _serializer.int32(obj.num_chkpnt, buffer, bufferOffset);
    // Serialize message field [path]
    // Serialize the length for message field [path]
    bufferOffset = _serializer.uint32(obj.path.length, buffer, bufferOffset);
    obj.path.forEach((val) => {
      bufferOffset = CheckPoint.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Trajectory
    let len;
    let data = new Trajectory(null);
    // Deserialize message field [num_chkpnt]
    data.num_chkpnt = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [path]
    // Deserialize array length for message field [path]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.path = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.path[i] = CheckPoint.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.path.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'control_module/Trajectory';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0496593fe4ee00171e01b9b76a8b46bc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 num_chkpnt
    CheckPoint[] path
    
    
    ================================================================================
    MSG: control_module/CheckPoint
    float32 x
    float32 y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Trajectory(null);
    if (msg.num_chkpnt !== undefined) {
      resolved.num_chkpnt = msg.num_chkpnt;
    }
    else {
      resolved.num_chkpnt = 0
    }

    if (msg.path !== undefined) {
      resolved.path = new Array(msg.path.length);
      for (let i = 0; i < resolved.path.length; ++i) {
        resolved.path[i] = CheckPoint.Resolve(msg.path[i]);
      }
    }
    else {
      resolved.path = []
    }

    return resolved;
    }
};

module.exports = Trajectory;
