import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';

class PaymentSelectorWidget extends StatelessWidget {
  final String logoPath;
  final String title;
  final bool isSelected;
  final VoidCallback? onTap;

  const PaymentSelectorWidget({
    super.key,
    required this.logoPath,
    required this.title,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.grey.shade400,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Image.asset(logoPath, width: 32.w, height: 32.w),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 16.sp, color: Colors.black),
              ),
            ),
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
                color: isSelected ? AppColors.primary : Colors.transparent,
              ),
              child: isSelected
                  ? Icon(Icons.check, size: 14.sp, color: Colors.white)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
