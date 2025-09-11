import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/view/widget/heart_beat_animation.dart';

class ProviderListTile extends StatefulWidget {
  final String providerName;
  final String lastUsedDate;
  final int rating;
  final bool isFavorite;
  final VoidCallback? onTap;

  const ProviderListTile({
    super.key,
    required this.providerName,
    required this.lastUsedDate,
    this.rating = 0,
    this.isFavorite = false,
    this.onTap,
  });

  @override
  State<ProviderListTile> createState() => _ProviderListTileState();
}

class _ProviderListTileState extends State<ProviderListTile> {
  late bool _favorite = widget.isFavorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.h),
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.providerName,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(widget.lastUsedDate, style: TextStyle(fontSize: 14.sp)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < widget.rating
                          ? Icons.star_rounded
                          : Icons.star_border_rounded,
                      color: AppColors.primaryLight,
                      size: 16.sp,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                HeartBeatAnimation(
                  selected: _favorite,
                  selectedChild: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 20.sp,
                  ),
                  unselectedChild: Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                    size: 20.sp,
                  ),
                  duration: Duration(milliseconds: 212),
                  scale: 1.3,
                  onChange: () {
                    setState(() {
                      _favorite = !_favorite;
                    });
                  },
                ),
              ],
            ),
            SizedBox(width: 6.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r),
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.chevron_right,
                    color: AppColors.black,
                    size: 24.sp,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Info',
                    style: TextStyle(fontSize: 12.sp, color: AppColors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
