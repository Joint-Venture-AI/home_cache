import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart' show AppColors, black;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/constants/data/rooms.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/icon_search_bar_widget.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';
import 'package:home_cache/utils.dart' as utils;
import 'package:image_picker/image_picker.dart';

class SelectItemScreen extends StatefulWidget {
  const SelectItemScreen({super.key});

  @override
  State<SelectItemScreen> createState() => _SelectIteamScreenState();
}

class _SelectIteamScreenState extends State<SelectItemScreen> {
  final TextEditingController _searchController = TextEditingController();

  File? _selectedImage;
  Uint8List? _selectedImageData;

  String _searchQuery = '';
  List<String> _suggestions = [];
  List<String> _selectedItems = [];

  void _updateSuggestions(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _suggestions = [];
        return;
      }
      _suggestions = [];
      for (var room in rooms) {
        if (room.name.toLowerCase().contains(query.toLowerCase())) {
          _suggestions.add(room.name);
        }
        _suggestions.addAll(
          room.items.where(
            (item) => item.toLowerCase().contains(query.toLowerCase()),
          ),
        );
      }

      _suggestions = _suggestions.toSet().toList()
        ..removeWhere(_selectedItems.contains)
        ..sort();
    });
  }

  void _onSuggestionTap(String value) {
    setState(() {
      if (!_selectedItems.contains(value)) {
        _selectedItems.add(value);
        _searchQuery = '';
        _searchController.clear();
        _suggestions = [];
      }
    });
  }

  void _removeLastItem() {
    if (_selectedItems.isNotEmpty) {
      setState(() {
        _selectedItems.removeLast();
      });
    }
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Room Name',
                style: TextStyles.bold.copyWith(
                  color: AppColors.black,
                  fontSize: 26.sp,
                ),
                textAlign: TextAlign.center,
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
                      _selectedImageData = imageData;
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
                    child: _selectedImageData == null
                        ? Center(
                            child: SvgPicture.asset(
                              'assets/icons/gallery.svg',
                              width: 72.w,
                            ),
                          )
                        : Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Image.memory(
                                _selectedImageData!,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedImage = null;
                                    _selectedImageData = null;
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
              IconSearchBarWidget(
                controller: _searchController,
                hintText: "Search items...",
                onChanged: _updateSuggestions,
                suggestions: _suggestions,
                onSuggestionTap: _onSuggestionTap,
              ),
              SizedBox(height: 16.h),
              if (_selectedItems.isNotEmpty)
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: List.generate(_selectedItems.length, (index) {
                    final item = _selectedItems[index];
                    return Chip(
                      label: Text(item),
                      backgroundColor: AppColors.lightgrey,
                      deleteIcon: Icon(Icons.close, size: 18.sp),
                      onDeleted: () {
                        setState(() {
                          _selectedItems.removeAt(index);
                        });
                      },
                    );
                  }),
                ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 60.h),
        child: Row(
          children: [
            SizedBox(width: 180.w),
            Expanded(
              child: TextWidgetButton(
                text: '✓  Complete  ',
                onPressed: () {
                  Get.toNamed(AppRoutes.addDetailsIteam);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
