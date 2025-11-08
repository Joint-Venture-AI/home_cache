import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/config/route/routes.dart';
import 'package:home_cache/view/home/details/room/add_room_dialog.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';

import '../../../../config/route/route_names.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({super.key});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  int selectedIndex = -1;

  final List<Map<String, dynamic>> tiles = [
    {
      'title': 'Primary',
      'iconPath': 'assets/images/primary.png',
      'index': 0,
      'type': 'Living Room',
    },
    {
      'title': 'Kitchen',
      'iconPath': 'assets/images/kitchen.png',
      'index': 1,
      'type': 'Kitchen',
    },
    {
      'title': 'Bath 1',
      'iconPath': 'assets/images/bath.png',
      'index': 2,
      'type': 'Bathroom',
    },
    {
      'title': 'Dining',
      'iconPath': 'assets/images/dining.png',
      'index': 3,
      'type': 'Dining',
    },
    {
      'title': 'Bath 2',
      'iconPath': 'assets/images/bath.png',
      'index': 4,
      'type': 'Bathroom',
    },
    {
      'title': 'Living Room',
      'iconPath': 'assets/images/livingroom.png',
      'index': 5,
      'type': 'Living Room',
    },
  ];

  Widget _buildTile(
    BuildContext context,
    String title,
    String iconPath,
    int index,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        onTap();
      },
      child: Container(
        margin: EdgeInsets.all(8.w),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.lightgrey,
          border: Border.all(
            color: AppColors.lightgrey,
            width: selectedIndex == index ? 2.w : 1.w,
          ),
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withAlpha(60),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, height: 52.h, width: 52.w),
            SizedBox(height: 12.h),
            Text(
              title,
              style: AppTypoGraphy.medium.copyWith(
                color: AppColors.black,
                fontSize: 16.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(
        title: 'View By Room',
        titleColor: AppColors.secondary,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const AddRoomDialog(),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 6.h,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                '+ Add',
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.h,
                  crossAxisSpacing: 8.w,
                  childAspectRatio: 1,
                ),
                itemCount: tiles.length,
                itemBuilder: (context, index) {
                  return _buildTile(
                    context,
                    tiles[index]['title'],
                    tiles[index]['iconPath'],
                    tiles[index]['index'],
                    () {
                      Get.toNamed(
                        RouteNames.editRoomDetails,
                        arguments: {
                          'roomName': tiles[index]['title'],
                          'roomType': tiles[index]['type'], // matches Room.name
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
