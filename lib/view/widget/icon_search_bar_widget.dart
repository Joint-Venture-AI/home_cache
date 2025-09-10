import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';

class IconSearchBarWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final Function(String)? onChanged;
  final List<String> suggestions;
  final Function(String)? onSuggestionTap;

  const IconSearchBarWidget({
    super.key,
    this.hintText = 'Search...',
    this.onChanged,
    this.suggestions = const [],
    this.onSuggestionTap,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          style: TextStyle(
            color: AppColors.black,
            fontSize: 16.sp,
          ),
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            filled: true,
            fillColor: AppColors.white,
            prefixIcon: Icon(
              Icons.search,
              color: AppColors.grey,
              size: 20.w,
            ),
            suffixIcon: Icon(
              Icons.mic,
              color: AppColors.grey,
              size: 20.w,
            ),
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
              color: AppColors.primary.withOpacity(.3),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: suggestions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    suggestions[index],
                    style: TextStyles.regular.copyWith(color: AppColors.black),
                  ),
                  onTap: () => onSuggestionTap?.call(suggestions[index]),
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}
