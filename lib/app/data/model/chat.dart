import 'dart:io';

class Chat {
  late File image;
  late String name, lastMessage, time;

  Chat({image, name, lastMessage, time}) {
    this.image = image;
    this.name = name;
    this.lastMessage = lastMessage;
    this.time = time;
  }
}
