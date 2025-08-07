import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/icon_search_bar_widget.dart';
import 'package:home_cache/view/widget/question_tile_widget.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';

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
                  question: 'Why is my circuit breaker constantly tripping?',
                  answer:
                      'Common causes include overloaded circuits, short circuits, or faulty appliances. Unplug devices and reset. If it persists, call an electrician.',
                ),
                QuestionTile(
                  question: 'How do I prevent mold in my bathroom?',
                  answer:
                      'Use ventilation fans, wipe down wet surfaces, keep humidity under 50%, and clean with vinegar or mold cleaners.',
                ),
                QuestionTile(
                  question:
                      'Why is my water pressure low, and how do I fix it?',
                  answer:
                      'Check for clogged aerators, leaks, pressure regulator issues, or municipal problems. Clean fixtures and call a plumber if it persists.',
                ),
                QuestionTile(
                  question:
                      'What causes cracks in walls or ceilings, and should I worry?',
                  answer:
                      'Hairline cracks are usually from settling and not serious. Large or widening cracks may indicate structural issues and should be evaluated.',
                ),
                QuestionTile(
                  question: 'What should I do to prepare my home for winter?',
                  answer:
                      'Seal windows/doors, service heating system, drain outdoor faucets, check roof/gutters, insulate pipes to avoid freezing and energy loss.',
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
