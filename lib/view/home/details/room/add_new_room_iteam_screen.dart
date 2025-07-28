import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart' show AppColors, primaryLight;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';

import 'package:home_cache/view/widget/text_field_widget.dart';

class AddNewRoomIteamScreen extends StatefulWidget {
  const AddNewRoomIteamScreen({super.key});

  @override
  State<AddNewRoomIteamScreen> createState() => _ProviderDetailsScreenState();
}

class _ProviderDetailsScreenState extends State<AddNewRoomIteamScreen> {
  bool isPastExpanded = false;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Paint',
                      style: TextStyles.bold.copyWith(color: AppColors.black),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 10.w),
                    Image.asset(
                      'assets/images/trash.png',
                      height: 24.h,
                      color: AppColors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Center(
                child: Container(
                  height: 120.h,
                  width: 120.w,
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/camera.png',
                        height: 32.h,
                        width: 32.w,
                        color: AppColors.black,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Take A Photo To Upload Image',
                        textAlign: TextAlign.center,
                        style: TextStyles.regular.copyWith(
                          color: AppColors.black,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                'Brand',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              TextFieldWidget(),
              SizedBox(height: 16.h),
              Text(
                'Brand Line',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              TextFieldWidget(),
              SizedBox(height: 16.h),
              Text(
                'Type',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              TextFieldWidget(),
              SizedBox(height: 16.h),
              Text(
                'Color',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              TextFieldWidget(),
              SizedBox(height: 16.h),
              Text(
                'Finish',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              TextFieldWidget(),
              SizedBox(height: 16.h),
              Text(
                'Room',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              TextFieldWidget(),
              SizedBox(height: 16.h),
              Text(
                'Location',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              TextFieldWidget(),
              SizedBox(height: 16.h),
              Text(
                'Last Painted',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              TextFieldWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
