import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_cache/constants/colors.dart' show AppColors, secondary;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/text_field_widget.dart';

class DocumentsDetailsScreen extends StatefulWidget {
  const DocumentsDetailsScreen({super.key});

  @override
  State<DocumentsDetailsScreen> createState() => _DocumentsDetailsScreenState();
}

class _DocumentsDetailsScreenState extends State<DocumentsDetailsScreen> {
  int selectedToggleIndex = 0; // 0 = Documents, 1 = Details

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top Row: Title + Edit
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 15.w),
                  Text(
                    'Documents',
                    style: TextStyles.bold.copyWith(color: AppColors.secondary),
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.addDocuments);
                    },
                    child: Icon(Icons.edit, color: AppColors.black),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              // Toggle Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(2, (index) {
                  final labels = ['Documents', 'Details'];
                  final isSelected = selectedToggleIndex == index;
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedToggleIndex = index;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isSelected
                            ? AppColors.primary
                            : AppColors.lightgrey,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Text(
                        labels[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  );
                }),
              ),

              SizedBox(height: 24.h),

              if (selectedToggleIndex == 0) ...[
                Text(
                  'Product Name',
                  style: TextStyles.medium.copyWith(color: AppColors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4.h),
                Text(
                  'Expires on 5/8/25',
                  style: TextStyles.regular.copyWith(color: AppColors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Spacer(),
                    Image.asset(
                      'assets/images/download.png',
                      width: 24.w,

                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10),
                    Image.asset(
                      'assets/images/expand.png',
                      width: 24.w,

                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
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
              ] else ...[
                Text(
                  'Title',
                  style: TextStyles.semiBold.copyWith(color: AppColors.black),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 6.h),
                TextFieldWidget(),
                SizedBox(height: 16.h),
                Text(
                  'Type',
                  style: TextStyles.semiBold.copyWith(color: AppColors.black),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 6.h),
                TextFieldWidget(),
                SizedBox(height: 16.h),
                Text(
                  'Brand/Company',
                  style: TextStyles.semiBold.copyWith(color: AppColors.black),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 6.h),
                TextFieldWidget(),
                SizedBox(height: 16.h),
                Text(
                  'Url',
                  style: TextStyles.semiBold.copyWith(color: AppColors.black),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 6.h),
                TextFieldWidget(),
                SizedBox(height: 16.h),
                Text(
                  'Note',
                  style: TextStyles.semiBold.copyWith(color: AppColors.black),
                  textAlign: TextAlign.start,
                ),

                SizedBox(height: 6.h),
                TextFieldWidget(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
