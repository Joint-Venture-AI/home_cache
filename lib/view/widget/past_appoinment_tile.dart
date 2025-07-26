import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';

class PastAppointmentsTile extends StatelessWidget {
  final String date;
  final String status;

  const PastAppointmentsTile({
    required this.date,
    required this.status,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            date,
            style: TextStyles.semiBold.copyWith(
              color: AppColors.primary,
              fontSize: 16.sp,
            ),
            textAlign: TextAlign.start,
          ),
          Row(
            children: [
              Text(
                "• ",
                style: TextStyles.semiBold.copyWith(
                  color: AppColors.black,
                  fontSize: 16.sp,
                ),
              ),

              Text(
                status,
                style: TextStyles.semiBold.copyWith(
                  color: AppColors.black,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
