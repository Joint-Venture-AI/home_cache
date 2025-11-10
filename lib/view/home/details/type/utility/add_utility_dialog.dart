import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';

class DialogUtilities extends StatelessWidget {
  const DialogUtilities({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedType = 'Water';
    String selectedLocation = 'Kitchen';

    return AlertDialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Text(
        'Add A Utility',
        style: AppTypoGraphy.bold.copyWith(color: AppColors.black),
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        height: 300.h,
        child: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 18.h),

                /// Utility type
                Text(
                  'Type',
                  style: AppTypoGraphy.regular.copyWith(color: AppColors.black),
                  textAlign: TextAlign.start,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightgrey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<String>(
                    value: selectedType,
                    isExpanded: true,
                    underline: const SizedBox(),
                    icon: Icon(
                      CupertinoIcons.chevron_down,
                      color: AppColors.secondary,
                      size: 18.sp,
                    ),
                    items: [
                      'Water',
                      'Electricity',
                      'Gas',
                      'Internet',
                      'Cable TV',
                      'Telephone',
                      'Sewage',
                      'Trash Collection',
                      'Solar Energy',
                      'Security System',
                      'Home Automation',
                    ].map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: AppColors.black),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedType = newValue!;
                      });
                    },
                  ),
                ),

                SizedBox(height: 16.h),

                /// Location dropdown
                Text(
                  'Location',
                  style: AppTypoGraphy.regular.copyWith(color: AppColors.black),
                  textAlign: TextAlign.start,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightgrey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<String>(
                    value: selectedLocation,
                    isExpanded: true,
                    underline: const SizedBox(),
                    icon: Icon(
                      CupertinoIcons.chevron_down,
                      color: AppColors.secondary,
                      size: 18.sp,
                    ),
                    items: [
                      'Kitchen',
                      'Bathroom',
                      'Living Room',
                      'Bedroom',
                      'Garage',
                      'Basement',
                      'Laundry',
                      'Office',
                      'Garden',
                    ].map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: AppColors.black),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedLocation = newValue!;
                      });
                    },
                  ),
                ),

                SizedBox(height: 70.h),

                /// Next button
                Padding(
                  padding: EdgeInsets.only(left: 60.w),
                  child: Column(
                    children: [
                      TextWidgetButton(
                        text: '→  Next',
                        onPressed: () {
                          // Get.toNamed(
                          //   // arguments: {
                          //   //   'type': selectedType,
                          //   //   'location': selectedLocation,
                          //   // },
                          // );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
