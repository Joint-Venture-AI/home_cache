import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/view/splash_screen.dart';

class HomeChache extends StatelessWidget {
  const HomeChache({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Home Cache',
          theme: ThemeData(),
          home: const SplashScreen(),
        );
      },
    );
  }
}
