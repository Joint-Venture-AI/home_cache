import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';

class SubscriptionTileWidget extends StatelessWidget {
  final String title;
  final String paymentMethod;
  final String renewalDate;
  final VoidCallback? onTap;

  const SubscriptionTileWidget({
    super.key,
    required this.title,
    required this.paymentMethod,
    required this.renewalDate,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),

          Row(
            children: [
              Expanded(
                child: Text(
                  paymentMethod,
                  style: TextStyle(fontSize: 14.sp, color: Colors.black),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16.sp,
                color: AppColors.secondary,
              ),
            ],
          ),

          Text(
            'Renews ($renewalDate)',
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
