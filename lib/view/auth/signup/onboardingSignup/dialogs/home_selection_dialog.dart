import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/controller/dialong_controller.dart';

import '../../widgets/custom_elevated_button.dart';

class HomeSelectionDialog extends StatelessWidget {
  const HomeSelectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final DialongController controller = Get.find<DialongController>();

    return AlertDialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      contentPadding: EdgeInsets.all(24.w),
      title: Text(
        'Welcome To HomeCache!',
        style: AppTypoGraphy.bold.copyWith(
          color: AppColors.black,
          fontSize: 32.sp,
        ),
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        height: 400.h,
        width: double.maxFinite,
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Text(
              'Track All Your Home\'s Details In One Easy To Access Place',
              style: AppTypoGraphy.regular.copyWith(color: AppColors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.h),
            // Tag selection area
            Expanded(
              child: Obx(() {
                return SingleChildScrollView(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8.w,
                    runSpacing: 8.h,
                    children: controller.tags.map((tag) {
                      final isSelected = controller.selectedTags.contains(tag);
                      return GestureDetector(
                        onTap: () => controller.toggleTag(tag),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primary.withAlpha(200)
                                : AppColors.lightgrey,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.primary.withAlpha(200)
                                  : Colors.grey.shade200,
                            ),
                          ),
                          child: Text(
                            tag,
                            style: AppTypoGraphy.medium.copyWith(
                              color:
                                  isSelected ? Colors.white : AppColors.black,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              }),
            ),

            SizedBox(height: 20.h),

            CustomElevatedButton(
              onTap: () {
                Get.back();
              },
              btnText: 'Next',
              icon: Icons.arrow_forward,
            ),
          ],
        ),
      ),
    );
  }
}
