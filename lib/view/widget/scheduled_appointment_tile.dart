import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/app_typo_graphy.dart';

class ScheduledAppointmentTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const ScheduledAppointmentTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.w),
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/clock.png', width: 40.w, height: 40.h),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypoGraphy.bold.copyWith(
                  color: AppColors.black,
                  fontSize: 16.sp,
                ),
              ),
              // SizedBox(height: 2.h),
              Text(
                subtitle,
                style: AppTypoGraphy.regular.copyWith(
                  color: AppColors.black,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
