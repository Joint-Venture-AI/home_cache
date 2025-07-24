import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 2.h),
      color: AppColors.surface,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hi Jess,',
                style: TextStyles.medium.copyWith(
                  color: AppColors.black,
                  fontSize: 24.sp,
                ),
              ),

              Text(
                'Welcome Back',
                style: TextStyles.regular.copyWith(
                  color: AppColors.black.withOpacity(.7),
                  fontSize: 18.sp,
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: 32.h,
            width: 48.w,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(5.w),
            child: SvgPicture.asset(
              "assets/icons/bell.svg",
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}
