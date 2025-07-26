import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_cache/constants/colors.dart' show AppColors, primary;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/home/details/provider/filter_dialog.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/icon_search_bar_widget.dart';

import 'package:home_cache/view/widget/provider_list_tile.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 40.w),
                  Text(
                    'Poviders',
                    style: TextStyles.bold.copyWith(color: AppColors.secondary),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.w),
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.addProvider);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Text(
                        '+ Add',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),
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
              SizedBox(height: 24.h),
              Row(
                children: [
                  Text(
                    'Your Providers',
                    style: TextStyles.bold.copyWith(
                      color: AppColors.black,
                      fontSize: 20.sp,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => const FilterDialog(),
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/icons/filter.svg',
                      width: 24.w,
                      height: 24.h,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
              SizedBox(height: 16.h),
              ProviderListTile(
                providerName: 'HVAC Pros',
                lastUsedDate: 'Used on Jul 15, 2025',
                rating: 2,
                isFavorite: false,
                onTap: () {
                  Get.toNamed(AppRoutes.providerDetails);
                },
              ),
              ProviderListTile(
                providerName: 'Bright Electricals',
                lastUsedDate: 'Used on Jul 15, 2025',
                rating: 5,
                isFavorite: true,
                onTap: () {
                  Get.toNamed(AppRoutes.providerDetails);
                },
              ),
              ProviderListTile(
                providerName: 'Bright Electricals',
                lastUsedDate: 'Used on Jul 15, 2025',
                rating: 5,
                isFavorite: true,
                onTap: () {
                  Get.toNamed(AppRoutes.providerDetails);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
