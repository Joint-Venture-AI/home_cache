import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';

class PreviewDocumentScreen extends StatelessWidget {
  const PreviewDocumentScreen({super.key});

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
                'New Document',
                style: TextStyles.bold.copyWith(color: AppColors.secondary),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),
              Column(
                children: [
                  SizedBox(
                    height: 400.h,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: Text(
                          'Document',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                'Is this your document?',
                style: TextStyles.medium.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.addDocuments);
                },
                child: Text(
                  'Retry',
                  style: TextStyles.regular.copyWith(
                    color: AppColors.secondary,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(left: 160.w),
                child: Column(
                  children: [
                    TextWidgetButton(
                      text: '→  Next',
                      onPressed: () {
                        Get.toNamed(AppRoutes.addDocumentsDetails);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
