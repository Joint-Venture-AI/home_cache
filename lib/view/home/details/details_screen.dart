import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(24.sp),
            child: Text(
              "Details",
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
