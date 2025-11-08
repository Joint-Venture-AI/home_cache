import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/app_typo_graphy.dart';

class AccountDeletionDialog extends StatelessWidget {
  const AccountDeletionDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      title: Column(
        children: [
          Container(
            padding: EdgeInsets.all(4.sp),
            decoration: BoxDecoration(
              color: Colors.yellow,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 2.w,
              ),
            ),
            child: Icon(
              Icons.question_mark_rounded,
              color: Colors.black,
              size: 48.sp,
            ),
          ),
          Text(
            'Are you sure?',
            style: AppTypoGraphy.semiBold.copyWith(
                color: AppColors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'You want to delete account permanently.',
            style: AppTypoGraphy.regular.copyWith(
              color: AppColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            'All data, images, and history will be permanently deleted.',
            style: AppTypoGraphy.regular.copyWith(
              color: AppColors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Delete',
            style: AppTypoGraphy.semiBold.copyWith(
              color: Colors.red,
            ),
          ),
        ),
        // SizedBox(width: 28.w),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Keep Account',
            style: AppTypoGraphy.regular.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
