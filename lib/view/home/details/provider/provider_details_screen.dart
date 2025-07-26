import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart' show AppColors, primaryLight;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/past_appointments_section.dart';
import 'package:home_cache/view/widget/scheduled_appointment_tile.dart';

class ProviderDetailsScreen extends StatefulWidget {
  const ProviderDetailsScreen({super.key});

  @override
  State<ProviderDetailsScreen> createState() => _ProviderDetailsScreenState();
}

class _ProviderDetailsScreenState extends State<ProviderDetailsScreen> {
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
                'HVAC',
                style: TextStyles.regular.copyWith(
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 6.h),
              Text(
                'HVAC Pros',
                style: TextStyles.bold.copyWith(color: AppColors.primary),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),
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

              SizedBox(height: 24.h),
              Text(
                'Contact Information',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Tom Vu',
                      style: TextStyles.regular.copyWith(
                        color: AppColors.black,
                        fontSize: 20.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 4),
                    Text(
                      '(333) 455-6789',
                      style: TextStyles.regular.copyWith(
                        color: AppColors.black,
                        fontSize: 20.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'www.hvacpros.com',
                      style: TextStyles.regular.copyWith(
                        color: AppColors.black,
                        fontSize: 20.sp,
                        decoration: TextDecoration.underline,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 6.h),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Scheduled Appointments',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              ScheduledAppointmentTile(
                title: 'HVAC Maintenance',
                subtitle: 'Aug 15, 10:00 AM',
              ),
              SizedBox(height: 20.h),
              Text(
                'Past Appointments',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
