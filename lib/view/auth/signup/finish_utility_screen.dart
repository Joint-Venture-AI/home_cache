import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';
import 'package:home_cache/view/widget/text_button_widget_light.dart';

class FinishUtilityScreen extends StatelessWidget {
  const FinishUtilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBarBack(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Now That We’ve Finished Your Utilities, Let’s Take A Look Inside The House',
                style: TextStyles.bold.copyWith(
                  color: AppColors.secondary,
                  fontSize: 26.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 100.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Column(
                  children: [
                    TextWidgetButton(
                      text: '→   keep Going',
                      onPressed: () {
                        Get.toNamed(AppRoutes.trackList);
                      },
                    ),
                    SizedBox(height: 15.h),
                    Text('or', style: TextStyle(fontSize: 16.sp)),
                    SizedBox(height: 15.h),
                    TextButtonWidgetLight(
                      text: 'Go to Home Page',
                      onPressed: () {
                        Get.toNamed(AppRoutes.bottomNav);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100.h),

              Text(
                'You can also go back and come back to this later!',
                style: TextStyles.bold.copyWith(
                  color: AppColors.black,
                  fontSize: 26.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
