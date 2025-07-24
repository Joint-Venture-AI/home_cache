import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';

class FirstDialog extends StatelessWidget {
  const FirstDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      title: Text(
        'Welcome To HomeCache!',
        style: TextStyles.bold.copyWith(
          color: AppColors.black,
          fontSize: 32.sp,
        ),
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        height: 350.h,
        width: double.maxFinite,
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Text(
              'Here’s how to get started',
              style: TextStyles.medium.copyWith(color: AppColors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 6.h),
            Text(
              'Select which options are relevant to you and your home and hit ‘Next’',
              style: TextStyles.regular.copyWith(color: AppColors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Image.asset(
              "assets/images/touch.png",
              height: 150.h,
              width: 150.w,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20.h),
            Text(
              'Select which options are relevant to you and your home and hit ‘Next’',
              style: TextStyles.regular.copyWith(color: AppColors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SizedBox(
            width: double.infinity,
            height: 48.h,
            child: TextWidgetButton(
              text: "→  Next",
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ],
    );
  }
}
