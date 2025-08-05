import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart'
    show AppColors, black, primary;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/assigned_person_tile.dart';
import 'package:home_cache/view/widget/provider_list_tile.dart';

class NotificationDetailsScreen extends StatefulWidget {
  const NotificationDetailsScreen({super.key});

  @override
  State<NotificationDetailsScreen> createState() =>
      _NotificationDetailsScreenState();
}

class _NotificationDetailsScreenState extends State<NotificationDetailsScreen> {
  bool _isNameVisible = false;
  bool _isNotificationSettingsVisible = false;

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
                'Change Your Air Filters',
                style: TextStyles.bold.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),

              // ... other UI widgets unchanged (Schedule, Link Meeting, etc.) ...
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Schedule',
                    style: TextStyles.bold.copyWith(color: AppColors.black),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    height: 40.h,
                    width: 40.h,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.check, color: Colors.white, size: 20.sp),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Text(
                'No schedule currently linked.',
                style: TextStyles.regular.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 128.w,
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: AppColors.lightgrey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/link.png',
                            height: 48.h,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            'Link Meeting',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black.withOpacity(.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.calendar);
                    },
                    child: Container(
                      width: 128.w,
                      padding: EdgeInsets.all(20.sp),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/calender.png',
                            height: 48.h,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            'Schedule Now',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black.withOpacity(.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 48.h),
              Text(
                'Schedule',
                style: TextStyles.bold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 12.h),
              Text(
                'Last Service On',
                style: TextStyles.regular.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 8.h),
              Text(
                'Jan. 1, 2023',
                style: TextStyles.regular.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 20.h),
              Text(
                'Last Service By',
                style: TextStyles.regular.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              ProviderListTile(
                providerName: 'HVAC Pros',
                lastUsedDate: 'Used on Jul 15, 2025',
                rating: 2,
                isFavorite: false,
                onTap: () {
                  Get.toNamed(AppRoutes.providerDetails);
                },
              ),
              SizedBox(height: 12.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/profile2.png',
                        color: AppColors.black,
                        width: 20.sp,
                        height: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Assigned To',
                        style: TextStyles.regular.copyWith(
                          color: AppColors.black,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isNameVisible = !_isNameVisible;
                      });
                    },
                    child: Icon(
                      _isNameVisible
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                      color: AppColors.primary,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.grey, thickness: 1.0),
              if (_isNameVisible)
                Padding(
                  padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
                  child: Column(
                    children: [
                      AssignedPersonTile(
                        name: 'Vanessa Alvarez',
                        role: 'House Resident',
                        onEdit: () {},
                      ),
                      AssignedPersonTile(
                        name: 'Jess Soyak',
                        role: 'House Owner',
                        onEdit: () {},
                      ),
                      AssignedPersonTile(
                        name: 'Ahsan Bari',
                        role: 'House Resident',
                        onEdit: () {},
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 48.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.notifications,
                        color: AppColors.black,
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Notification Settings',
                        style: TextStyles.regular.copyWith(
                          color: AppColors.black,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isNotificationSettingsVisible =
                            !_isNotificationSettingsVisible;
                      });
                    },
                    child: Icon(
                      _isNotificationSettingsVisible
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                      color: AppColors.primary,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.grey, thickness: 1.0),
              if (_isNotificationSettingsVisible)
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //settings
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
