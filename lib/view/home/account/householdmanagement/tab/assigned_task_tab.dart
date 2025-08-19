import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssignedTaskTab extends StatefulWidget {
  const AssignedTaskTab({super.key});

  @override
  State<AssignedTaskTab> createState() => _AssignedTaskTabState();
}

class _AssignedTaskTabState extends State<AssignedTaskTab> {
  final List<Map<String, String>> tasks = [
    {'title': 'Clean Kitchen', 'assignedTo': 'Vanessa'},
    {'title': 'Take out Trash', 'assignedTo': 'Ahsan'},
    {'title': 'Wash Dishes', 'assignedTo': 'Bob'},
    {'title': 'Vacuum Living Room', 'assignedTo': 'Thomas'},
  ];

  String? currentSelection;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Assigned Tasks',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Tap a task to mark or assign',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.separated(
              itemCount: tasks.length,
              separatorBuilder: (_, __) => SizedBox(height: 12.h),
              itemBuilder: (context, index) {
                final task = tasks[index];
                // final isSelected = task['title'] == currentSelection;

                return InkWell(
                  onTap: () {
                    setState(() {
                      currentSelection = task['title'];
                    });
                    // You can handle task selection here
                  },
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      // color: isSelected ? AppColors.lightgrey : Colors.white,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color:
                            // isSelected ? AppColors.primary : Colors.grey[300]!,
                            Colors.grey[300]!,
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/person.png',
                          height: 40.h,
                          width: 40.h,
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                task['title']!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                'Assigned to: ${task['assignedTo']}',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // if (isSelected)
                        //   Icon(Icons.check_circle, color: AppColors.primary),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
