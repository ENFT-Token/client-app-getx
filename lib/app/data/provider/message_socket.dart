import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MessageSocketClient {
  late final IO.Socket socket;
  late final void Function(Map<String, dynamic>) receiveCallback;
  late final roomId;

  MessageSocketClient() {}

  void initSocket(String roomId) {
    this.roomId = roomId;
    // {transports: [websocket], path: /chat/socket.io, forceNew: true, autoConnect: false}
    socket = IO.io(
        (dotenv.env['SERVER_ADDRESS']! + ":8080"),
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .setPath('/chat/socket.io') // for Flutter or Dart VM
            .enableForceNew()
            .disableAutoConnect()
            .build() // disable auto-connection
        );

    // connect event
    socket.onConnect((_) {
      socket.emit('createRoom', roomId);
      socket.emit('join', roomId);
      print(socket.id);
      print('connect');
    });
    socket.onDisconnect((_) {
      socket.emit('leave', roomId);
      print('disconnect');
    });

    // message event
    socket.on('textMessage', (data) {
      print(data);
      data['type'] = "text";
      receiveMessage(data);
    });
    socket.on('imageMessage', (data) {
      print(data);
      data['type'] = "imgae";
      receiveMessage(data);
    });
  }

  sendTextMessage(String roomId, String nickname, String text) =>
      socket.emit("textMessage", {
        {"roomId": roomId, "userName": nickname, "msg": text}
      });

  sendImageMessage(String roomId, String nickname, List<String>? images) =>
      socket.emit("imageMessage", {
        {
          "roomId": roomId,
          "username": nickname,
          "images": images,
        }
      });

  receiveMessage(var data) => receiveCallback(data);
}

const List EVENTS = [
  'connect',
  'connect_error',
  'connect_timeout',
  'connecting',
  'disconnect',
  'error',
  'reconnect',
  'reconnect_attempt',
  'reconnect_failed',
  'reconnect_error',
  'reconnecting',
  'ping',
  'pong'
];
