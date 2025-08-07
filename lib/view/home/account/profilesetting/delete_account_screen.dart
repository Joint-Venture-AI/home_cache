import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  String? selectedReason;

  final List<String> reasons = [
    'No longer using the service/platform',
    'Found a better alternative',
    'Privacy concerns',
    'Too many emails/Notifications',
    'Difficulty navigating the platform',
    'Account security concerns',
    'Personal reasons',
    'Others',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delete Account',
                style: TextStyles.bold.copyWith(color: AppColors.black),
              ),
              SizedBox(height: 20.h),
              Text(
                "We're sorry to see you go. Select a reason to continue.",
                style: TextStyles.regular.copyWith(color: AppColors.black),
              ),
              SizedBox(height: 20.h),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: reasons.length,
                itemBuilder: (context, index) {
                  return RadioListTile<String>(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      reasons[index],
                      style: TextStyles.regular.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    value: reasons[index],
                    groupValue: selectedReason,
                    onChanged: (value) {
                      setState(() {
                        selectedReason = value;
                      });
                    },
                    activeColor: AppColors.primary,
                  );
                },
              ),
              SizedBox(height: 30.h),
              TextWidgetButton(
                text: 'Delete',
                onPressed: () {
                  if (selectedReason != null) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: AppColors.surface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        title: Text(
                          'Are you sure?',
                          style: TextStyles.semiBold.copyWith(
                            color: AppColors.black,
                            fontSize: 16.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'You want to delete account permanently.',
                              style: TextStyles.regular.copyWith(
                                color: AppColors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'All data, images, and history will be permanently deleted.',
                              style: TextStyles.regular.copyWith(
                                color: AppColors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              'Cancel',
                              style: TextStyles.regular.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Delete',
                              style: TextStyles.semiBold.copyWith(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
