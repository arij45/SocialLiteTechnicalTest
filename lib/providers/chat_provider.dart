import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  final TextEditingController messageController = TextEditingController();

  String get message => messageController.text;

  void clearMessage() {
    messageController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}
