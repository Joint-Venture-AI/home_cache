import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/app_typo_graphy.dart';

import 'widgets/custom_chart_indicator.dart';

class HomeProgressDialog extends StatelessWidget {
  const HomeProgressDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      contentPadding: EdgeInsets.all(24.w),
      title: Text(
        "Welcome To HomeCache!",
        style: AppTypoGraphy.bold.copyWith(
          color: AppColors.black,
          fontSize: 28.sp,
        ),
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        height: 350.h,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Build up your home health rating by adding details and staying up to date on maintenance ',
              style: AppTypoGraphy.regular.copyWith(color: AppColors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.h),
            CustomChartIndicator(),
          ],
        ),
      ),
      actions: [
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 12.r),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp),
                )),
          ),
        ),
      ],
    );
  }
}
