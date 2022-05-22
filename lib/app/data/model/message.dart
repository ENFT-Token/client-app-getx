enum MessageType { text, audio, image, video }

class Message {
  late String? text;
  late List<String>? images;
  late MessageType messageType;
  late String time;
  late bool isSender;

  Message({text, images, messageType, time, isSender}) {
    this.text = text;
    this.images = images;
    this.messageType = messageType;
    this.time = time;
    this.isSender = isSender;
  }

  Map<String, dynamic> toJson() => {
        'text': text,
        'images': images,
        'messageType': messageType,
        'time': time,
        'isSender': isSender,
      };
}
