import 'package:get/get.dart';
import 'package:social_lite_technical_test/models/message_model.dart';
import 'package:social_lite_technical_test/models/user_model.dart';
import 'package:social_lite_technical_test/services/chat_service.dart';
import 'package:hive/hive.dart';

class ChatController extends GetxController {
  final ChatService chatService = Get.find<ChatService>();
  final RxList<MessageModel> messages = <MessageModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMessages();
    messages.addAll(chatService.messageBox.values.toList());
    chatService.connectToWebSocket();
  }

  void loadMessages() {
    final box = Hive.box<MessageModel>('messages');
    messages.value = box.values.toList();
  }

  void sendMessage(
    String text,
    String user,
    String profileImage,
    DateTime time,
  ) {
    chatService.sendMessage(text, user, profileImage, time);
    messages.add(
      MessageModel(
        profileImage: profileImage,
        sender: user,
        text: text,
        timestamp: time,
      ),
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}
