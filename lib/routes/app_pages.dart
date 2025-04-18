import 'package:social_lite_technical_test/bindings/app_bindings.dart';
import 'package:social_lite_technical_test/routes/app_routes.dart';
import 'package:social_lite_technical_test/views/auth/login_screen.dart';
import 'package:social_lite_technical_test/views/auth/sign_up_screen.dart';
import 'package:get/get.dart';
import 'package:social_lite_technical_test/views/chat_screen.dart';
import 'package:social_lite_technical_test/views/home_screen.dart';
import 'package:social_lite_technical_test/views/profile_settings_screen.dart';
import 'package:social_lite_technical_test/views/update_profile_screen.dart';
import 'package:social_lite_technical_test/widgets/bottom_nav_bar_widget.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => LoginScreen(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.signupScreen,
      page: () => SignUpScreen(),
      binding: AppBindings(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => HomeScreen(),
      binding: AppBindings(),
    ),

    GetPage(name: AppRoutes.chatScreen, 
    page: () => ChatScreen(), 
    binding: AppBindings(),),

    GetPage(name: AppRoutes.profileSettingsScreen, 
    page: () => ProfileSettingsScreen(), 
    binding: AppBindings(),),

    GetPage(name: AppRoutes.updateProfileScreen, 
    page: () => UpdateProfileScreen(), 
    binding: AppBindings(),),

    GetPage(
     name: AppRoutes.bottomNavBar,
      page: () => BottomNavBar(initialIndex: 0),
      binding: AppBindings(),
    ),

    GetPage(
      name: AppRoutes.bottomNavBar,
      page: () => BottomNavBar(initialIndex: 1),
      binding: AppBindings(),
    ),

    GetPage(
      name: AppRoutes.bottomNavBar,
      page: () => BottomNavBar(initialIndex: 2),
      binding: AppBindings(),
    ),
  ];
}
