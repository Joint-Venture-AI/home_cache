import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/icon_search_bar_widget.dart';
import 'package:home_cache/view/widget/input_field.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBarBack(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Poviders',
                style: TextStyles.bold.copyWith(color: AppColors.secondary),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),
              Text(
                'Search Poviders',
                style: TextStyles.bold.copyWith(
                  color: AppColors.black,
                  fontSize: 20.sp,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6.h),
              IconSearchBarWidget(onChanged: (value) {}),
            ],
          ),
        ),
      ),
    );
  }
}
