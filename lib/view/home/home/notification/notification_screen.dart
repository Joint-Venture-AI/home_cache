import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/notification_tile.dart'
    show NotificationTile;
import 'package:home_cache/view/widget/text_button_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Column(
        children: [
          // Fixed header like app bar
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 10.h,
              bottom: 10.h,
              left: 18.w,
              right: 18.w,
            ),
            color: AppColors.surface,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 24), // For centering the title
                Text(
                  'Notifications',
                  style: TextStyles.bold.copyWith(
                    color: AppColors.black,
                    fontSize: 20.sp,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Add filter functionality here
                  },
                  child: Text(
                    'Filter',
                    style: TextStyles.bold.copyWith(
                      color: AppColors.black,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Rest of the content with scrolling
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 0),
                  child: Column(
                    children: [
                      SizedBox(height: 12.h),
                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: AppColors.lightgrey.withOpacity(.8),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          children: [
                            NotificationTile(
                              title: "Due: Roof Inspection",
                              description:
                                  "Your last roof inspection was in 2022, regular inspections are recommended every year to catch potential issues early.",
                              onMarkDone: () {},
                              onDismiss: () {},
                              onTap: () {
                                Get.toNamed(AppRoutes.notificationDetails);
                              },
                            ),
                            SizedBox(height: 12.h),
                            NotificationTile(
                              title: "Overdue: Change Your Air Filters",
                              description:
                                  "It's been 6 months since you last changed your air filters. For optimal performance, filters should be replaced every 3 months.",
                              onMarkDone: () {},
                              onDismiss: () {},
                              onTap: () {
                                Get.toNamed(AppRoutes.notificationDetails);
                              },
                            ),
                            SizedBox(height: 12.h),
                            NotificationTile(
                              title: "Due: HVAC Maintenance",
                              description:
                                  "Annual HVAC system checkup is due next month to ensure efficient operation.",
                              onMarkDone: () {},
                              onDismiss: () {},
                              onTap: () {
                                Get.toNamed(AppRoutes.notificationDetails);
                              },
                            ),
                          ],
                        ),
                      ),
                      // Add extra space at the bottom for the fixed button
                      SizedBox(height: 100.h),
                    ],
                  ),
                ),

                // Fixed bottom section
                Positioned(
                  bottom: 0.h,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        Text(
                          'Looking For Older Tasks?',
                          style: TextStyles.bold
                              .copyWith(color: AppColors.black, fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50.w),
                          child: Column(
                            children: [
                              TextWidgetButton(
                                text: 'View Home Health Dash',
                                onPressed: () {
                                  // Get.offAll(HomeScreen());
                                  Navigator.pop(context);
                                },
                              ),
                              SizedBox(height: 20.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
