import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/data/app_constants.dart';
import 'package:home_cache/services/prefs_helper.dart';

import '../../../config/route/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    String? token = await PrefsHelper.getString(AppConstants.bearerToken);
    if (token != null && token.isNotEmpty) {
      await Future.delayed(Duration(seconds: 3));
      if (mounted) {
        Get.offNamed(RouteNames.bottomNav);
      }
    } else {
      Get.offNamed(RouteNames.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/homecache_logo.gif', width: 197.w),
            SizedBox(height: 24.h),
            Image.asset('assets/logos/tagline.png', width: 188.w),
          ],
        ),
      ),
    );
  }
}
