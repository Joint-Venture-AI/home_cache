import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:home_cache/constants/colors.dart' show AppColors, lightgrey;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/notification_tile.dart'
    show NotificationTile;
import 'package:home_cache/view/widget/text_button_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> notifications = [
      NotificationTile(
        title: "Due: Roof Inspection",
        description:
            "Your last roof inspection was in 2022, regular inspections are recommended every year to catch potential issues early and protect your home.",
        onMarkDone: () {},
        onDismiss: () {},
        onTap: () {
          Get.toNamed(AppRoutes.notificationDetails);
        },
      ),
      SizedBox(height: 12.h),

      NotificationTile(
        title: "Due: Roof Inspection",
        description:
            "Your last roof inspection was in 2022, regular inspections are recommended every year to catch potential issues early and protect your home.",
        onMarkDone: () {},
        onDismiss: () {},
        onTap: () {},
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Filter',
                style: TextStyles.bold.copyWith(
                  color: AppColors.black,
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.end,
              ),

              Text(
                'Notifications',
                style: TextStyles.bold.copyWith(
                  color: AppColors.black,
                  fontSize: 24.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),

              if (notifications.isNotEmpty)
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: AppColors.lightgrey.withOpacity(.8),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(children: notifications),
                )
              else
                Center(
                  child: Text(
                    'No notifications',
                    style: TextStyles.regular.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.black.withOpacity(0.6),
                    ),
                  ),
                ),
              SizedBox(height: 12.h),
              Text(
                'Looking For Older Tasks?',
                style: TextStyles.bold.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Column(
                  children: [
                    TextWidgetButton(
                      text: 'View Home Wealth Dash',
                      onPressed: () {
                        // Get.toNamed(AppRoutes.selectHouse);
                      },
                    ),
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
