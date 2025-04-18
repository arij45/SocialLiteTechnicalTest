import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:social_lite_technical_test/controllers/chat_controller.dart';
import 'package:social_lite_technical_test/models/message_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class ChatService extends GetxService {
  late WebSocketChannel channel;
  final Box<MessageModel> messageBox = Hive.box<MessageModel>('messages');

  void connectToWebSocket() {
    channel = WebSocketChannel.connect(
      Uri.parse('wss://echo.websocket.events'),
    );

    channel.stream.listen(
      (data) {
        final receivedMessage = MessageModel(
          sender: 'User',
          text: "hello ",
          timestamp: DateTime.now(),
          profileImage: 'assets/images/profile.png',
        );
        messageBox.add(receivedMessage);
        Get.find<ChatController>().loadMessages();
      },
      onError: (error) {
        print('WebSocket error: $error');
      },
      onDone: () {
        print('WebSocket connection closed');
      },
    );

    print('WebSocket connected');
  }

  void sendMessage(
    String text,
    String user,
    String profileImage,
    DateTime time,
  ) {
    try {
      final message = MessageModel(
        profileImage: profileImage,
        sender: user,
        text: text,
        timestamp: time,
      );
      messageBox.add(message);
      Get.find<ChatController>().loadMessages();

      channel.sink.add(text);
    } catch (error) {
      print('Error sending message: $error');
    }
  }

  @override
  void onClose() {
    channel.sink.close(status.goingAway);
    super.onClose();
  }
}
