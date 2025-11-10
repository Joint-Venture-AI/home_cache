

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';

class DocumentSlider extends StatefulWidget {
  final List<Map<String, String>> documents;

  const DocumentSlider({super.key, this.documents = const []});

  @override
  _DocumentSliderState createState() => _DocumentSliderState();
}

class _DocumentSliderState extends State<DocumentSlider> {
  int currentIndex = 0;

  void _previous() {
    setState(() {
      if (currentIndex > 0) currentIndex--;
    });
  }

  void _next() {
    setState(() {
      if (currentIndex + 2 < widget.documents.length) currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.documents.isEmpty) {
      return Center(
        child: Text(
          'No documents available',
          style: TextStyle(fontSize: 14.sp, color: AppColors.secondary),
        ),
      );
    }

    final currentItems = widget.documents.sublist(
      currentIndex,
      (currentIndex + 2 <= widget.documents.length)
          ? currentIndex + 2
          : widget.documents.length,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.secondary),
          onPressed: currentIndex > 0 ? _previous : null,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: currentItems.map((item) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      item['iconPath'] ?? 'assets/images/document.png',
                      height: 53.h,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.broken_image, color: AppColors.secondary),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      item['title'] ?? 'Untitled',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      item['date'] ?? '',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios, color: AppColors.secondary),
          onPressed: currentIndex + 2 < widget.documents.length ? _next : null,
        ),
      ],
    );
  }
}
