import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';

class TileButton extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const TileButton({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120.w,
        height: 120.h,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.lightgrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 48.h, fit: BoxFit.contain),
            SizedBox(height: 8.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
