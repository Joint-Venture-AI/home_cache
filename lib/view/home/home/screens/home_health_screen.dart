import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/task_list_tile.dart' show TaskListTile;

class HomeHealthScreen extends StatefulWidget {
  const HomeHealthScreen({super.key});

  @override
  State<HomeHealthScreen> createState() => _HomeHealthScreenState();
}

class _HomeHealthScreenState extends State<HomeHealthScreen> {
  final int totalTasks = 5;
  final int completedTasks = 4;

  bool isOverdueExpanded = true;
  bool isTasksExpanded = true;
  bool isCompleteExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 2.h),
              Text(
                'Home Health',
                style: TextStyles.bold.copyWith(
                  color: AppColors.black,
                  fontSize: 26.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              Text(
                'Great Work, (Name)',
                style: TextStyles.medium.copyWith(color: AppColors.black),
              ),
              SizedBox(height: 6.h),
              Text(
                'You’ve completed $completedTasks/$totalTasks tasks this Season!',
                style: TextStyles.medium.copyWith(
                  color: AppColors.secondary,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 24.h),

              // Progress bar with dots
              Container(
                height: 14.h,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Stack(
                  children: [
                    FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: totalTasks > 0
                          ? (completedTasks / totalTasks).clamp(0.0, 1.0)
                          : 0.0,
                      child: Container(
                        height: 14.h,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(totalTasks, (index) {
                        return Padding(
                          padding: EdgeInsets.all(4.sp),
                          child: Container(
                            width: 8.w,
                            height: 8.w,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),

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
                      style: TextStyles.medium.copyWith(
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
                      style: TextStyles.medium.copyWith(
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
                      style: TextStyles.medium.copyWith(
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
