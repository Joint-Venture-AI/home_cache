import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/auth/widgets/auth_text_form_field.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';

class EditContactInformationScreen extends StatelessWidget {
  const EditContactInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Contact Information',
                style: TextStyles.bold.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              Text(
                'Name',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              Row(
                children: [
                  Expanded(child: AuthTextFormField(hintText: 'First')),
                  SizedBox(width: 16.w),
                  Expanded(child: AuthTextFormField(hintText: 'Last')),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                'Email',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              AuthTextFormField(hintText: 'example@example.com'),
              SizedBox(height: 20.h),
              Text(
                'Address',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
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
                          SizedBox(width: 10.w),
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
              SizedBox(height: 100.h),
              TextWidgetButton(
                text: 'Update',
                onPressed: () {
                  //  Get.toNamed(AppRoutes.selectHouse);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
