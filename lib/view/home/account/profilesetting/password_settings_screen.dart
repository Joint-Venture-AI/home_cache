import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/input_field.dart';

class PasswordSettingsScreen extends StatelessWidget {
  const PasswordSettingsScreen({super.key});

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
                'Password Settings',
                style: TextStyles.bold.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              Text(
                'Password',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              TextInputField(hintText: '*************'),
              SizedBox(height: 48.h),
              Text(
                'New Password',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),

              SizedBox(height: 6.h),
              TextInputField(hintText: 'New Password'),
              SizedBox(height: 12.h),
              TextInputField(hintText: 'Retype Password'),

              Padding(
                padding: EdgeInsetsGeometry.all(20.w),
                child: Text(
                  'Your password must be at least 8 characters, include a number, an uppercase letter, a lowercase letter, and a special character. ',
                  style: TextStyles.regular.copyWith(
                    color: AppColors.black,
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
