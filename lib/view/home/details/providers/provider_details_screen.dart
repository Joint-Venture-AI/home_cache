import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/view/home/details/widgets/doccument_slider.dart';
import 'package:home_cache/view/home/details/widgets/past_appoinment_tile.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/scheduled_appointment_tile.dart';

import '../../../../config/route/route_names.dart';

class ProviderDetailsScreen extends StatefulWidget {
  final String providerId;

  const ProviderDetailsScreen({super.key, required this.providerId});

  @override
  State<ProviderDetailsScreen> createState() => _ProviderDetailsScreenState();
}

class _ProviderDetailsScreenState extends State<ProviderDetailsScreen> {
  bool isPastExpanded = false;

  // Placeholder for API data
  String providerName = '';
  String providerType = '';
  double rating = 0;
  String contactName = '';
  String contactNumber = '';
  String contactWebsite = '';
  List<Map<String, String>> scheduledAppointments = [];
  List<Map<String, String>> pastAppointments = [];
  List<String> documents = [];

  // @override
  // void initState() {
  //   super.initState();
  //   _fetchProviderDetails();
  // }

  // Future<void> _fetchProviderDetails() async {
  //   // TODO: Replace with API call
  //   // await Future.delayed(const Duration(milliseconds: 500));

  //   // Mock API response
  //   setState(() {
  //     providerType = 'HVAC';
  //     providerName = 'HVAC Pros';
  //     rating = 3;
  //     contactName = 'Tom Vu';
  //     contactNumber = '(333) 455-6789';
  //     contactWebsite = 'www.hvacpros.com';
  //     scheduledAppointments = [
  //       {'title': 'HVAC Maintenance', 'subtitle': 'Aug 15, 10:00 AM'},
  //     ];
  //     pastAppointments = [
  //       {'date': 'June 18, 2025', 'status': 'AC Check'},
  //       {'date': 'May 05, 2025', 'status': 'AC Check'},
  //       {'date': 'May 05, 2025', 'status': 'AC Check'},
  //     ];
  //     documents = ['doc1.pdf', 'doc2.pdf', 'doc3.pdf'];
  //   });
  // }

  Widget _buildStars(double rating) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: AppColors.primaryLight,
          size: 30.sp,
        ),
      ),
    );
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Provider Info
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Column(
                    children: [
                      Text(
                        providerType,
                        style: AppTypoGraphy.regular.copyWith(
                          color: AppColors.black,
                          fontSize: 16.sp,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        providerName,
                        style: AppTypoGraphy.bold
                            .copyWith(color: AppColors.primary),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12.h),
                      _buildStars(rating),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteNames.addProvider);
                    },
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                          color: AppColors.lightgrey, shape: BoxShape.circle),
                      child: Center(
                        child: Icon(
                          Icons.edit,
                          size: 18.w,
                          color: AppColors.text,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 24.h),
              // Contact Info
              _sectionTitle('Contact Information'),
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(contactName,
                        style: AppTypoGraphy.regular.copyWith(fontSize: 20.sp)),
                    SizedBox(height: 4.h),
                    Text(contactNumber,
                        style: AppTypoGraphy.regular.copyWith(fontSize: 20.sp)),
                    SizedBox(height: 4.h),
                    Text(
                      contactWebsite,
                      style: AppTypoGraphy.regular.copyWith(
                        fontSize: 20.sp,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              // Scheduled Appointments
              _sectionTitle('Scheduled Appointments'),
              ...scheduledAppointments.map((item) => ScheduledAppointmentTile(
                    title: item['title']!,
                    subtitle: item['subtitle']!,
                  )),

              SizedBox(height: 20.h),

              // Past Appointments
              GestureDetector(
                onTap: () => setState(() => isPastExpanded = !isPastExpanded),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Past Appointments',
                        style: AppTypoGraphy.semiBold
                            .copyWith(color: AppColors.black)),
                    Icon(
                      isPastExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: AppColors.secondary,
                      size: 24.w,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              if (isPastExpanded)
                ...pastAppointments.map((item) => PastAppointmentsTile(
                      date: item['date']!,
                      status: item['status']!,
                    )),

              SizedBox(height: 20.h),

              // Documents
              _sectionTitle('Documents'),
              // DocumentSlider(documents: documents),
              // DocumentSlider(),
              DocumentSlider(
                documents: documents
                    .map((doc) => {
                          'iconPath': 'assets/images/document.png',
                          'title': doc,
                          'date': 'Uploaded 8/17/2025', // replace with API date
                        })
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: AppTypoGraphy.semiBold.copyWith(color: AppColors.black)),
        Divider(color: AppColors.black, thickness: 1.h, height: 12.h),
      ],
    );
  }
}
