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

class SelectWaterSupplyTypeScreen extends StatefulWidget {
  const SelectWaterSupplyTypeScreen({super.key});

  @override
  State<SelectWaterSupplyTypeScreen> createState() =>
      _SelectWaterSupplyTypeScreenState();
}

class _SelectWaterSupplyTypeScreenState
    extends State<SelectWaterSupplyTypeScreen> {
  final Set<int> selectedIndexes = {};
  bool isOtherSelected = false;
  final AuthController authController = Get.put(AuthController());

  final TextEditingController otherController = TextEditingController();

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
                style: AppTypoGraphy.bold.copyWith(
                  color: AppColors.secondary,
                  fontSize: 26.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              Text(
                'Water Supply (Select All That Apply)',
                style: AppTypoGraphy.medium.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),
              Wrap(
                spacing: 16.w,
                runSpacing: 16.h,
                children: [
                  _buildTile(context, "Well", "assets/images/well.png", 0),
                  _buildTile(context, "Public Utility",
                      "assets/images/publicutility.png", 1),
                  _buildTile(context, "Tank", "assets/images/tank.png", 2),
                  _buildTile(
                      context, "Off The Grid", "assets/images/offgrid.png", 3),
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
                  style: AppTypoGraphy.bold.copyWith(
                    color: AppColors.primary,
                    fontSize: 20.sp,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              if (isOtherSelected) ...[
                SizedBox(height: 16.h),
                RoundedSearchBar(
                  controller: otherController,
                ),
              ],
              SizedBox(height: 80.h),
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
                      List<String> selectedWaterTypes =
                          selectedIndexes.map((i) {
                        final waterTypes = [
                          "Well",
                          "Public Utility",
                          "Tank",
                          "Off The Grid"
                        ];
                        return waterTypes[i];
                      }).toList();

                      // Include "Other" if typed
                      if (isOtherSelected && otherController.text.isNotEmpty) {
                        selectedWaterTypes.add(otherController.text.trim());
                      }

                      if (selectedWaterTypes.isNotEmpty) {
                        authController
                            .updateHomeWaterSupplyType(selectedWaterTypes);
                        Get.toNamed(RouteNames.selectHeatingType);
                      } else {
                        Get.snackbar('Error',
                            'Please select or enter at least one water supply type');
                      }
                    },
                    icon: Icons.arrow_forward,
                    btnText: 'Next',
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
