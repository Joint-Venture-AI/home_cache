import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/data/rooms.dart';
import 'package:home_cache/constants/text_style.dart';

import 'package:home_cache/view/model/room.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/icon_search_bar_widget.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';

class AddRoomScreen extends StatefulWidget {
  const AddRoomScreen({super.key});

  @override
  State<AddRoomScreen> createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends State<AddRoomScreen> {
  late String type;
  late String name;
  List<String> items = [];
  List<String> filteredItems = [];
  List<String> selectedItems = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    final Map<String, dynamic> args = Get.arguments ?? {};
    type = args['type'] ?? 'Unknown';
    name = (args['name'] is String && args['name'].isNotEmpty)
        ? args['name']
        : 'Room Name';

    final room = rooms.firstWhere(
      (r) => r.name == type,
      orElse: () => Room(name: type, items: []),
    );
    items = room.items;
    filteredItems = List.from(items);
    _filterItems(''); // initialize filteredItems to full list
  }

  void _filterItems(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        filteredItems = List.from(items);
      } else {
        filteredItems = items
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _onItemSelected(String item) {
    if (!selectedItems.contains(item)) {
      setState(() {
        selectedItems.add(item);
      });
    }
  }

  void _removeChip(String item) {
    setState(() {
      selectedItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                type,
                style: TextStyles.bold.copyWith(
                  color: AppColors.black,
                  fontSize: 26.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyles.regular.copyWith(
                      color: AppColors.secondary,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Image.asset(
                    'assets/images/pen.png',
                    height: 24.h,
                    width: 24.w,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.edit, size: 24.sp),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              Image.asset(
                'assets/images/item.png',
                height: 90.h,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.image, size: 90.sp),
              ),
              SizedBox(height: 32.h),
              IconSearchBarWidget(
                onChanged: _filterItems,
              ),
              SizedBox(height: 16.h),

              // Show filtered suggestions ONLY when searching and results exist
              if (_searchQuery.isNotEmpty && filteredItems.isNotEmpty)
                Container(
                  constraints: BoxConstraints(maxHeight: 200.h),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: AppColors.secondary.withOpacity(0.3),
                    ),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      final isSelected = selectedItems.contains(item);
                      return ListTile(
                        title: Text(item),
                        trailing: isSelected
                            ? Icon(Icons.check, color: Colors.green)
                            : null,
                        onTap: () => _onItemSelected(item),
                      );
                    },
                  ),
                )
              else if (_searchQuery.isNotEmpty && filteredItems.isEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Text(
                    'No matching items found.',
                    style:
                        TextStyles.regular.copyWith(color: AppColors.secondary),
                    textAlign: TextAlign.center,
                  ),
                ),

              SizedBox(height: 16.h),

              // Selected chips with grey background
              if (selectedItems.isNotEmpty)
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: selectedItems.map((item) {
                    return Chip(
                      label: Text(item),
                      backgroundColor: Colors.grey[300],
                      deleteIcon: Icon(Icons.close),
                      onDeleted: () => _removeChip(item),
                    );
                  }).toList(),
                ),

              SizedBox(height: 32.h),

              Row(
                children: [
                  SizedBox(width: 180.w),
                  Expanded(
                    child: TextWidgetButton(
                      text: '✓ Complete',
                      onPressed: () {
                        Get.back(result: selectedItems);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
