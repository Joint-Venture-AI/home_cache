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

class SelectWaterSupplyTypeScreen extends StatefulWidget {
  const SelectWaterSupplyTypeScreen({super.key});

  @override
  State<SelectWaterSupplyTypeScreen> createState() =>
      _SelectPowerTypeScreenState();
}

class _SelectPowerTypeScreenState extends State<SelectWaterSupplyTypeScreen> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBarBack(),
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
                'Water Supply (select all that apply)',
                style: TextStyles.medium.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Wrap(
                spacing: 16.w,
                runSpacing: 16.h,
                children: [
                  _buildTile(context, "Well", "assets/images/well.png", 0),
                  _buildTile(
                    context,
                    "Public Utility",
                    "assets/images/public.png",
                    1,
                  ),
                  _buildTile(context, "Tank", "assets/images/tank.png", 2),
                  _buildTile(
                    context,
                    "Off The Grid",
                    "assets/images/offgrid.png",
                    3,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                'other (not listed),',
                style: TextStyles.bold.copyWith(
                  color: AppColors.primary,
                  fontSize: 20.sp,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 80.h),
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
                        Get.toNamed(AppRoutes.selectHeatingType);
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
    BuildContext context,
    String title,
    String iconPath,
    int index,
  ) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 64.w) / 2,
      child: SelectableTile(
        title: title,
        imageAsset: iconPath,
        isSelected: selectedIndex == index,
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
