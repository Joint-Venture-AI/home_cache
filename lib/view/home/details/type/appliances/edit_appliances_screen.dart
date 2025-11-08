import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/doccument_slider.dart';
import 'package:home_cache/view/home/details/widgets/past_appoinment_tile.dart';
import 'package:home_cache/view/widget/text_field_widget.dart';

class EditAppliancesScreen extends StatefulWidget {
  const EditAppliancesScreen({super.key});

  @override
  State<EditAppliancesScreen> createState() => _EditAppliancesScreenState();
}

class _EditAppliancesScreenState extends State<EditAppliancesScreen> {
  bool isPastExpanded = false;

  late TextEditingController typeController;
  late TextEditingController locationController;
  late TextEditingController notesController;

  @override
  void initState() {
    super.initState();
    final args = Get.arguments as Map<String, dynamic>? ?? {};

    String initialType = args['type'] ?? 'Refrigerator';
    String initialLocation = args['location'] ?? 'Kitchen';

    typeController = TextEditingController(text: initialType);
    locationController = TextEditingController(text: initialLocation);
    notesController = TextEditingController();
  }

  @override
  void dispose() {
    typeController.dispose();
    locationController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBarBack(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      typeController.text,
                      style: AppTypoGraphy.bold.copyWith(color: AppColors.black),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 10.w),
                    Image.asset(
                      'assets/images/pen.png',
                      height: 24.h,
                      color: AppColors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Center(
                child: Image.asset('assets/images/camera.png', height: 120.h),
              ),
              SizedBox(height: 16.h),
              Text(
                'Type',
                style: AppTypoGraphy.semiBold.copyWith(color: AppColors.black),
              ),
              SizedBox(height: 6.h),
              TextFieldWidget(
                //  controller: typeController,
                hintText: 'Type',
              ),
              SizedBox(height: 16.h),
              Text(
                'Location',
                style: AppTypoGraphy.semiBold.copyWith(color: AppColors.black),
              ),
              SizedBox(height: 6.h),
              TextFieldWidget(
                //controller: locationController,
                hintText: 'Location',
              ),
              SizedBox(height: 16.h),
              Text(
                'Notes',
                style: AppTypoGraphy.semiBold.copyWith(color: AppColors.black),
              ),
              TextFieldWidget(
                //controller: notesController,
                hintText: 'Notes',
              ),
              SizedBox(height: 16.h),
              if (isPastExpanded) ...[
                PastAppointmentsTile(date: "June 18, 2025", status: "AC Check"),
                PastAppointmentsTile(date: "May 05, 2025", status: "AC Check"),
              ],
              SizedBox(height: 20.h),
              Text(
                'Documents',
                style: AppTypoGraphy.semiBold.copyWith(color: AppColors.black),
              ),
              SizedBox(height: 12.h),
              DocumentSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
