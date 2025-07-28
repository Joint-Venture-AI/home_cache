import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';

class DialogRoom extends StatefulWidget {
  const DialogRoom({super.key});

  @override
  State<DialogRoom> createState() => _DialogRoomState();
}

class _DialogRoomState extends State<DialogRoom> {
  String selectedType = 'Kitchen'; // Set a default from the dropdown list

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Text(
        'Add a room',
        style: TextStyles.bold.copyWith(color: AppColors.black),
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        height: 300.h,
        child: Column(
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
                underline: const SizedBox(),
                icon: Icon(
                  CupertinoIcons.chevron_down,
                  color: AppColors.secondary,
                  size: 18.sp,
                ),
                items:
                    [
                      'Kitchen',
                      'Bath',
                      'Dining',
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
            Text(
              'Location',
              style: TextStyles.regular.copyWith(color: AppColors.black),
              textAlign: TextAlign.start,
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
        ),
      ),
    );
  }
}
