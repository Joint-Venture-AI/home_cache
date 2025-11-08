import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/view/auth/signup/widgets/custom_elevated_button.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';

import '../../../../config/route/route_names.dart';

class PreviewDocumentScreen extends StatelessWidget {
  const PreviewDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments ?? {};
    final String? docType = args['type'];
    final String? imagePath = args['imagePath'];

    return Scaffold(
      appBar: const AppBarBack(
          title: 'New Document', titleColor: AppColors.secondary),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                  style: AppTypoGraphy.medium.copyWith(color: AppColors.black)),
              InkWell(
                onTap: () => Get.back(),
                child: Text('Retry',
                    style: AppTypoGraphy.regular.copyWith(
                        color: AppColors.secondary,
                        decoration: TextDecoration.underline)),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.0.sp),
        child: CustomElevatedButton(
          onTap: () {
            Get.toNamed(RouteNames.addDocumentsDetails, arguments: {
              'type': docType,
              'imagePath': imagePath,
            });
          },
          icon: Icons.arrow_forward,
          btnText: 'Next',
          height: 48.h,
          width: 208.w,
        ),
      ),
    );
  }
}
