import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;

class IconSearchBarWidget extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;

  const IconSearchBarWidget({
    super.key,
    this.hintText = 'Search...',
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        filled: true,
        fillColor: AppColors.white,
        prefixIcon: Padding(
          padding: EdgeInsets.all(12.w),
          child: SvgPicture.asset(
            'assets/icons/search.svg',
            width: 20.w,
            height: 20.h,
          ),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.all(12.w),
          child: SvgPicture.asset(
            'assets/icons/mic.svg',
            width: 20.w,
            height: 20.h,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 0.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.grey, width: 2.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.grey, width: 2.w),
        ),
      ),
    );
  }
}
