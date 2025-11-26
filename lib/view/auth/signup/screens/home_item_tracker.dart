import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/data/rooms.dart';
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/controller/auth_controller.dart';
import 'package:home_cache/view/auth/signup/widgets/custom_elevated_button.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/home/chat/widgets/faq_search_bar_widget.dart'
    show FaqSearchBarWidget;
import 'package:home_cache/view/widget/text_button_widget_light.dart';

import '../../../../config/route/route_names.dart';

class TrackListScreen extends StatefulWidget {
  const TrackListScreen({super.key});

  @override
  _TrackListScreenState createState() => _TrackListScreenState();
}

class _TrackListScreenState extends State<TrackListScreen> {
  final TextEditingController _searchController = TextEditingController();

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
        _searchQuery = "";
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

  final AuthController authController = Get.put(AuthController());

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
                style: AppTypoGraphy.bold.copyWith(
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
                  style: AppTypoGraphy.medium.copyWith(color: AppColors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16.h),
              FaqSearchBarWidget(
                controller: _searchController,
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
                      label: Text(
                        item,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      backgroundColor: AppColors.lightgrey.withAlpha(180),
                      side: BorderSide(color: AppColors.grey.shade300),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButtonWidgetLight(
              text: 'Skip',
              onPressed: () {
                Get.toNamed(RouteNames.finishUtility);
              },
            ),
            Obx(
              () => CustomElevatedButton(
                width: 128.w,
                onTap: () {
                  if (_selectedItems.isEmpty) {
                    Get.snackbar(
                        'Error', 'Please select at least one item to track');
                    return;
                  }

                  authController.updateWantToTrack(_selectedItems);

                  // ! submit all data
                  authController.submitHomeData();
                },
                btnText: authController.isLoading.value ? 'Loading' : 'Confirm',
                icon: Icons.check,
              ),
            )
          ],
        ),
      ),
    );
  }
}
