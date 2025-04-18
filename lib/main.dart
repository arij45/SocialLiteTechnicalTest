import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:social_lite_technical_test/bindings/app_bindings.dart';
import 'package:social_lite_technical_test/controllers/auth_controller.dart';
import 'package:social_lite_technical_test/controllers/theme_controller.dart';
import 'package:social_lite_technical_test/models/message_model.dart';
import 'package:social_lite_technical_test/models/post_model.dart';
import 'package:social_lite_technical_test/models/user_model.dart';
import 'package:social_lite_technical_test/providers/auth_form_provider.dart';
import 'package:social_lite_technical_test/routes/app_pages.dart';
import 'package:social_lite_technical_test/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_lite_technical_test/styles/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>('users');
  Hive.registerAdapter(PostModelAdapter());
  await Hive.openBox<PostModel>('posts');
  Hive.registerAdapter(MessageModelAdapter());
  await Hive.openBox<MessageModel>('messages');
  await Hive.openBox('settings');
  final authController = Get.put(AuthController());
  final currentUser = authController.currentUser.value;
  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthFormProvider(user: currentUser),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return GetBuilder<ThemeController>(
          init: ThemeController(),
          builder: (themeController) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              initialBinding: AppBindings(),
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              themeMode:
                  themeController.isDarkMode.value
                      ? ThemeMode.dark
                      : ThemeMode.light,
              initialRoute: AppRoutes.loginScreen,
              getPages: AppPages.pages,
            );
          },
        );
      },
    );
  }
}
