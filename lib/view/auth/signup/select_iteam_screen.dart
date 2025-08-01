import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/icon_search_bar_widget.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';

class SelectIteamScreen extends StatelessWidget {
  const SelectIteamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Item',
                style: TextStyles.bold.copyWith(
                  color: AppColors.black,
                  fontSize: 26.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              Image.asset("assets/images/item.png", height: 90.h),
              SizedBox(height: 32.h),

              IconSearchBarWidget(onChanged: (value) {}),
              SizedBox(height: 340.h),
              Row(
                children: [
                  SizedBox(width: 180.w),
                  Expanded(
                    child: TextWidgetButton(
                      text: '✓  Complete  ',
                      onPressed: () {
                        Get.toNamed(AppRoutes.addDetailsIteam);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
