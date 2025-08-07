import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';
import 'package:home_cache/view/widget/text_field_widget.dart';
import 'package:home_cache/view/widget/dropdown_field_widget.dart'; // Import your custom dropdown

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
              Text(
                'Microwave',
                style: TextStyles.bold.copyWith(
                  color: AppColors.black,
                  fontSize: 26.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              Image.asset("assets/images/item.png", height: 90.h),
              SizedBox(height: 32.h),

              // Type Label & Dropdown
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

              SizedBox(height: 16.h),

              Text(
                'Last Serviced',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              const TextFieldWidget(
                hintText: 'MM/YYYY',
              ),

              SizedBox(height: 16.h),

              Text(
                'Note',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              const TextFieldWidget(),

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
