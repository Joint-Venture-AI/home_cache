import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';

class PreviewDocumentScreen extends StatelessWidget {
  const PreviewDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments ?? {};
    final String? docType = args['type'];
    final String? imagePath = args['imagePath'];

    return Scaffold(
      appBar: const AppBarBack(),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('New Document',
                  style: TextStyles.bold.copyWith(color: AppColors.secondary),
                  textAlign: TextAlign.center),
              SizedBox(height: 10.h),

              // 📸 Show image if exists
              Container(
                height: 400.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: imagePath != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.file(
                          File(imagePath),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      )
                    : Center(
                        child: Text('No Document Selected',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w500))),
              ),

              SizedBox(height: 20.h),
              Text('Is this your document?',
                  style: TextStyles.medium.copyWith(color: AppColors.black)),
              InkWell(
                onTap: () => Get.back(),
                child: Text('Retry',
                    style: TextStyles.regular.copyWith(
                        color: AppColors.secondary,
                        decoration: TextDecoration.underline)),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(left: 160.w),
                child: TextWidgetButton(
                  text: '→  Next',
                  onPressed: () {
                    Get.toNamed(AppRoutes.addDocumentsDetails, arguments: {
                      'type': docType,
                      'imagePath': imagePath,
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
