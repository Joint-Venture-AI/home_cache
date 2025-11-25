import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/view/auth/signup/widgets/custom_elevated_button.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';

import '../../../../config/route/route_names.dart';

class PreviewDocumentScreen extends StatelessWidget {
  const PreviewDocumentScreen({super.key});

  bool _isPDF(String? path) {
    if (path == null) return false;
    final ext = path.split('.').last.toLowerCase();
    return ext == 'pdf';
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments ?? {};
    final String? docType = args['type'];
    final String? filePath = args['imagePath']; // Could be image OR pdf

    return Scaffold(
      appBar: const AppBarBack(
        title: 'New Document',
        titleColor: AppColors.secondary,
      ),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 📄 FILE PREVIEW CONTAINER
              Container(
                height: 400.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: _buildFilePreview(filePath),
              ),

              SizedBox(height: 20.h),

              Text('Is this your document?',
                  style: AppTypoGraphy.medium.copyWith(color: AppColors.black)),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Text(
                  'Retry',
                  style: AppTypoGraphy.regular.copyWith(
                    color: AppColors.secondary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0.sp),
          child: CustomElevatedButton(
            onTap: () {
              Get.toNamed(
                RouteNames.addDocumentsDetails,
                arguments: {
                  'type': docType,
                  'imagePath': filePath,
                },
              );
            },
            icon: Icons.arrow_forward,
            btnText: 'Next',
            height: 48.h,
            width: 208.w,
          ),
        ),
      ),
    );
  }

  Widget _buildFilePreview(String? filePath) {
    if (filePath == null) {
      return const Center(child: Text("No Document Selected"));
    }

    if (_isPDF(filePath)) {
      // ! pdf show
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: PDFView(
          filePath: filePath,
          enableSwipe: true,
          swipeHorizontal: true,
          autoSpacing: true,
        ),
      );
    }

    // ! image show
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.file(
        File(filePath),
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
