import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;

class SelectHeatingType extends StatelessWidget {
  const SelectHeatingType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [SizedBox(height: 100.h)],
          ),
        ),
      ),
    );
  }
}
