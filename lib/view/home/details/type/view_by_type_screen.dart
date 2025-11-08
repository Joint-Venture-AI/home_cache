import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/config/route/routes.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';

import '../../../../config/route/route_names.dart';

class ViewByTypeScreen extends StatefulWidget {
  const ViewByTypeScreen({super.key});

  @override
  State<ViewByTypeScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<ViewByTypeScreen> {
  int selectedIndex = -1;

  // List of tile data
  final List<Map<String, dynamic>> tiles = [
    {
      'title': 'Appliances',
      'iconPath': 'assets/images/appliances.png',
      'index': 0,
    },
    {'title': 'Utility', 'iconPath': 'assets/images/utility.png', 'index': 1},
    {'title': 'Paint', 'iconPath': 'assets/images/paint.png', 'index': 2},
    {
      'title': 'Materials',
      'iconPath': 'assets/images/materials.png',
      'index': 3,
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
              Text(
                'View By Type',
                style: TextStyles.bold.copyWith(color: AppColors.secondary),
                textAlign: TextAlign.center,
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
                        Get.toNamed(RouteNames.appliances);
                      };
                      break;
                    case 1:
                      onTap = () {
                        Get.toNamed(RouteNames.utility);
                      };
                      break;
                    case 2:
                      onTap = () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Coming Soon")),
                        );
                      };
                      break;
                    case 3:
                    default:
                      onTap = () {
                        Get.toNamed(RouteNames.material);
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
