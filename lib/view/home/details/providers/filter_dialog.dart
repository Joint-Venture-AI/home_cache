import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  String? selectedUsageFilter;

  Map<int, bool> selectedRatings = {};
  Map<String, bool> selectedServices = {};

  final List<String> usageOptions = [
    'Past 30 Days',
    'Past 90 Days',
    'Past Year',
    '2+ Years',
  ];

  final List<int> ratingOptions = [5, 4, 3, 2, 1];

  final List<String> serviceTypes = [
    'Plumber',
    'HVAC',
    'General Contractor',
    'Painter',
    'Landscaper',
    'Electrician',
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 8.w),
      child: SizedBox(
        width: double.infinity,
        child: Container(
          // height: 500.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.primary.withOpacity(.5),
              width: 3.w,
            ),
          ),
          padding: EdgeInsets.all(16.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Sort & Filter Your Providers',
                  style: TextStyles.bold.copyWith(
                    color: AppColors.black,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 12.h),
                _sectionTitle('Last Used'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: usageOptions.sublist(0, 3).map((title) {
                    return Expanded(child: _buildCheckbox(title));
                  }).toList(),
                ),
                Row(
                  children: [Expanded(child: _buildCheckbox(usageOptions[3]))],
                ),
                SizedBox(height: 16.h),
                _sectionTitle('Rating'),
                Wrap(
                  spacing: 12.w,
                  runSpacing: 8.h,
                  children: ratingOptions
                      .map((rating) => _buildStarRatingCheckbox(rating))
                      .toList(),
                ),
                SizedBox(height: 16.h),
                _sectionTitle('Favorite'),
                Row(
                  children: [
                    _buildFavoriteCheckbox(true),
                    SizedBox(
                      width: 24.w,
                    ),
                    _buildFavoriteCheckbox(false),
                  ],
                ),
                SizedBox(height: 16.h),
                _sectionTitle('Service Type'),
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: serviceTypes
                      .map((type) => _buildServiceCheckbox(type))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox(String title) {
    final bool isSelected = selectedUsageFilter == title;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Row(
        children: [
          Checkbox(
            value: isSelected,
            activeColor: AppColors.primaryLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            onChanged: (_) {
              setState(() {
                selectedUsageFilter = isSelected ? null : title;
              });
            },
          ),
          Flexible(
            child: Text(
              title,
              style: TextStyles.regular.copyWith(
                fontSize: 12.sp,
                color: AppColors.black.withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool? favoriteFilter;

  Widget _buildFavoriteCheckbox(bool favorite) {
    return GestureDetector(
      onTap: () {
        if (favoriteFilter == null || favoriteFilter != favorite) {
          setState(() {
            favoriteFilter = favorite;
          });
        } else {
          setState(() {
            favoriteFilter = null;
          });
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: favoriteFilter == favorite,
            activeColor: AppColors.primaryLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            onChanged: (val) {
              if (favoriteFilter == null || favoriteFilter != favorite) {
                setState(() {
                  favoriteFilter = favorite;
                });
              } else {
                setState(() {
                  favoriteFilter = null;
                });
              }
            },
          ),
          Icon(
            favorite ? Icons.favorite : Icons.favorite_border,
            color: favorite ? Colors.red : Colors.grey,
            size: 20.sp,
          ),
        ],
      ),
    );
  }

  Widget _buildStarRatingCheckbox(int rating) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRatings[rating] = !(selectedRatings[rating] ?? false);
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: selectedRatings[rating] ?? false,
            activeColor: AppColors.primaryLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            onChanged: (val) {
              setState(() {
                selectedRatings[rating] = val ?? false;
              });
            },
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              return Icon(
                index < rating ? Icons.star_rounded : Icons.star_border_rounded,
                color: AppColors.primaryLight,
                size: 16.sp,
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCheckbox(String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedServices[title] = !(selectedServices[title] ?? false);
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: selectedServices[title] ?? false,
            activeColor: AppColors.primaryLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            onChanged: (val) {
              setState(() {
                selectedServices[title] = val ?? false;
              });
            },
          ),
          Text(
            title,
            style: TextStyles.regular.copyWith(
              fontSize: 12.sp,
              color: AppColors.black.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.bold.copyWith(
            color: AppColors.black,
            fontSize: 16.sp,
          ),
        ),
        Divider(color: AppColors.black, thickness: 1.h, height: 12.h),
      ],
    );
  }
}
