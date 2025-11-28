import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/model/document.dart';

import 'package:home_cache/view/home/account/productsupport/widgets/text_field_widget.dart';
import 'package:home_cache/view/home/details/widgets/online_pdf_viewer.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:intl/intl.dart';

import '../../../../config/route/route_names.dart';

class DocumentsDetailsScreen extends StatefulWidget {
  const DocumentsDetailsScreen({super.key});

  @override
  State<DocumentsDetailsScreen> createState() => _DocumentsDetailsScreenState();
}

class _DocumentsDetailsScreenState extends State<DocumentsDetailsScreen> {
  int selectedToggleIndex = 0;

  final Document args = Get.arguments as Document;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(
        title: 'Documents',
        titleColor: AppColors.secondary,
        actions: [
          TextButton(
            onPressed: () {
              Get.toNamed(RouteNames.addDocuments);
            },
            child: Icon(Icons.edit, color: AppColors.black),
          ),
        ],
      ),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                  args.type.toString(),
                  style: AppTypoGraphy.medium.copyWith(color: AppColors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4.h),
                Text(
                  args.details.warrantyEndDate != null
                      ? "Expires ${DateFormat('dd/MM/yyyy').format(
                          DateTime.parse(args.details.warrantyEndDate!),
                        )}"
                      : 'Expired Date not found',
                  style: AppTypoGraphy.regular.copyWith(color: AppColors.black),
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
                  child: args.files.isNotEmpty
                      // ? OnlinePdfViewer(url: args.files.first.fileUrl)
                      ? OnlinePdfViewer(
                          url: "https://pdfobject.com/pdf/sample.pdf")
                      : Center(child: Text('No document available')),
                ),
              ] else ...[
                Text(
                  'Title',
                  style:
                      AppTypoGraphy.semiBold.copyWith(color: AppColors.black),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 6.h),
                TextFieldWidget(),
                SizedBox(height: 16.h),
                Text(
                  'Type',
                  style:
                      AppTypoGraphy.semiBold.copyWith(color: AppColors.black),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 6.h),
                TextFieldWidget(),
                SizedBox(height: 16.h),
                Text(
                  'Brand/Company',
                  style:
                      AppTypoGraphy.semiBold.copyWith(color: AppColors.black),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 6.h),
                TextFieldWidget(),
                SizedBox(height: 16.h),
                Text(
                  'Url',
                  style:
                      AppTypoGraphy.semiBold.copyWith(color: AppColors.black),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 6.h),
                TextFieldWidget(),
                SizedBox(height: 16.h),
                Text(
                  'Note',
                  style:
                      AppTypoGraphy.semiBold.copyWith(color: AppColors.black),
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
