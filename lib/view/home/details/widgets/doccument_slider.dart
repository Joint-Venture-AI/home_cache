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
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.secondary),
          onPressed: currentIndex > 0 ? _previous : null,
        ),
        Expanded(
          child: SizedBox(
            height: 120.h, // fixed height for the slider
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: currentItems.map((item) {
                return Container(
                  width: 100.w, // fixed width per item
                  margin: EdgeInsets.symmetric(horizontal: 6.w),
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        item['iconPath'] ?? 'assets/images/document.png',
                        height: 53.h,
                        errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.broken_image,
                            color: AppColors.secondary),
                      ),
                      SizedBox(height: 6.h),
                      Expanded(
                        child: Text(
                          item['title'] ?? 'Untitled',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
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
        ),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios, color: AppColors.secondary),
          onPressed: currentIndex + 2 < widget.documents.length ? _next : null,
        ),
      ],
    );
  }
}
