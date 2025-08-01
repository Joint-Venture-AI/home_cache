import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';

class RecentActivityTab extends StatelessWidget {
  const RecentActivityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
                    Row(
                      children: [
                        Text(
                          'New User Joined',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text('8 hours ago', style: TextStyle(fontSize: 16.sp)),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Ahsan was invited',
                      style: TextStyle(fontSize: 14, color: AppColors.black),
                    ),
                    Divider(color: AppColors.primary),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
