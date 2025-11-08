import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:home_cache/controller/onboarding_choice_controller.dart';
import 'package:home_cache/view/auth/signup/widgets/custom_elevated_button.dart';

import '../../../../../config/route/route_names.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/app_typo_graphy.dart';
import '../../../../widget/appbar_back_widget.dart';
import '../../../../widget/text_button_widget_light.dart';

class AddressFormScreen extends StatelessWidget {
  AddressFormScreen({super.key});

  final OnboardingChoiceController controller =
      Get.find<OnboardingChoiceController>();

  Widget _addressSuggestionItem(String text) {
    return InkWell(
      onTap: () => controller.selectAddress(text),
      child: Container(
        padding: EdgeInsets.only(
            left: 24.sp, right: 24.sp, top: 18.sp, bottom: 18.sp),
        child: Text(
          text,
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: const AppBarBack(),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Would You Like To Enter Your Address To Get Some Basic Information About Your Home?',
                  style: AppTypoGraphy.bold.copyWith(
                    color: AppColors.secondary,
                    fontSize: 24.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(18.r),
                  child: Container(
                    width: double.infinity,
                    color: AppColors.lightgrey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: TextField(
                                    controller: controller.addressController,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Your Address',
                                      hintStyle: TextStyle(fontSize: 20.sp),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            InkWell(
                              onTap: controller.clearAddress,
                              child: SvgPicture.asset(
                                'assets/icons/cross.svg',
                                height: 48.h,
                              ),
                            ),
                          ],
                        ),
                        Obx(() => controller.addressSuggestions.isNotEmpty
                            ? Column(
                                children: [
                                  Divider(
                                    color: AppColors.black,
                                    thickness: 1.h,
                                    height: 6.h,
                                  ),
                                  ...controller.addressSuggestions
                                      .map(_addressSuggestionItem)
                                      .toList(),
                                ],
                              )
                            : SizedBox()),
                        SizedBox(height: 8.h),
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: 148.h),
                SizedBox(height: MediaQuery.of(context).size.height * 0.35),
                Text(
                  'More details help us better help you!',
                  style: AppTypoGraphy.bold.copyWith(
                    color: AppColors.primary,
                    fontSize: 24.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.h),
                Row(
                  children: [
                    Expanded(
                      child: TextButtonWidgetLight(
                        text: 'Skip',
                        onPressed: () => Get.toNamed('/finishUtility'),
                      ),
                    ),
                    SizedBox(width: 100.w),
                    CustomElevatedButton(
                      onTap: () {
                        if (controller.selectedAddress.value != null) {
                          print(
                              'Selected Address: ${controller.selectedAddress.value}');
                          Get.toNamed(RouteNames.selectPowerType);
                        } else {
                          Get.snackbar(
                              'Error', 'Please select or enter an address');
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
      ),
    );
  }
}
