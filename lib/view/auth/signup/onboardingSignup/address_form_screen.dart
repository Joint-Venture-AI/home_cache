import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';
import 'package:home_cache/view/widget/text_button_widget_light.dart';

class AddressFormScreen extends StatefulWidget {
  const AddressFormScreen({super.key});

  @override
  State<AddressFormScreen> createState() => _AddressFormScreenState();
}

class _AddressFormScreenState extends State<AddressFormScreen> {
  Widget _addressSuggestionItem(String text) {
    return Container(
      padding: EdgeInsets.only(
        left: 24.sp,
        right: 24.sp,
        top: 18.sp,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 20.sp),
      ),
    );
  }

  List<String> _addressSuggestions = [];
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _addressController.addListener(
      () {
        if (_addressController.text.isEmpty) {
          if (_addressSuggestions.isNotEmpty) {
            setState(() {
              _addressSuggestions = [];
            });
          }
        } else {
          if (_addressSuggestions.isEmpty) {
            setState(() {
              _addressSuggestions = [
                '123 Home Ln example, Los Angeles, ca 123456',
                '123 Home Ln example, Los Angeles, ca 123456',
              ];
            });
          }
        }
      },
    );
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Would You Like To Enter Your Address To Get Some Basic Information About Your Home?',
                  style: TextStyles.bold.copyWith(
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
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    controller: _addressController,
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
                            SvgPicture.asset(
                              'assets/icons/cross.svg',
                              height: 48.h,
                            ),
                          ],
                        ),
                        if (_addressSuggestions.isNotEmpty)
                          Divider(
                            color: AppColors.black,
                            thickness: 1.h,
                            height: 6.h,
                          ),
                        ..._addressSuggestions
                            .map(_addressSuggestionItem)
                            .toList(),
                        SizedBox(height: 8.h),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 148.h),
                Text(
                  'More details help us better help you!',
                  style: TextStyles.bold.copyWith(
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
                          Get.toNamed(AppRoutes.selectPowerType);
                        },
                      ),
                    ),
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
