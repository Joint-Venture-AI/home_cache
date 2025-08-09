import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_cache/constants/colors.dart';

class TaskTileWidget extends StatelessWidget {
  final String date;
  final String taskName;
  final String iconPath;
  final String assignedTo;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  const TaskTileWidget({
    super.key,
    required this.date,
    required this.taskName,
    required this.iconPath,
    required this.assignedTo,
    this.onDelete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              date,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            const Spacer(),
            if (onDelete != null)
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/delete.svg',
                  width: 18.w,
                  height: 18.h,
                  color: AppColors.error,
                ),
                onPressed: onDelete,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            if (onEdit != null) ...[
              SizedBox(width: 8.w),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/edit.svg',
                  width: 18.w,
                  height: 18.h,
                  color: AppColors.primary,
                ),
                onPressed: onEdit,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ],
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            Text(
              '• $taskName',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              iconPath,
              width: 18.w,
              height: 18.h,
              color: AppColors.primary,
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/profile.svg',
              width: 14.w,
              height: 14.h,
              color: AppColors.grey,
            ),
            SizedBox(width: 4.w),
            Text(
              assignedTo,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        const Divider(
          color: Colors.grey,
          thickness: 0.5,
          height: 1,
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
