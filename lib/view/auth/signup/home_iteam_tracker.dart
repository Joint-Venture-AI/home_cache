import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/data/rooms.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
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
              (item) => item.toLowerCase().contains(query.toLowerCase())),
        );
      }

      _suggestions = _suggestions.toSet().toList()..sort();
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
            mainAxisAlignment: MainAxisAlignment.center,
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
              Text(
                'We included some things to help you get started!',
                style: TextStyles.medium.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              IconSearchBarWidget(
                hintText: 'Search rooms or items...',
                onChanged: _updateSuggestions,
                suggestions: _suggestions,
              ),
              SizedBox(height: 340.h),
              Row(
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
            ],
          ),
        ),
      ),
    );
  }
}

class IconSearchBarWidget extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;
  final List<String> suggestions;

  const IconSearchBarWidget({
    super.key,
    this.hintText = 'Search...',
    this.onChanged,
    this.suggestions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            filled: true,
            fillColor: AppColors.white,
            prefixIcon: Padding(
              padding: EdgeInsets.all(12.w),
              child: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 20.w,
                height: 20.h,
              ),
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.all(12.w),
              child: SvgPicture.asset(
                'assets/icons/mic.svg',
                width: 20.w,
                height: 20.h,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 0.h),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.grey, width: 2.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.grey, width: 2.w),
            ),
          ),
        ),
        if (suggestions.isNotEmpty) ...[
          SizedBox(height: 8.h),
          Container(
            constraints: BoxConstraints(maxHeight: 200.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: suggestions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    suggestions[index],
                    style: TextStyles.medium.copyWith(color: AppColors.black),
                  ),
                  onTap: () {
                    onChanged?.call(suggestions[index]);
                  },
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}
