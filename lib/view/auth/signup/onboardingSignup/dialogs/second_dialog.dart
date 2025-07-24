import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';

class SecondDialog extends StatelessWidget {
  const SecondDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tags = [
      'Garage',
      'Kitchen',
      'Flooring',
      'Documents',
      'Air Vents',

      'Paints',
      'Fire Alarm / Smoke Detector',
      'Laundry Room',
      'Landscaping',
    ];

    return AlertDialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      contentPadding: EdgeInsets.all(24.w),
      title: Text(
        'Welcome To HomeCache!',
        style: TextStyles.bold.copyWith(
          color: AppColors.black,
          fontSize: 32.sp,
        ),
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        height: 350.h,
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40.h),
            Text(
              'Track all your home\'s details in one easy to access place',
              style: TextStyles.regular.copyWith(color: AppColors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 48.h),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 8.w,
                runSpacing: 8.h,
                children: tags.map((tag) {
                  return Container(
                    height: 32.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.lightgrey,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Text(
                      tag,
                      style: TextStyles.medium.copyWith(
                        color: AppColors.black,
                        fontSize: 15.sp,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      actionsPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      actions: [
        SizedBox(
          width: double.infinity,
          height: 48.h,
          child: TextWidgetButton(
            text: "→  Next",
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ],
    );
  }
}
