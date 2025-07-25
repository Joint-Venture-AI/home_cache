import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/icon_search_bar_widget.dart';
import 'package:home_cache/view/widget/question_tile_widget.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';
import 'package:home_cache/view/widget/text_button_widget_light.dart';

class HandyChatScreen extends StatelessWidget {
  const HandyChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 16.h),
                Text(
                  'Home Questions? Let’s Get you Answers!',
                  style: TextStyles.bold.copyWith(
                    color: AppColors.secondary,
                    fontSize: 24.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                Text(
                  'FAQs',
                  style: TextStyles.bold.copyWith(
                    color: AppColors.black,
                    fontSize: 24.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 6.h),
                IconSearchBarWidget(onChanged: (value) {}),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Container(
                      width: 150.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.secondary.withOpacity(.7),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Text(
                        'Popular Topics',
                        style: TextStyles.bold.copyWith(
                          color: AppColors.black,
                          fontSize: 18.sp,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                QuestionTile(
                  question: 'Question #1',
                  answer: 'Question sample 1',
                ),
                QuestionTile(
                  question: 'Question #2',
                  answer: 'Question sample 1',
                ),
                QuestionTile(
                  question: 'Question #3',
                  answer: 'Question sample 1',
                ),
                QuestionTile(
                  question: 'Question #4',
                  answer: 'Question sample 1',
                ),
                SizedBox(height: 16.h),
                Text(
                  'Need something more specific?',
                  style: TextStyles.bold.copyWith(
                    color: AppColors.black,
                    fontSize: 20.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                TextWidgetButton(
                  text: 'Try Handy Chat',
                  onPressed: () {
                    Get.toNamed(AppRoutes.chat);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
