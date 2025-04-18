import 'package:get/get.dart';
import 'package:social_lite_technical_test/controllers/auth_controller.dart';
import 'package:social_lite_technical_test/controllers/chat_controller.dart';
import 'package:social_lite_technical_test/controllers/post_controller.dart';
import 'package:social_lite_technical_test/controllers/theme_controller.dart';
import 'package:social_lite_technical_test/services/chat_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ChatService>(ChatService());
    Get.put<AuthController>(AuthController());
    Get.put<PostController>(PostController());
    Get.put<ChatController>(ChatController());
    Get.put<ThemeController>(ThemeController());
  }
}
