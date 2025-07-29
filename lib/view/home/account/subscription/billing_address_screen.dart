import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/payment_selector_widget.dart';

class BillingAddressScreen extends StatefulWidget {
  const BillingAddressScreen({super.key});

  @override
  State<BillingAddressScreen> createState() => _BillingAddressScreenState();
}

class _BillingAddressScreenState extends State<BillingAddressScreen> {
  String selectedMethod = 'mastercard'; // default selected method

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
                style: TextStyles.bold.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),
              Text(
                'Billing Address',
                style: TextStyles.medium.copyWith(
                  color: AppColors.black,
                  fontSize: 20.sp,
                ),
                textAlign: TextAlign.start,
              ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment Method',
                    style: TextStyles.medium.copyWith(
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
                isSelected: selectedMethod == 'mastercard',
                onTap: () {
                  setState(() {
                    selectedMethod = 'mastercard';
                  });
                },
              ),
              SizedBox(height: 12.h),
              PaymentSelectorWidget(
                logoPath: 'assets/images/visa.png',
                title: 'Visa',
                isSelected: selectedMethod == 'visa',
                onTap: () {
                  setState(() {
                    selectedMethod = 'visa';
                  });
                },
              ),

              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }
}
