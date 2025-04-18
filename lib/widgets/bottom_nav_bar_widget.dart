import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_lite_technical_test/styles/colors/app_colors.dart';
import 'package:social_lite_technical_test/views/chat_screen.dart';
import 'package:social_lite_technical_test/views/home_screen.dart';
import 'package:social_lite_technical_test/views/profile_settings_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, required int initialIndex});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const ChatScreen(),
    const ProfileSettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        height: 66.h,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5.r,
              blurRadius: 7.r,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: const Color(0xFF474B51),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
            fontSize: 12.sp,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12.sp,
          ),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 23.sp,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_bubble_outline,
                size: 23.sp,
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
                size: 23.sp,
              ),
              label: 'More',
            ),
          ],
        ),
      ),
    );
  }
}