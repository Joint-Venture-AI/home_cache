import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/data/rooms.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/icon_search_bar_widget.dart'
    show IconSearchBarWidget;
import 'package:home_cache/view/widget/text_button_widget.dart';
import 'package:home_cache/view/widget/text_button_widget_light.dart';

class TrackListScreen extends StatefulWidget {
  const TrackListScreen({super.key});

  @override
  _TrackListScreenState createState() => _TrackListScreenState();
}

class _TrackListScreenState extends State<TrackListScreen> {
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'List Anything You Want To Keep Track Of',
                style: TextStyles.bold.copyWith(
                  color: AppColors.secondary,
                  fontSize: 26.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  'We Included Some Things To Help You Get Started',
                  style: TextStyles.medium.copyWith(color: AppColors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16.h),
              IconSearchBarWidget(
                hintText: 'Search rooms or items...',
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
        padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 60.h),
        child: Row(
          children: [
            Expanded(
              child: TextButtonWidgetLight(
                text: 'Skip',
                onPressed: () {
                  Get.toNamed(AppRoutes.finishUtility);
                },
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: TextWidgetButton(
                text: '→  Next  ',
                onPressed: () {
                  Get.toNamed(AppRoutes.selectIteam);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
