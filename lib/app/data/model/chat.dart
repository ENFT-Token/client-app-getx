import 'dart:io';

class Chat {
  late File image;
  late String name, lastMessage, time, roomId;
  late DateTime timeStamp;

  Chat({image, name, lastMessage, time, roomId, timeStamp}) {
    this.image = image;
    this.name = name;
    this.lastMessage = lastMessage;
    this.time = time;
    this.roomId = roomId;
    this.timeStamp = timeStamp;
  }
}
