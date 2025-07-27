import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';

class DocumentTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final String iconPath;
  final VoidCallback onTap;

  const DocumentTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: AppColors.lightgrey,
          border: Border.all(color: AppColors.lightgrey, width: 1.w),
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              iconPath,
              height: 72.h,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 6.h),
            Text(
              title,
              style: TextStyles.medium.copyWith(
                color: AppColors.black,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: AppColors.black.withOpacity(0.7),
                fontSize: 12.sp,
              ),
              textAlign: TextAlign.center,
            ),

            Text(
              date,
              style: TextStyle(
                fontSize: 10.sp,
                color: AppColors.black.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
