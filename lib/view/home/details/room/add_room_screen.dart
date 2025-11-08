import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/data/rooms.dart';
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/home/chat/widgets/faq_search_bar_widget.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';
import 'package:home_cache/utils.dart' as utils;
import 'package:image_picker/image_picker.dart';

import '../../../../model/room_model.dart';

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
      orElse: () => RoomModel(name: type, items: []),
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

  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                type,
                style: AppTypoGraphy.bold.copyWith(
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
                    style: AppTypoGraphy.regular.copyWith(
                      color: AppColors.secondary,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              GestureDetector(
                onTap: () async {
                  final image = await utils.pickSingleImage(
                      context: context, source: ImageSource.gallery);

                  if (image == null) return;
                  final imageData = await image.readAsBytes();

                  setState(() {
                    setState(() {
                      _selectedImage = image;
                    });
                  });
                },
                child: Container(
                  width: 112.w,
                  height: 112.w,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.r)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: _selectedImage == null
                        ? Center(
                            child: SvgPicture.asset(
                              'assets/icons/gallery.svg',
                              width: 72.w,
                            ),
                          )
                        : Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Image.file(
                                _selectedImage!,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedImage = null;
                                  });
                                },
                                child: Container(
                                  width: 20.w,
                                  height: 20.w,
                                  margin: EdgeInsets.only(top: 4.w, right: 4.w),
                                  decoration: BoxDecoration(
                                      color: Colors.red[400],
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Icon(
                                      Icons.close,
                                      size: 14.w,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              FaqSearchBarWidget(
                onChanged: _filterItems,
              ),
              SizedBox(height: 16.h),
              if (_searchQuery.isNotEmpty && filteredItems.isNotEmpty)
                Container(
                  constraints: BoxConstraints(maxHeight: 200.h),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: AppColors.secondary.withAlpha(50),
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
                        AppTypoGraphy.regular.copyWith(color: AppColors.secondary),
                    textAlign: TextAlign.center,
                  ),
                ),
              SizedBox(height: 16.h),
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
