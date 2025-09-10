import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';
import 'package:home_cache/view/widget/text_field_widget.dart';
import 'package:home_cache/view/widget/dropdown_field_widget.dart';
import 'package:home_cache/utils.dart' as utils;
import 'package:image_picker/image_picker.dart';

class AddDetailsIteamScreen extends StatefulWidget {
  const AddDetailsIteamScreen({super.key});

  @override
  State<AddDetailsIteamScreen> createState() => _AddDetailsIteamScreenState();
}

class _AddDetailsIteamScreenState extends State<AddDetailsIteamScreen> {
  String? selectedType;
  final List<String> microwaveTypes = [
    'Countertop',
    'Built-in',
    'Over-the-range',
    'Drawer',
    'Other',
  ];

  File? _selectedImage;
  Uint8List? _selectedImageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            children: [
              Text(
                'Microwave',
                style: TextStyles.bold.copyWith(
                  color: AppColors.black,
                  fontSize: 26.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              GestureDetector(
                onTap: () async {
                  final image = await utils.pickSingleImage(
                      context: context, source: ImageSource.gallery);

                  if (image == null) return;
                  final imageData = await image.readAsBytes();

                  setState(() {
                    setState(() {
                      _selectedImage = image;
                      _selectedImageData = imageData;
                    });
                  });
                },
                child: Container(
                  width: 112.w,
                  height: 112.w,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.r)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: _selectedImageData == null
                        ? Center(
                            child: SvgPicture.asset(
                              'assets/icons/gallery.svg',
                              width: 72.w,
                            ),
                          )
                        : Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Image.memory(
                                _selectedImageData!,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedImage = null;
                                    _selectedImageData = null;
                                  });
                                },
                                child: Container(
                                  width: 20.w,
                                  height: 20.w,
                                  margin: EdgeInsets.only(top: 4.w, right: 4.w),
                                  decoration: BoxDecoration(
                                      color: Colors.red[400],
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Icon(
                                      Icons.close,
                                      size: 14.w,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),

              // Type Label & Dropdown

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Type',
                    style: TextStyles.semiBold.copyWith(color: AppColors.black),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 6.h),
                  DropdownFieldWidget(
                    value: selectedType,
                    items: microwaveTypes,
                    hintText: 'Select Type',
                    onChanged: (value) {
                      setState(() {
                        selectedType = value;
                      });
                    },
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Last Serviced',
                    style: TextStyles.semiBold.copyWith(color: AppColors.black),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 6.h),
                  const TextFieldWidget(
                    hintText: 'MM/YYYY',
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Note',
                    style: TextStyles.semiBold.copyWith(color: AppColors.black),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 6.h),
                  const TextFieldWidget(),
                ],
              ),

              SizedBox(height: 120.h),

              // Button
              Row(
                children: [
                  SizedBox(width: 150.w),
                  Expanded(
                    child: TextWidgetButton(
                      text: '✓  Complete  ',
                      onPressed: () {
                        Get.toNamed(AppRoutes.bottomNav);
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
