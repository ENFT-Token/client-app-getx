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
//
// List demeChatMessages = [
//   ChatMessage(text: "안녕하세요", messageType: ChatMessageType.text, messageStatus: MessageStatus.viewed, time: "오후 12:00", isSender: false),
//   ChatMessage(text: "", messageType: ChatMessageType.audio, messageStatus: MessageStatus.viewed, time: "오후 12:00", isSender: false),
//   ChatMessage(text: "", messageType: ChatMessageType.video, messageStatus: MessageStatus.viewed, time: "오후 12:00", isSender: true),
//   ChatMessage(text: "문제가 발생했습니다", messageType: ChatMessageType.text, messageStatus: MessageStatus.not_sent, time: "오후 12:00",isSender: true),
//   ChatMessage(text: "잘 지내세요?", messageType: ChatMessageType.text, messageStatus: MessageStatus.viewed, time: "오후 12:00",isSender: false),
//   ChatMessage(text: "네", messageType: ChatMessageType.text, messageStatus: MessageStatus.viewed, time: "오후 12:00",isSender: true),
// ];
