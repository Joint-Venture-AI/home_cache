import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart'
    show AppColors, primary, secondary;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/widget/setting_tile.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

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
              Text(
                'Account Management',
                style: TextStyles.bold.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.all(12.0.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0).r,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/dot.png',
                      height: 20.h,

                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sophie T',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '2972 Westminster Rd.',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Los Angeles, California, 90089',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: AppColors.primary),
              SizedBox(height: 12.h),
              SettingsTile(
                leading: Image.asset(
                  "assets/images/subcription.png",
                  width: 24.w,
                ),
                title: 'Subscription',
                onTap: () {},
              ),
              SizedBox(height: 12.h),
              SettingsTile(
                leading: Image.asset("assets/images/bell.png", width: 24.w),
                title: 'Profile Settings',
                onTap: () {},
              ),
              SizedBox(height: 12.h),
              SettingsTile(
                leading: Image.asset("assets/images/lock.png", width: 24.w),
                title: 'Product Support',
                onTap: () {},
              ),
              SizedBox(height: 12.h),
              SettingsTile(
                leading: Image.asset("assets/images/group.png", width: 24.w),
                title: 'Household Management',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
