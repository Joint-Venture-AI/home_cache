import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/data/rooms.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/config/route/routes.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';

import '../../../../config/route/route_names.dart';
import '../../../../model/room_model.dart';

class AddRoomItemDialog extends StatefulWidget {
  const AddRoomItemDialog({super.key});

  @override
  State<AddRoomItemDialog> createState() => _AddRoomItemDialogState();
}

class _AddRoomItemDialogState extends State<AddRoomItemDialog> {
  late String selectedRoom;
  late List<String> availableItems;
  late String selectedItem;

  @override
  void initState() {
    super.initState();
    selectedRoom = rooms.isNotEmpty ? rooms[0].name : '';
    availableItems = rooms.isNotEmpty ? rooms[0].items : [];
    selectedItem = availableItems.isNotEmpty ? availableItems[0] : '';
  }

  @override
  Widget build(BuildContext context) {
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
        child: Column(
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
                dropdownColor: Color(0xffA7B8BB),
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
                dropdownColor: Color(0xffA7B8BB),
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
                    final matchedRoom = rooms.firstWhere(
                      (room) => room.name == selectedRoom,
                      orElse: () => RoomModel(name: '', items: []),
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
              child: TextWidgetButton(
                text: '→  Next',
                onPressed: () {
                  Get.toNamed(
                    RouteNames.addNewRoomIteam,
                    arguments: {
                      'selectedRoom': selectedRoom,
                      'selectedItem': selectedItem,
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
