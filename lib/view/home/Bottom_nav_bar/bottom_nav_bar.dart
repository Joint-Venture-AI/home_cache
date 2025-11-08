import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/view/home/schedule/schedule_screen.dart';

import '../account/account_screen.dart';
import '../chat/screens/handy_chat_screen.dart';
import '../details/screens/details_screen.dart';
import '../home/screens/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<BottomNavBar> {
  int _selectedIndex = 1;

  final List<Widget> _screens = [
    const ScheduleScreen(),
    const HomeScreen(),
    const HandyChatScreen(),
    const DetailsScreen(),
    const AccountScreen(),
  ];

  final List<String> _labels = [
    'Schedule',
    'Home',
    'HandyChat',
    'Details',
    'Account',
  ];

  final List<String> _iconPaths = [
    'assets/icons/schedule.svg',
    'assets/icons/home.svg',
    'assets/icons/chat.svg',
    'assets/icons/details.svg',
    'assets/icons/account.svg',
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(top: true, bottom: false, child: _screens[_selectedIndex]),
      bottomNavigationBar: SafeArea(
        top: false,
        bottom: true,
        child: Container(
          height: 70.h,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey.shade300)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_labels.length, (index) {
              final isSelected = _selectedIndex == index;
              return GestureDetector(
                onTap: () => _onTap(index),
                behavior: HitTestBehavior.opaque,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _labels[index],
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected ? AppColors.primary : Colors.grey,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    SvgPicture.asset(
                      _iconPaths[index],
                      height: 30.h,
                      color: isSelected ? AppColors.primary : Colors.grey,
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
