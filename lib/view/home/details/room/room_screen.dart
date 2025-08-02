import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/home/details/room/add_room_dialog.dart';

import 'package:home_cache/view/widget/appbar_back_widget.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({super.key});

  @override
  State<RoomScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<RoomScreen> {
  int selectedIndex = -1;

  final List<Map<String, dynamic>> tiles = [
    {'title': 'Primary', 'iconPath': 'assets/images/primary.png', 'index': 0},
    {'title': 'Kithchen', 'iconPath': 'assets/images/kitchen.png', 'index': 1},
    {'title': 'Bath 1', 'iconPath': 'assets/images/bath.png', 'index': 2},
    {'title': 'Dining', 'iconPath': 'assets/images/dining.png', 'index': 3},
    {'title': 'Bath 2', 'iconPath': 'assets/images/bath.png', 'index': 4},
    {
      'title': 'Living Room',
      'iconPath': 'assets/images/livingroom.png',
      'index': 5,
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
            color: selectedIndex == index
                ? AppColors.lightgrey
                : AppColors.lightgrey,
            width: selectedIndex == index ? 2.w : 1.w,
          ),
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, height: 52.h, width: 52.w),
            SizedBox(height: 12.h),
            Text(
              title,
              style: TextStyles.medium.copyWith(
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
      appBar: AppBarBack(),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 40.w),
                  Text(
                    'View By Room',
                    style: TextStyles.bold.copyWith(color: AppColors.secondary),
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
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
                ],
              ),
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
                  VoidCallback onTap;

                  switch (index) {
                    case 0:
                      onTap = () {
                        Get.toNamed(AppRoutes.editRoomDetails);
                      };
                      break;
                    case 1:
                      onTap = () {
                        Get.toNamed(AppRoutes.editRoomDetails);
                      };
                      break;
                    case 2:
                      onTap = () {
                        Get.toNamed(AppRoutes.editRoomDetails);
                      };
                      break;
                    case 3:
                    default:
                      onTap = () {
                        Get.toNamed(AppRoutes.editRoomDetails);
                      };
                      break;
                  }

                  return _buildTile(
                    context,
                    tiles[index]['title'],
                    tiles[index]['iconPath'],
                    tiles[index]['index'],
                    onTap,
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
