import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';

class ThirdDialog extends StatelessWidget {
  const ThirdDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      contentPadding: EdgeInsets.all(24.w),
      title: Text(
        "Welcome To HomeCache!",
        style: TextStyles.bold.copyWith(
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
              style: TextStyles.regular.copyWith(color: AppColors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.h),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/images/80.png",
                  height: 180.h,
                  width: 180.w,
                  fit: BoxFit.contain,
                ),
                Positioned(
                  top: 65.h,
                  child: Text(
                    " 80%",
                    style: TextStyle(
                      fontSize: 40.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actionsPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      actions: [
        SizedBox(
          width: double.infinity,
          height: 48.h,
          child: TextWidgetButton(
            text: "Get Started",
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ],
    );
  }
}
