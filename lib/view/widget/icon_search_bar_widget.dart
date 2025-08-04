import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';

class IconSearchBarWidget extends StatelessWidget {
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
