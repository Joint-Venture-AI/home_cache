import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:home_cache/constants/colors.dart'
    show AppColors, primary, secondary;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/subscription_tile_widget.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Subscription',
                style: TextStyles.bold.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.all(12.0.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0).r,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/dot.png',
                      height: 20.h,

                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sophie T',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '2972 Westminster Rd.',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Los Angeles, California, 90089',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: AppColors.primary),
              SizedBox(height: 12.h),
              SubscriptionTileWidget(
                title: 'Annual Subscription',
                paymentMethod: 'Mastercard',
                renewalDate: '1/1/2026',
                onTap: () {
                  Get.toNamed(AppRoutes.billingAddress);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
