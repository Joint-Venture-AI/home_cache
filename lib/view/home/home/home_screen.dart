import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/app_bar_widget.dart';
import 'package:home_cache/view/widget/task_list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> isSelected = [true, false];

  void selectOption(int index) {
    setState(() {
      for (int i = 0; i < isSelected.length; i++) {
        isSelected[i] = i == index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      backgroundColor: AppColors.surface,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.homeHealth);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.lightgrey.withOpacity(.7),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 10.h),
                    Image.asset("assets/images/dash.png", height: 240.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Great Work!',
                            style: TextStyles.medium.copyWith(
                              color: AppColors.black,
                              fontSize: 24.sp,
                            ),
                          ),
                          Text(
                            'You’ve completed 4/5 tasks this Season!',
                            style: TextStyles.medium.copyWith(
                              color: AppColors.secondary,
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(height: 10.h),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Tasks',
                    style: TextStyles.medium.copyWith(
                      color: AppColors.black,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => selectOption(0),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isSelected[0]
                                ? AppColors.primary
                                : AppColors.lightgrey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Upcoming',
                            style: TextStyle(
                              color: isSelected[0]
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => selectOption(1),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isSelected[1]
                                ? AppColors.primary
                                : AppColors.lightgrey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Overdue',
                            style: TextStyle(
                              color: isSelected[1]
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  // Upcoming
                  if (isSelected[0]) ...[
                    TaskListTile(
                      title: "HVAC Service",
                      date: "Due Today: 3/10/25",

                      onTap: () {},
                    ),
                    TaskListTile(
                      title: "HVAC Service",
                      date: "Due Today: 3/12/25",

                      onTap: () {},
                    ),
                    TaskListTile(
                      title: "HVAC Service",
                      date: "Due Today: 3/9/25",

                      onTap: () {},
                    ),
                  ],

                  // Content for Overdue
                  if (isSelected[1]) ...[
                    TaskListTile(
                      title: "HVAC Service",
                      date: "Overdue",

                      onTap: () {},
                    ),
                    TaskListTile(
                      title: "HVAC Service",
                      date: "Due Today",

                      onTap: () {},
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
