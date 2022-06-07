import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../controller/user.dart';

class MessageSocketClient {
  late final IO.Socket socket;
  late final void Function(Map<String, dynamic>) receiveCallback;

  static final MessageSocketClient _instance = MessageSocketClient._internal();

  factory MessageSocketClient() => _instance;

  MessageSocketClient._internal() {
    initSocket();
    print("KlipApiClient was created");
  }

  void initSocket() {
    // {transports: [websocket], path: /chat/socket.io, forceNew: true, autoConnect: false}
    socket = IO.io(
        (dotenv.env['SERVER_ADDRESS']! + ":8080"),
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .setPath('/chat/socket.io') // for Flutter or Dart VM
            .enableForceNew()
            .disableAutoConnect()
            .setQuery({'nickname': UserController.to.user.nickname})
            .build() // disable auto-connection
        );

    // connect event
    socket.onConnect((_) {
      print(socket.id);
      print('connect');
    });
    socket.onDisconnect((_) {
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

  joinChatRoom(String roomId) {
    socket.emit('createRoom', roomId);
    socket.emit('join', roomId);
  }

  leaveChatRoom(String roomId) => socket.emit('leave', roomId);

  sendTextMessage(
          String profilePath, String roomId, String nickname, String text) =>
      socket.emit("textMessage", {
        {
          "profilePath": profilePath,
          "roomId": roomId,
          "userName": nickname,
          "msg": text
        }
      });

  sendImageMessage(String profilePath, String roomId, String nickname,
          List<String>? images) =>
      socket.emit("imageMessage", {
        {
          "profilePath": profilePath,
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
