import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';
import 'package:home_cache/view/widget/text_button_widget_light.dart';

class HomeInformationScreen extends StatelessWidget {
  const HomeInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: const AppBarBack(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Would You Like To Enter Your Address To Get Some Basic Information About Your Home?',
                style: TextStyles.bold.copyWith(
                  color: AppColors.secondary,
                  fontSize: 24.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(18.r),
                child: Container(
                  width: double.infinity,
                  color: AppColors.lightgrey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              'assets/icons/back.svg',
                              height: 48.h,
                            ),
                          ),

                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: TextField(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Your Address',
                                    hintStyle: TextStyle(fontSize: 20.sp),

                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(width: 10.w),

                          SvgPicture.asset(
                            'assets/icons/cross.svg',
                            height: 48.h,
                          ),
                        ],
                      ),
                      Divider(
                        color: AppColors.black,
                        thickness: 1.h,
                        height: 6.h,
                      ),

                      Container(
                        padding: EdgeInsets.only(
                          top: 18.sp,
                          left: 24.sp,
                          right: 24.sp,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              '123 Home Ln Example',
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            Text(
                              'Los Angeles, CA',
                              style: TextStyle(fontSize: 18.sp),
                            ),
                            Text('1234567', style: TextStyle(fontSize: 16.sp)),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 24.sp,
                          right: 24.sp,
                          top: 18.sp,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              '123 Home Ln Example',
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            Text(
                              'Los Angeles, CA',
                              style: TextStyle(fontSize: 18.sp),
                            ),
                            Text('1234567', style: TextStyle(fontSize: 16.sp)),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.h),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 48.h),
              Text(
                'More details help us better help you!',
                style: TextStyles.bold.copyWith(
                  color: AppColors.primary,
                  fontSize: 24.sp,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 32.h),
              Row(
                children: [
                  Expanded(
                    child: TextButtonWidgetLight(
                      text: 'Skip',
                      onPressed: () {
                        Get.toNamed(AppRoutes.finishUtility);
                      },
                    ),
                  ),
                  SizedBox(width: 100.w),
                  Expanded(
                    child: TextWidgetButton(
                      text: '→  Next  ',
                      onPressed: () {
                        Get.toNamed(AppRoutes.selectPowerType);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
