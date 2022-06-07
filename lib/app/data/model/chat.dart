import 'dart:io';

class Chat {
  late File image;
  late String name, lastMessage, time, roomId;

  Chat({image, name, lastMessage, time, roomId}) {
    this.image = image;
    this.name = name;
    this.lastMessage = lastMessage;
    this.time = time;
    this.roomId = roomId;
  }
}
