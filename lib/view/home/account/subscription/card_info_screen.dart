import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart' show AppColors, secondary;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';
import 'package:home_cache/view/widget/text_field_widget.dart';

class CardInfoScreen extends StatefulWidget {
  const CardInfoScreen({super.key});

  @override
  State<CardInfoScreen> createState() => _CardInfoScreenState();
}

class _CardInfoScreenState extends State<CardInfoScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Credit Card',
                style: TextStyles.bold.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.all(20.dg),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'MasterCard',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Image.asset('assets/images/master.png', width: 40.w),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      '****   ****   ****   ****',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sophie T.',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          '15/36',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'Cardholder name',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
              ),
              SizedBox(height: 6.h),
              TextFieldWidget(),
              SizedBox(height: 16.h),
              Text(
                'Card number',
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
              ),
              SizedBox(height: 6.h),
              TextFieldWidget(),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expires',
                          style: TextStyles.semiBold.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        TextFieldWidget(),
                        SizedBox(height: 16.h),
                      ],
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CVV',
                          style: TextStyles.semiBold.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        TextFieldWidget(),
                        SizedBox(height: 16.h),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    activeColor: AppColors.primary,
                  ),
                  Text(
                    'Save Card details for next time.',
                    style: TextStyles.regular.copyWith(color: AppColors.black),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Column(
                  children: [
                    TextWidgetButton(
                      text: 'Add Card',
                      onPressed: () {
                        //  Get.toNamed(AppRoutes.selectHouse);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
