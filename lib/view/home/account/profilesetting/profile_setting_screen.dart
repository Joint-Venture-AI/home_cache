import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/setting_tile.dart';

class ProfileSettingScreen extends StatelessWidget {
  const ProfileSettingScreen({super.key});

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
                'Profile Settings',
                style: TextStyles.bold.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 24.h),
              SettingsTile(
                leading: Image.asset(
                  "assets/images/subcription.png",
                  width: 24.w,
                ),
                title: 'Privacy Policy',
                onTap: () {
                  //Get.toNamed(AppRoutes.subscription);
                },
              ),
              SizedBox(height: 12.h),
              SettingsTile(
                leading: Image.asset("assets/images/terms.png", width: 24.w),
                title: 'Terms of Use',
                onTap: () {
                  //Get.toNamed(AppRoutes.subscription);
                },
              ),
              SizedBox(height: 12.h),
              SettingsTile(
                leading: Image.asset("assets/images/profile.png", width: 24.w),
                title: 'Edit Contact Information',
                onTap: () {
                  //Get.toNamed(AppRoutes.subscription);
                },
              ),
              SizedBox(height: 12.h),
              SettingsTile(
                leading: Image.asset("assets/images/pass.png", width: 24.w),
                title: 'Password Settings',
                onTap: () {
                  //Get.toNamed(AppRoutes.subscription);
                },
              ),
              SizedBox(height: 12.h),
              SettingsTile(
                leading: Image.asset("assets/images/Settings.png", width: 24.w),
                title: 'Delete Account',
                onTap: () {
                  //Get.toNamed(AppRoutes.subscription);
                },
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}
