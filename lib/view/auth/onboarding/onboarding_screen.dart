import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/view/auth/signup/widgets/custom_elevated_button.dart';
import 'package:home_cache/view/widget/text_button_widget_light.dart';

import '../../../config/route/route_names.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 1.sh),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/logos/logo.png', height: 200.h),
                  SizedBox(height: 32.h),
                  Image.asset('assets/logos/tagline.png', height: 50.h),
                  SizedBox(height: 48.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Column(
                      children: [
                        TextButtonWidgetLight(
                          text: 'Sign Up',
                          onPressed: () => Get.toNamed(RouteNames.signup),
                          width: 208.w,
                        ),
                        SizedBox(height: 15.h),
                        CustomElevatedButton(
                            onTap: () => Get.toNamed(RouteNames.login),
                            width: 208.w,
                            btnText: 'Log In'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
