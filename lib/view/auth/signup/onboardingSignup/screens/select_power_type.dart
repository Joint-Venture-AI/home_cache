import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/controller/auth_controller.dart';
import 'package:home_cache/view/auth/signup/widgets/custom_elevated_button.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/selectable_tiles.dart';
import 'package:home_cache/view/widget/text_button_widget_light.dart';
import 'package:home_cache/view/widget/rounded_search_bar.dart';

import '../../../../../config/route/route_names.dart';

class SelectPowerTypeScreen extends StatefulWidget {
  const SelectPowerTypeScreen({super.key});

  @override
  State<SelectPowerTypeScreen> createState() => _SelectPowerTypeScreenState();
}

class _SelectPowerTypeScreenState extends State<SelectPowerTypeScreen> {
  final List<int> _selectedIndexes = [];
  bool isOtherSelected = false;
  final TextEditingController otherController = TextEditingController();
  final AuthController authController = Get.put(AuthController());

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
                'What Powers Your Home?',
                style: AppTypoGraphy.bold.copyWith(
                  color: AppColors.secondary,
                  fontSize: 26.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              Text(
                'Power Type (Select All That Apply)',
                style: AppTypoGraphy.medium.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Wrap(
                spacing: 16.w,
                runSpacing: 16.h,
                children: [
                  _buildTile(
                      context, "Electric", "assets/images/electric.png", 0),
                  _buildTile(context, "Solar", "assets/images/solar.png", 1),
                  _buildTile(context, "Gas", "assets/images/gas.png", 2),
                  _buildTile(
                      context, "Off The Grid", "assets/images/offgrid.png", 3),
                ],
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isOtherSelected = true;
                  });
                },
                child: Text(
                  'Other (not listed)',
                  style: AppTypoGraphy.bold.copyWith(
                    color: AppColors.primary,
                    fontSize: 20.sp,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              if (isOtherSelected) ...[
                SizedBox(height: 16.h),
                RoundedSearchBar(
                  controller: otherController,
                ),
              ],
              SizedBox(height: 72.h),
              Row(
                children: [
                  Expanded(
                    child: TextButtonWidgetLight(
                      text: 'Skip',
                      onPressed: () {
                        Get.toNamed(RouteNames.finishUtility);
                      },
                    ),
                  ),
                  SizedBox(width: 100.w),
                  CustomElevatedButton(
                    onTap: () {
                      List<String> selectedPowerTypes =
                          _selectedIndexes.map((i) {
                        final types = [
                          "Electric",
                          "Solar",
                          "Gas",
                          "Off The Grid"
                        ];
                        return types[i];
                      }).toList();

                      // Add "Other" if typed
                      if (isOtherSelected && otherController.text.isNotEmpty) {
                        selectedPowerTypes.add(otherController.text.trim());
                      }

                      if (selectedPowerTypes.isNotEmpty) {
                        authController.updateHomePowerType(selectedPowerTypes);
                        Get.toNamed(RouteNames.selectWaterSupply);
                      } else {
                        Get.snackbar(
                            'Error', 'Please select at least one power type');
                      }
                    },
                    btnText: 'Next',
                    icon: Icons.arrow_forward,
                  )
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
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 64.w) / 2,
      child: SelectableTile(
        title: title,
        imageAsset: iconPath,
        isSelected: _selectedIndexes.contains(index),
        onTap: () {
          if (_selectedIndexes.contains(index)) {
            setState(() {
              _selectedIndexes.removeAt(_selectedIndexes.indexOf(index));
            });
          } else {
            setState(() {
              _selectedIndexes.add(index);
            });
          }
        },
      ),
    );
  }
}
