import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/routes.dart';

class HomeCache extends StatelessWidget {
  const HomeCache({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Home Cache',
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.surface,
            fontFamily: 'LeagueSpartan',
          ),
          initialRoute: AppRoutes.splash,
          getPages: AppRoutes.pages,
        );
      },
    );
  }
}
