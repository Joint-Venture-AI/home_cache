import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/app_assets.dart';
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/view/auth/signup/widgets/custom_elevated_button.dart';

class WelcomeDialog extends StatelessWidget {
  const WelcomeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      title: Text(
        'Welcome To HomeCache!',
        style: AppTypoGraphy.bold.copyWith(
          color: AppColors.black,
          fontSize: 26.sp,
        ),
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        height: 360.h,
        width: double.maxFinite,
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Text(
              'Here’s how to get started',
              style: AppTypoGraphy.medium.copyWith(color: AppColors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 28.h),
            Text(
              'Select Which Options Are Relevant To You And Your Home And Hit ‘Next’',
              style: AppTypoGraphy.regular.copyWith(color: AppColors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            _buildDialongIconCard(),
            SizedBox(height: 16.h),
            Text(
              'More Details Help Us Provide You With Better Information To Maintain Your Home!',
              style: AppTypoGraphy.regular.copyWith(color: AppColors.black),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        CustomElevatedButton(
          onTap: () {
            Get.back();
          },
          btnText: 'Next',
          icon: Icons.arrow_forward,
        ),
      ],
    );
  }

  Widget _buildDialongIconCard() {
    return Card(
      color: const Color(0xffEBEBEB),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        width: 120.w,
        height: 120.h,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              SvgPicture.asset(
                AppAssets.dHomeIcon,
                fit: BoxFit.contain,
              ),
              Text(
                'House',
                style: TextStyle(
                    color: Color(0xff434A54).withAlpha(180),
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
