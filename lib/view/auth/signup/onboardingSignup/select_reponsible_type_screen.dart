import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/selectable_tiles.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';
import 'package:home_cache/view/widget/text_button_widget_light.dart';
import 'package:home_cache/view/widget/rounded_search_bar.dart';

class SelectResponsibleTypeScreen extends StatefulWidget {
  const SelectResponsibleTypeScreen({super.key});

  @override
  State<SelectResponsibleTypeScreen> createState() =>
      _SelectResponsibleTypeScreenState();
}

class _SelectResponsibleTypeScreenState
    extends State<SelectResponsibleTypeScreen> {
  final Set<int> selectedIndexes = {};
  bool isOtherSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: const AppBarBack(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 2.h),
              Text(
                'You Or The City?',
                style: TextStyles.bold.copyWith(
                  color: AppColors.secondary,
                  fontSize: 26.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              Text(
                'Select what you are responsible for (select all that apply)',
                style: TextStyles.medium.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Wrap(
                spacing: 16.w,
                runSpacing: 16.h,
                children: [
                  _buildTile(context, "Sewage", "assets/images/sewage.png", 0),
                  _buildTile(context, "Water", "assets/images/water.png", 1),
                  _buildTile(context, "Waste", "assets/images/waste.png", 2),
                  _buildTile(
                      context, "Recycling", "assets/images/recycling.png", 3),
                ],
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isOtherSelected = true;
                    selectedIndexes.clear();
                  });
                },
                child: Text(
                  'other (not listed),',
                  style: TextStyles.bold.copyWith(
                    color: AppColors.primary,
                    fontSize: 20.sp,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              if (isOtherSelected) ...[
                SizedBox(height: 16.h),
                const RoundedSearchBar(),
              ],
              SizedBox(height: 100.h),
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
                  SizedBox(width: 100.w),
                  Expanded(
                    child: TextWidgetButton(
                      text: '→  Next  ',
                      onPressed: () {
                        Get.toNamed(AppRoutes.finishUtility);
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

  Widget _buildTile(
      BuildContext context, String title, String iconPath, int index) {
    final isSelected = selectedIndexes.contains(index) && !isOtherSelected;

    return SizedBox(
      width: (MediaQuery.of(context).size.width - 64.w) / 2,
      child: SelectableTile(
        title: title,
        imageAsset: iconPath,
        isSelected: isSelected,
        onTap: () {
          setState(() {
            isOtherSelected = false;
            if (isSelected) {
              selectedIndexes.remove(index);
            } else {
              selectedIndexes.add(index);
            }
          });
        },
      ),
    );
  }
}
