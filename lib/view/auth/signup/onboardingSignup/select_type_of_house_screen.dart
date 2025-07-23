import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/selectable_tiles.dart';

class SelectTypeOfHouseScreen extends StatefulWidget {
  const SelectTypeOfHouseScreen({super.key});

  @override
  State<SelectTypeOfHouseScreen> createState() =>
      _SelectTypeOfHouseScreenState();
}

class _SelectTypeOfHouseScreenState extends State<SelectTypeOfHouseScreen> {
  int? selectedIndex;

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
                'What type of house do you live in?',
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
                  _buildTile("Apartment", "assets/icons/apartment.svg", 0),
                  _buildTile("Villa", "assets/icons/villa.svg", 1),
                  _buildTile("Bungalow", "assets/icons/bungalow.svg", 2),
                  _buildTile("Cabin", "assets/icons/cabin.svg", 3),
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
        iconAsset: iconPath,
        isSelected: selectedIndex == index,
        onTap: () => setState(() => selectedIndex = index),
        imageAsset: '',
      ),
    );
  }
}
