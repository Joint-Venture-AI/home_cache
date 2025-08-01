import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/auth/signup/onboardingSignup/dialogs/first_dialog.dart';
import 'package:home_cache/view/auth/signup/onboardingSignup/dialogs/second_dialog.dart';
import 'package:home_cache/view/auth/signup/onboardingSignup/dialogs/third_dialog.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/selectable_tiles.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';
import 'package:home_cache/view/widget/text_button_widget_light.dart';

class SelectTypeOfHouseScreen extends StatefulWidget {
  const SelectTypeOfHouseScreen({super.key});

  @override
  State<SelectTypeOfHouseScreen> createState() =>
      _SelectTypeOfHouseScreenState();
}

class _SelectTypeOfHouseScreenState extends State<SelectTypeOfHouseScreen> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 0), () {
        _showFirstDialog();
      });
    });
  }

  void _showFirstDialog() {
    showDialog(
      context: context,
      builder: (context) => const FirstDialog(),
    ).then((_) => _showSecondDialog());
  }

  void _showSecondDialog() {
    showDialog(
      context: context,
      builder: (context) => const SecondDialog(),
    ).then((_) => _showThirdDialog());
  }

  void _showThirdDialog() {
    showDialog(context: context, builder: (context) => const ThirdDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: const AppBarBack(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jess,',
                style: TextStyles.bold.copyWith(
                  color: AppColors.primary,
                  fontSize: 32.sp,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                'What Type Of House Do You Live In?',
                style: TextStyles.bold.copyWith(
                  color: AppColors.secondary,
                  fontSize: 26.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              Wrap(
                spacing: 16.w,
                runSpacing: 16.h,
                children: [
                  _buildTile("House", "assets/images/house.png", 0),
                  _buildTile("Condo", "assets/images/condo.png", 1),
                  _buildTile("Townhouse", "assets/images/townhouse.png", 2),
                  _buildTile("Apartment", "assets/images/apartment.png", 3),
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
              SizedBox(height: 72.h),
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
                        Get.toNamed(AppRoutes.homeInfo);
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

  Widget _buildTile(String title, String iconPath, int index) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 64.w) / 2,
      child: SelectableTile(
        title: title,
        imageAsset: iconPath,
        isSelected: selectedIndex == index,
        onTap: () => setState(() => selectedIndex = index),
      ),
    );
  }
}
