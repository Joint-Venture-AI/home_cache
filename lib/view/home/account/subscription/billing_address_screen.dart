import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/config/route/routes.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/home/account/widgets/payment_selector_widget.dart';
import 'package:home_cache/view/home/account/widgets/subscription_plan_widget.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';

import '../../../../config/route/route_names.dart';

class BillingAddressScreen extends StatefulWidget {
  const BillingAddressScreen({super.key});

  @override
  State<BillingAddressScreen> createState() => _BillingAddressScreenState();
}

class _BillingAddressScreenState extends State<BillingAddressScreen> {
  String selectedPaymentMethod = 'mastercard';
  String selectedSubscriptionPlan = 'annual';

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
                'Subscription',
                style: AppTypoGraphy.bold.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),

              Text(
                'Billing Address',
                style: AppTypoGraphy.medium.copyWith(
                  color: AppColors.black,
                  fontSize: 20.sp,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 8.h),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/map.png',
                      width: 48.w,
                      height: 48.w,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        '2972 Westminster Rd. Los Angeles,\nCalifornia 90089',
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),

              /// Payment Method Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment Method',
                    style: AppTypoGraphy.medium.copyWith(
                      color: AppColors.black,
                      fontSize: 20.sp,
                    ),
                  ),
                  Text(
                    'Add New Card',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),

              PaymentSelectorWidget(
                logoPath: 'assets/images/master.png',
                title: 'Mastercard',
                isSelected: selectedPaymentMethod == 'mastercard',
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = 'mastercard';
                  });
                },
              ),
              SizedBox(height: 12.h),

              PaymentSelectorWidget(
                logoPath: 'assets/images/visa.png',
                title: 'Visa',
                isSelected: selectedPaymentMethod == 'visa',
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = 'visa';
                  });
                },
              ),
              SizedBox(height: 12.h),

              PaymentSelectorWidget(
                logoPath: 'assets/images/paypal.png',
                title: 'Paypal',
                isSelected: selectedPaymentMethod == 'paypal',
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = 'paypal';
                  });
                },
              ),
              SizedBox(height: 12.h),

              PaymentSelectorWidget(
                logoPath: 'assets/images/apple.png',
                title: 'Apple Pay',
                isSelected: selectedPaymentMethod == 'applepay',
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = 'applepay';
                  });
                },
              ),
              SizedBox(height: 24.h),

              Text(
                'Subscription Plan',
                style: AppTypoGraphy.medium.copyWith(
                  color: AppColors.black,
                  fontSize: 20.sp,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 12.h),

              SubscriptionPlanWidget(
                title: 'Annual',
                subtitle: 'Renews (1/1/2026)',
                isSelected: selectedSubscriptionPlan == 'annual',
                onTap: () {
                  setState(() {
                    selectedSubscriptionPlan = 'annual';
                  });
                },
              ),
              SizedBox(height: 12.h),

              SubscriptionPlanWidget(
                title: 'Monthly',
                subtitle: '\$84.99/year (\$6.67/month)',
                isSelected: selectedSubscriptionPlan == 'monthly',
                onTap: () {
                  setState(() {
                    selectedSubscriptionPlan = 'monthly';
                  });
                },
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Column(
                  children: [
                    TextWidgetButton(
                      text: 'Confirm',
                      onPressed: () {
                        Get.toNamed(RouteNames.cardInfo);
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
