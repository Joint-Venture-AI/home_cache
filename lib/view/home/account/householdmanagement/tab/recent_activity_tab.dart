import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';

class RecentActivityTab extends StatelessWidget {
  const RecentActivityTab({super.key});

  // Example activity list (replace with API data later)
  final List<Map<String, String>> activities = const [
    {
      'title': 'New User Joined',
      'subtitle': 'Ahsan was invited',
      'time': '8 hours ago',
      'icon': 'assets/images/dot.png',
    },
    {
      'title': 'Task Completed',
      'subtitle': 'Vacuuming finished by Thomas',
      'time': '12 hours ago',
      'icon': 'assets/images/dot.png',
    },
    {
      'title': 'Service Updated',
      'subtitle': 'Housekeeping schedule changed',
      'time': '1 day ago',
      'icon': 'assets/images/dot.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      itemCount: activities.length,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final activity = activities[index];
        return ActivityTile(
          title: activity['title']!,
          subtitle: activity['subtitle']!,
          time: activity['time']!,
          iconPath: activity['icon']!,
        );
      },
    );
  }
}

class ActivityTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final String iconPath;

  const ActivityTile({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.iconPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            iconPath,
            height: 20.h,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.black,
                  ),
                ),
                Divider(
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
