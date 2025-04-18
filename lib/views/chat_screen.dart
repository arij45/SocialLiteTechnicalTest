import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:social_lite_technical_test/controllers/auth_controller.dart';
import 'package:social_lite_technical_test/controllers/chat_controller.dart';
import 'package:social_lite_technical_test/providers/chat_provider.dart';
import 'package:social_lite_technical_test/styles/colors/app_colors.dart';
import 'package:social_lite_technical_test/styles/fonts/font_styles.dart';
import 'package:social_lite_technical_test/widgets/app_bar_widget.dart';
import '../controllers/chat_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chatController = Get.find<ChatController>();
    final authController = Get.find<AuthController>();
    final currentUser = authController.currentUser.value;
    return ChangeNotifierProvider(
      create: (_) => ChatProvider(),
      child: Scaffold(
        appBar: AppBarWidget(title: "Hey there, Socialite!"),
        body: Consumer<ChatProvider>(
          builder: (context, provider, _) {
            return Column(
              children: [
                Expanded(
                  child: Obx(() {
                    return ListView.builder(
                      itemCount: chatController.messages.length,
                      itemBuilder: (context, index) {
                        final message = chatController.messages[index];
                        return ListTile(
                          title: Text(
                            message.sender,
                            style: TextStyles.font14BlackMedium,
                          ),
                          subtitle: Text(message.text),
                          leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: FileImage(File(message.profileImage))),
                          trailing: Text(
                            DateFormat.Hm().format(message.timestamp),
                          ),
                        );
                      },
                    );
                  }),
                ),
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: provider.messageController,
                          cursorWidth: 2.w,
                          cursorHeight: 22.h,
                          cursorColor: Colors.black26,
                          decoration: InputDecoration(
                            hintText: 'Type a message',
                            filled: true,
                            fillColor: AppColors.borderColor,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send, color: AppColors.primaryColor),
                        onPressed: () {
                          final text = provider.message;

                          if (text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Please enter a message")),
                            );
                            return;
                          }

                          final currentUser = authController.currentUser.value;

                          if (currentUser == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("You must be logged in")),
                            );
                            return;
                          }

                          chatController.sendMessage(
                            text,
                            currentUser.username,
                            currentUser.imageUrl ?? '',
                            DateTime.now(),
                          );
                          provider.clearMessage();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
