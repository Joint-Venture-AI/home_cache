import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';

class SelectableTile extends StatelessWidget {
  final String title;
  final String imageAsset; // Renamed for clarity
  final bool isSelected;
  final VoidCallback onTap;

  const SelectableTile({
    super.key,
    required this.title,
    required this.imageAsset,
    required this.isSelected,
    required this.onTap,
    required String iconAsset,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120.w,
        height: 120.h,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: AppColors.lightgrey,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.lightgrey,
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageAsset, width: 36.w, height: 36.w),
            SizedBox(height: 8.h),
            Text(
              title,
              style: TextStyle(fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
