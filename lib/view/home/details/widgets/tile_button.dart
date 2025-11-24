import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';

class TileButton extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;
  final bool showRemoveButton;
  final VoidCallback? onRemoveTap;

  const TileButton({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
    this.showRemoveButton = false,
    this.onRemoveTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: 120.w,
            height: 120.h,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.lightgrey,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imagePath, height: 48.h, fit: BoxFit.contain),
                SizedBox(height: 8.h),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (showRemoveButton && onRemoveTap != null)
            Positioned(
              right: 5,
              top: 5,
              child: GestureDetector(
                onTap: onRemoveTap,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.border,
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
