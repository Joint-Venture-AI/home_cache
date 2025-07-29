import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';

class AddRoomDialog extends StatelessWidget {
  const AddRoomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedItem = 'Bed';
    String selectedRoom = 'Bedroom';

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Text(
        'Add a room',
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
                  'Type',
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
                    value: selectedItem,
                    isExpanded: true,
                    underline: SizedBox(),
                    icon: Icon(
                      CupertinoIcons.chevron_down,
                      color: AppColors.secondary,
                      size: 18.sp,
                    ),
                    items:
                        [
                          'Bed',
                          'Chair',
                          'Table',
                          'Wardrobe',
                          'Couch',
                          'Lamp',
                          'Shelf',
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
                        selectedItem = newValue!;
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.surface),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<String>(
                    value: selectedRoom,
                    isExpanded: true,
                    underline: SizedBox(),
                    icon: Icon(
                      CupertinoIcons.chevron_down,
                      color: AppColors.secondary,
                      size: 18.sp,
                    ),
                    items:
                        [
                          'Bedroom',
                          'Living Room',
                          'Kitchen',
                          'Bathroom',
                          'Dining Room',
                          'Office',
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
                        selectedRoom = newValue!;
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
                          Get.toNamed(AppRoutes.addRoom);
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
