import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/widget/input_field.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';
import 'package:home_cache/view/widget/text_button_widget_light.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 100.h),
              Text(
                'Welcome Back!',
                style: TextStyles.bold.copyWith(color: AppColors.secondary),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 60.h),
              Text(
                'Email or Mobile Number',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              TextInputField(
                hintText: '',
                prefixIcon: Icon(Icons.email, color: AppColors.lightgrey),
              ),
              SizedBox(height: 20.h),
              Text(
                'Password',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              TextInputField(
                hintText: '',
                prefixIcon: Icon(Icons.email, color: AppColors.lightgrey),
              ),
              SizedBox(height: 6.h),
              Text(
                'Forgot Password',
                style: TextStyles.semiBold.copyWith(
                  color: AppColors.secondary,
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 50.h),
              TextWidgetButton(text: 'Log In', onPressed: () {}),
              SizedBox(height: 15.h),
              TextButtonWidgetLight(text: 'Create Account', onPressed: () {}),
              SizedBox(height: 50.h),

              Text(
                'Or log in with',
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
