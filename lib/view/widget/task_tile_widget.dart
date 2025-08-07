import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_cache/constants/colors.dart';

class TaskTileWidget extends StatelessWidget {
  final String date;
  final String taskName;
  final String iconPath;

  const TaskTileWidget({
    super.key,
    required this.date,
    required this.taskName,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            Text(
              '• $taskName',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
            Spacer(),
            SvgPicture.asset(
              iconPath,
              width: 18.w,
              height: 18.h,
              color: AppColors.primary,
            ),
          ],
        ),
      ],
    );
  }
}
