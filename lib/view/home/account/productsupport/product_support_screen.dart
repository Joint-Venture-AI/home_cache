import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';
import 'package:home_cache/view/widget/text_field_widget.dart';

class ProductSupportScreen extends StatelessWidget {
  const ProductSupportScreen({super.key});

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
                'Product Support',
                style: TextStyles.bold.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 48.h),
              Text(
                'Email',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              TextFieldWidget(
                hintText: 'Enter Email',
              ),
              SizedBox(height: 16.h),
              Text(
                'Subject Line',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              TextFieldWidget(
                hintText: 'Enter Subject',
              ),
              SizedBox(height: 16.h),
              Text(
                'Details',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              TextField(
                minLines: 6,
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: 'Enter Details',
                  hintStyle: TextStyle(color: AppColors.black.withOpacity(.7)),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: Colors.grey, width: 1.w),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: Colors.grey, width: 1.5.w),
                  ),
                ),
                style: const TextStyle(color: Color.fromARGB(255, 243, 90, 90)),
              ),
              SizedBox(height: 56.h),
              TextWidgetButton(
                text: 'Send',
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
