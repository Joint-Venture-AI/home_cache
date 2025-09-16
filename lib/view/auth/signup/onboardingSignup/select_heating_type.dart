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

class SelectHeatingTypeScreen extends StatefulWidget {
  const SelectHeatingTypeScreen({super.key});

  @override
  State<SelectHeatingTypeScreen> createState() =>
      _SelectHeatingTypeScreenState();
}

class _SelectHeatingTypeScreenState extends State<SelectHeatingTypeScreen> {
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
                'Next, Let’s Cover Your Utilities',
                style: TextStyles.bold.copyWith(
                  color: AppColors.secondary,
                  fontSize: 24.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              Text(
                'Heating (Select All That Apply)',
                style: TextStyles.medium.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Wrap(
                spacing: 16.w,
                runSpacing: 16.h,
                children: [
                  _buildTile(
                      context, "Furnace", "assets/images/furnace.png", 0),
                  _buildTile(
                      context, "Hydronic", "assets/images/hydonic.png", 1),
                  _buildTile(
                      context, "Radiant", "assets/images/radiant.png", 2),
                  _buildTile(
                      context, "Heatpump", "assets/images/furnace.png", 3),
                  _buildTile(
                      context, "Wood Stove", "assets/images/wood.png", 4),
                  _buildTile(
                      context, "Baseboard", "assets/images/baseboard.png", 5),
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
                  'Other (not listed)',
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
              SizedBox(height: 50.h),
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
                        Get.toNamed(AppRoutes.selectHeatPowerType);
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
