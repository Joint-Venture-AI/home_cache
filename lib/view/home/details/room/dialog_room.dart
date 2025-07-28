import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';

class DialogRoom extends StatelessWidget {
  const DialogRoom({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedType = 'Refrigerator';
    String selectedBrand = 'Samsung';

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Text(
        'Add an appliance',
        style: TextStyles.bold.copyWith(color: AppColors.black),
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
                Text(
                  'Title',
                  style: TextStyles.regular.copyWith(color: AppColors.black),
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
                    underline: SizedBox(),
                    icon: Icon(
                      CupertinoIcons.chevron_down,
                      color: AppColors.secondary,
                      size: 18.sp,
                    ),
                    items:
                        [
                          'Refrigerator',
                          'Oven',
                          'Washer',
                          'Stove',
                          'Dryer',
                          'Ice Maker',
                          'Dish Washer',
                          'Garbage Disposal',
                          'Microwave',
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
                SizedBox(height: 16),
                SizedBox(height: 6.h),
                Text(
                  'Location',
                  style: TextStyles.regular.copyWith(color: AppColors.black),
                  textAlign: TextAlign.start,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightgrey),
                    borderRadius: BorderRadius.circular(8), // Less round
                  ),
                  child: DropdownButton<String>(
                    value: selectedBrand,
                    isExpanded: true,
                    underline: SizedBox(),
                    icon: Icon(
                      CupertinoIcons.chevron_down,
                      color: AppColors.secondary,
                      size: 18.sp,
                    ),
                    items:
                        [
                          'Samsung',
                          'LG',
                          'Whirlpool',
                          'GE',
                          'Bosch',
                          'Frigidaire',
                          'KitchenAid',
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
                        selectedBrand = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 70.h),
                Padding(
                  padding: EdgeInsets.only(left: 60.w),
                  child: Column(
                    children: [
                      TextWidgetButton(
                        text: '→  Next',
                        onPressed: () {
                          Get.toNamed(AppRoutes.editAppliances);
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
