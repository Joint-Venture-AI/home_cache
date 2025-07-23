import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/view/auth/widget/text_button_widget.dart';
import 'package:home_cache/view/auth/widget/text_button_widget_light.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 100.h),
            Image.asset('assets/logos/logo.png', height: 197.h),
            SizedBox(height: 32.h),
            Image.asset('assets/logos/tagline.png', height: 50.h),
            SizedBox(height: 48.h),

            TextButtonWidgetLight(text: 'Sign Up', onPressed: () {}),
            SizedBox(height: 16.h),
            TextWidgetButton(text: 'Log In', onPressed: () {}),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
