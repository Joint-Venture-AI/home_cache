import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/constants/data/rooms.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/icon_search_bar_widget.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';

class SelectIteamScreen extends StatefulWidget {
  const SelectIteamScreen({super.key});

  @override
  State<SelectIteamScreen> createState() => _SelectIteamScreenState();
}

class _SelectIteamScreenState extends State<SelectIteamScreen> {
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              Image.asset("assets/images/item.png", height: 90.h),
              SizedBox(height: 32.h),
              IconSearchBarWidget(
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
                    final isLast = index == _selectedItems.length - 1;
                    return Chip(
                      label: Text(item),
                      backgroundColor: AppColors.lightgrey,
                      deleteIcon:
                          isLast ? Icon(Icons.close, size: 18.sp) : null,
                      onDeleted: isLast ? _removeLastItem : null,
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
