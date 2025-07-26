import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';

class DocumentSlider extends StatefulWidget {
  const DocumentSlider({super.key});

  @override
  _DocumentSliderState createState() => _DocumentSliderState();
}

class _DocumentSliderState extends State<DocumentSlider> {
  int currentIndex = 0;

  final List<Map<String, dynamic>> items = [
    {
      'iconPath': 'assets/images/document.png',
      'title': 'Service Receipt',
      'date': 'Uploaded 8/17/2023',
    },
    {
      'iconPath': 'assets/images/document.png',
      'title': 'Other Receipt',
      'date': 'Uploaded 9/17/2023',
    },
    {
      'iconPath': 'assets/images/document.png',
      'title': 'Service Receipt',
      'date': 'Uploaded 8/17/2023',
    },
    {
      'iconPath': 'assets/images/document.png',
      'title': 'Service Receipt',
      'date': 'Uploaded 9/17/2023',
    },
  ];

  void _previous() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex -= 1;
      }
    });
  }

  void _next() {
    setState(() {
      if (currentIndex + 2 < items.length) {
        currentIndex += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentItems = items.sublist(
      currentIndex,
      (currentIndex + 2 <= items.length) ? currentIndex + 2 : items.length,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.secondary),
          onPressed: _previous,
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
                      item['iconPath'],
                      height: 53.h,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.broken_image, color: AppColors.secondary),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      item['title'],
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(item['date'], style: TextStyle(fontSize: 12.sp)),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios, color: AppColors.secondary),
          onPressed: _next,
        ),
      ],
    );
  }
}
