import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';

class AssignedPersonTile extends StatelessWidget {
  final String name;
  final String role;
  final VoidCallback onEdit;

  const AssignedPersonTile({
    super.key,
    required this.name,
    required this.role,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: TextStyles.semiBold.copyWith(fontSize: 16.sp),
                  ),
                  const Spacer(),
                  IconButton(
                    icon:
                        Icon(Icons.edit, size: 20.sp, color: AppColors.primary),
                    onPressed: onEdit,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              Text(
                role,
                style: TextStyles.regular.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
