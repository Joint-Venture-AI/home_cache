import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/view/home/home/widgets/task_progress_bar.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/task_list_tile.dart' show TaskListTile;

class HomeHealthScreen extends StatefulWidget {
  const HomeHealthScreen({super.key});

  @override
  State<HomeHealthScreen> createState() => _HomeHealthScreenState();
}

class _HomeHealthScreenState extends State<HomeHealthScreen> {
  final int totalTasks = 8;
  final int completedTasks = 5;

  bool isOverdueExpanded = true;
  bool isTasksExpanded = true;
  bool isCompleteExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(
        title: 'Home Health',
        titleColor: AppColors.black,
      ),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.h),
              Text(
                'Great Work, (Jess)',
                style: AppTypoGraphy.medium.copyWith(color: AppColors.black),
              ),
              SizedBox(height: 6.h),
              Text(
                'You’ve completed $completedTasks/$totalTasks tasks this Season!',
                style: AppTypoGraphy.medium.copyWith(
                  color: AppColors.secondary,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 24.h),

              TaskProgressBar(
                  totalTasks: totalTasks, completedTasks: completedTasks),

              SizedBox(height: 32.h),

              // Overdue Tasks - Expandable
              GestureDetector(
                onTap: () {
                  setState(() {
                    isOverdueExpanded = !isOverdueExpanded;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Overdue Tasks',
                      style: AppTypoGraphy.medium.copyWith(
                        color: AppColors.black,
                        fontSize: 20.sp,
                      ),
                    ),
                    Icon(
                      isOverdueExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: AppColors.secondary,
                      size: 24.w,
                    ),
                  ],
                ),
              ),
              Divider(color: AppColors.lightgrey, thickness: 1.h, height: 6.h),

              if (isOverdueExpanded) ...[
                TaskListTile(
                  title: "HVAC Service",
                  date: "Overdue",
                  onTap: () {},
                ),
                TaskListTile(
                  title: "Filter Replacement",
                  date: "Overdue",
                  onTap: () {},
                ),
              ],

              SizedBox(height: 12.h),

              // Tasks - Expandable
              GestureDetector(
                onTap: () {
                  setState(() {
                    isTasksExpanded = !isTasksExpanded;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tasks',
                      style: AppTypoGraphy.medium.copyWith(
                        color: AppColors.black,
                        fontSize: 20.sp,
                      ),
                    ),
                    Icon(
                      isTasksExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: AppColors.secondary,
                      size: 24.w,
                    ),
                  ],
                ),
              ),
              Divider(color: AppColors.lightgrey, thickness: 1.h, height: 6.h),

              if (isTasksExpanded) ...[
                TaskListTile(
                  title: "Annual Inspection",
                  date: "Pending",
                  onTap: () {},
                ),
                TaskListTile(
                  title: "Duct Cleaning",
                  date: "Pending",
                  onTap: () {},
                ),
              ],

              SizedBox(height: 12.h),

              // Complete Tasks - Expandable
              GestureDetector(
                onTap: () {
                  setState(() {
                    isCompleteExpanded = !isCompleteExpanded;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Complete Tasks',
                      style: AppTypoGraphy.medium.copyWith(
                        color: AppColors.black,
                        fontSize: 20.sp,
                      ),
                    ),
                    Icon(
                      isCompleteExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: AppColors.secondary,
                      size: 24.w,
                    ),
                  ],
                ),
              ),
              Divider(color: AppColors.lightgrey, thickness: 1.h, height: 6.h),

              if (isCompleteExpanded) ...[
                TaskListTile(
                  title: "Thermostat Calibration",
                  date: "Complete",
                  onTap: () {},
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
