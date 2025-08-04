import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/model/room.dart'; // import your Room model
import 'package:home_cache/view/widget/text_button_widget.dart';

// Assume `rooms` is imported or accessible here
import 'package:home_cache/constants/data/rooms.dart'; // your rooms list

class AddRoomItemDialog extends StatelessWidget {
  const AddRoomItemDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // Default selected values
    String selectedRoom = rooms.isNotEmpty ? rooms[0].name : '';
    List<String> availableItems = rooms.isNotEmpty ? rooms[0].items : [];
    String selectedItem = availableItems.isNotEmpty ? availableItems[0] : '';

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Text(
        'Add an item',
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
                    items: availableItems.map((value) {
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
                    border: Border.all(color: AppColors.lightgrey),
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
                    items: rooms.map((room) {
                      return DropdownMenuItem(
                        value: room.name,
                        child: Text(
                          room.name,
                          style: TextStyle(color: AppColors.black),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedRoom = newValue!;
                        // Update available items for this new room
                        final matchedRoom = rooms.firstWhere(
                          (room) => room.name == selectedRoom,
                          orElse: () => Room(name: '', items: []),
                        );
                        availableItems = matchedRoom.items;
                        selectedItem =
                            availableItems.isNotEmpty ? availableItems[0] : '';
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
                          // Pass selected data as needed:
                          Get.toNamed(
                            AppRoutes.addNewRoomIteam,
                            arguments: {
                              'selectedRoom': selectedRoom,
                              'selectedItem': selectedItem,
                            },
                          );
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
