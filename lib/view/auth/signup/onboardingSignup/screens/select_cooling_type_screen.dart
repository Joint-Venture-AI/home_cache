import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/selectable_tiles.dart';
import 'package:home_cache/view/widget/text_button_widget_light.dart';
import 'package:home_cache/view/widget/rounded_search_bar.dart';

import '../../../../../config/route/route_names.dart';
import '../../widgets/custom_elevated_button.dart';

class SelectCoolingTypeScreen extends StatefulWidget {
  const SelectCoolingTypeScreen({super.key});

  @override
  State<SelectCoolingTypeScreen> createState() =>
      _SelectCoolingTypeScreenState();
}

class _SelectCoolingTypeScreenState extends State<SelectCoolingTypeScreen> {
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
                  fontSize: 26.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              Text(
                'Cooling (Select All That Apply)',
                style: TextStyles.medium.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Wrap(
                spacing: 16.w,
                runSpacing: 16.h,
                children: [
                  _buildTile(
                      context, "Central AC", "assets/images/furnace.png", 0),
                  _buildTile(
                      context, "Window Unit", "assets/images/hydonic.png", 1),
                  _buildTile(
                      context, "Mini-Split", "assets/images/radiant.png", 2),
                  _buildTile(
                      context, "Evaporative", "assets/images/furnace.png", 3),
                  _buildTile(
                      context, "Radiant", "assets/images/furnace.png", 4),
                  _buildTile(context, "Fans", "assets/images/fans.png", 5),
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
              SizedBox(height: 100.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButtonWidgetLight(
                    text: 'Skip',
                    onPressed: () {
                      Get.toNamed(RouteNames.finishUtility);
                    },
                  ),


                  CustomElevatedButton(
                      onTap: () => Get.toNamed(RouteNames.selectResponsibleType),
                      icon: Icons.arrow_forward,
                      btnText: 'Next')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTile(
    BuildContext context,
    String title,
    String iconPath,
    int index,
  ) {
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
