import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';

class AppBarBack extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBack({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Icon(
            Icons.arrow_back_ios,
            size: 20.sp,
            color: AppColors.secondary,
          ),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      elevation: 0,
      backgroundColor: AppColors.surface,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
