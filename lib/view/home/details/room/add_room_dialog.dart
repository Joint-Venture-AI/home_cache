import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';

class AddRoomDialog extends StatelessWidget {
  const AddRoomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedItem = 'Kitchen';
    final TextEditingController nameController = TextEditingController();

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
                Text('Type',
                    style: TextStyles.regular.copyWith(color: AppColors.black)),
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
                    icon: Icon(CupertinoIcons.chevron_down,
                        color: AppColors.secondary, size: 18.sp),
                    items: [
                      'Kitchen',
                      'Dining',
                      'Living Room',
                      'Bedroom',
                      'Bathroom',
                      'Laundry',
                      'Office',
                      'Basement',
                      'Garage',
                      'Gym',
                      'Mudroom',
                      'Mediaroom',
                      'Playroom',
                      'Sunroom',
                    ].map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value,
                            style: TextStyle(color: AppColors.black)),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedItem = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                Text('Name (optional)',
                    style: TextStyles.regular.copyWith(color: AppColors.black)),
                SizedBox(height: 6.h),
                SizedBox(
                  height: 48.h,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter room name',
                      hintStyle:
                          TextStyle(color: AppColors.black.withOpacity(.7)),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(
                            color: Colors.grey.withOpacity(.5), width: 1.w),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide:
                            BorderSide(color: Colors.grey, width: 1.5.w),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 70.h),
                Padding(
                  padding: EdgeInsets.only(left: 60.w),
                  child: TextWidgetButton(
                    text: '→  Next',
                    onPressed: () {
                      Get.toNamed(
                        AppRoutes.addRoom,
                        arguments: {
                          'type': selectedItem,
                          'name': nameController.text.trim(),
                        },
                      );
                    },
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
