import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';
import 'package:home_cache/view/widget/text_field_widget.dart';
import 'package:home_cache/view/widget/tile_button.dart';
import 'package:home_cache/view/widget/dropdown_field_widget.dart'; // Import your widget here

class AddProviderScreen extends StatefulWidget {
  const AddProviderScreen({super.key});

  @override
  State<AddProviderScreen> createState() => _AddProviderScreenState();
}

class _AddProviderScreenState extends State<AddProviderScreen> {
  String? selectedType;

  final List<String> providerTypes = [
    'Plumber',
    'Electrician',
    'HVAC Technician',
    'Roofer',
    'General Contractor',
    'Handyman',
    'Landscaper',
    'Pest Control Specialist',
    'Painter',
    'Carpenter',
    'Appliance Repair Technician',
    'Window and Door Installer/Repair',
    'Locksmith',
    'Pool Maintenance Provider',
    'Cleaning Service',
    'Gutter Specialist',
    'Chimney Sweep / Specialist',
    'Fence Installer / Repair',
    'Masonry Specialist',
    'Insulation Contractor',
    'Solar Panel Installer / Maintenance',
    'Siding Contractor',
    'Garage Door Repair / Installer',
    'Tree Service / Arborist',
    'Septic System Service',
    'Foundation Repair Specialist',
    'Home Inspector',
    'Interior Designer / Decorator',
    'Waste Removal / Dumpster Rental',
    'Snow Removal Service',
    'Window Cleaning Service',
    'Paving / Driveway Repair Contractor',
    'Energy Auditor',
    'Water Treatment Specialist',
    'Smart Home Technician',
    'Fireplace Repair Technician',
    'Oil Provider',
    'Trash / Recycling',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBarBack(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'New Provider',
                style: TextStyles.bold.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              Text(
                'Type',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              DropdownFieldWidget(
                value: selectedType,
                hintText: 'Select Type',
                items: providerTypes,
                onChanged: (value) {
                  setState(() {
                    selectedType = value;
                  });
                },
              ),
              SizedBox(height: 16.h),
              Text(
                'Company',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              const TextFieldWidget(
                hintText: 'Enter Company Name',
              ),
              SizedBox(height: 16.h),
              Text(
                'Full Name',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              const TextFieldWidget(
                hintText: 'Enter Full Name',
              ),
              SizedBox(height: 16.h),
              Text(
                'Phone Number',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              const TextFieldWidget(
                hintText: 'Enter Phone Number',
              ),
              SizedBox(height: 16.h),
              Text(
                'URL',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              const TextFieldWidget(
                hintText: 'Enter URL',
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TileButton(
                    imagePath: 'assets/images/link.png',
                    title: 'Link Meeting',
                    onTap: () {},
                  ),
                  TileButton(
                    imagePath: 'assets/images/upload.png',
                    title: 'Office',
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: AppColors.primaryLight, size: 30.sp),
                  Icon(Icons.star, color: AppColors.primaryLight, size: 30.sp),
                  Icon(Icons.star, color: AppColors.primaryLight, size: 30.sp),
                  Icon(Icons.star_border, color: Colors.grey, size: 30.sp),
                  Icon(Icons.star_border, color: Colors.grey, size: 30.sp),
                ],
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Column(
                  children: [
                    TextWidgetButton(
                      text: 'Confirm',
                      onPressed: () {
                        Get.toNamed(AppRoutes.provider);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
