import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/home/notification/widgets/notification_app_bar.dart';
import 'package:home_cache/view/home/notification/widgets/notification_tile.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';
import '../../../../../config/route/route_names.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: NotificationAppBar(),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                  color: AppColors.lightgrey.withAlpha(122),
                  borderRadius: BorderRadius.circular(16.r)),
              child: ListView.separated(
                padding: EdgeInsets.only(bottom: 125.h),
                itemBuilder: (context, index) => NotificationTile(
                  title: "Due: Roof Inspection",
                  description:
                      "Your last roof inspection was in 2022. Regular inspections are recommended every year to catch potential issues early.",
                  onMarkDone: () {},
                  onDismiss: () {},
                  onTap: () {
                    Get.toNamed(RouteNames.notificationDetails);
                  },
                ),
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemCount: 3,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildNotificationFooterSection(),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationFooterSection() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h),
          Text(
            'Looking For Older Tasks?',
            style: TextStyles.bold.copyWith(
              color: AppColors.black,
              fontSize: 24.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: TextWidgetButton(
              text: 'View Home Health Dash',
              onPressed: () {
                Get.back();
              },
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
