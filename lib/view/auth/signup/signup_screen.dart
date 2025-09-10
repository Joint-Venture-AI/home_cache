import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/input_field.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBarBack(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40.h),
              Text(
                'Create A New Account',
                style: TextStyles.bold.copyWith(color: AppColors.secondary),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              Text(
                'Name',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              Row(
                children: [
                  Expanded(child: TextInputField(hintText: 'First')),
                  SizedBox(width: 16.w),
                  Expanded(child: TextInputField(hintText: 'Last')),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                'Email',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              TextInputField(hintText: 'example@example.com'),
              SizedBox(height: 20.h),
              Text(
                'Password',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              TextInputField(hintText: '*************'),
              SizedBox(height: 34.h),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyles.regular.copyWith(
                    color: AppColors.black,
                    fontSize: 14.sp,
                  ),
                  children: [
                    const TextSpan(text: 'By continuing, you agree to '),
                    TextSpan(
                      text: 'Terms of Use',
                      style: TextStyles.regular.copyWith(
                        color: AppColors.secondary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy.',
                      style: TextStyles.regular.copyWith(
                        color: AppColors.secondary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Column(
                  children: [
                    TextWidgetButton(
                      text: 'Sign Up',
                      onPressed: () {
                        Get.toNamed(AppRoutes.selectHouse);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.h),

              Text(
                'Or Sign Up with',
                style: TextStyles.semiBold.copyWith(
                  color: AppColors.black,
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset('assets/icons/google.svg', height: 47.h),
                  SvgPicture.asset('assets/icons/apple.svg', height: 47.h),
                  SvgPicture.asset('assets/icons/micro.svg', height: 47.h),
                  SvgPicture.asset('assets/icons/meta.svg', height: 47.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
