import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:home_cache/constants/colors.dart' show AppColors, primaryLight;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/doccument_slider.dart';
import 'package:home_cache/view/widget/past_appoinment_tile.dart';
import 'package:home_cache/view/widget/text_field_wigget.dart';

class AddAppliancesScreen extends StatefulWidget {
  const AddAppliancesScreen({super.key});

  @override
  State<AddAppliancesScreen> createState() => _ProviderDetailsScreenState();
}

class _ProviderDetailsScreenState extends State<AddAppliancesScreen> {
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
                      'Refrigerator',
                      style: TextStyles.bold.copyWith(color: AppColors.black),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 10.w),
                    Image.asset(
                      'assets/images/disk.png',
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
                'Type',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              TextFieldWigget(),
              SizedBox(height: 16.h),
              Text(
                'Location',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              TextFieldWigget(),
              SizedBox(height: 16.h),
              Text(
                'Notes',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              TextFieldWigget(),
              SizedBox(height: 16.h),
              if (isPastExpanded) ...[
                PastAppointmentsTile(date: "June 18, 2025", status: "AC Check"),
                PastAppointmentsTile(date: "May 05, 2025", status: "AC Check"),
              ],
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    'Documents',
                    style: TextStyles.semiBold.copyWith(color: AppColors.black),
                  ),
                  SizedBox(width: 6.w),
                  Container(
                    height: 24.h,
                    width: 24.h,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add, color: Colors.white, size: 18.sp),
                      onPressed: () {
                        Get.toNamed(AppRoutes.editAppliances);
                      },
                      padding: EdgeInsets.zero,
                      splashRadius: 20.r,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              DocumentSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
