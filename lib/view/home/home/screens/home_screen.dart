import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/controller/task_controller.dart';
import 'package:home_cache/view/home/home/widgets/home_health_pie_chart.dart';
import 'package:home_cache/view/widget/task_list_tile.dart';

import '../../../../config/route/route_names.dart';

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

  final TaskController controller = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: AppColors.surface,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.lightgrey.withAlpha(200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(120),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  GestureDetector(
                      onTap: () => Get.toNamed(RouteNames.homeHealth),
                      child: HomeHealthPieChart()),
                  _buildHealthTitleSection(),
                  SizedBox(height: 10.h),
                ],
              ),
            ),

            // Tasks Section
            Padding(
              padding: const EdgeInsets.all(24),
              child: Obx(() {
                return Column(
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

                    // Toggle Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => controller.selectOption(0),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  controller.selectedIndex.value == 0
                                      ? AppColors.primary
                                      : AppColors.lightgrey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Upcoming',
                              style: TextStyle(
                                color: controller.selectedIndex.value == 0
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
                            onPressed: () => controller.selectOption(1),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  controller.selectedIndex.value == 1
                                      ? AppColors.primary
                                      : AppColors.lightgrey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Overdue',
                              style: TextStyle(
                                color: controller.selectedIndex.value == 1
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

                    // Task List
                    if (controller.isLoading.value)
                      const Center(child: CircularProgressIndicator())
                    else if (controller.filteredTasks.isEmpty)
                      const Center(child: Text("No tasks found"))
                    else
                      Column(
                        children: controller.filteredTasks
                            .map((task) => TaskListTile(
                                  title: task.title,
                                  date: task.date,
                                  onTap: () => Get.toNamed(
                                      RouteNames.notificationDetails),
                                ))
                            .toList(),
                      ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHealthTitleSection() {
    return Padding(
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
            'You\'ve completed 4/5 tasks this Season!',
            style: TextStyles.medium.copyWith(
              color: AppColors.secondary,
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hi Jess,',
              style: TextStyles.medium.copyWith(
                  color: AppColors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              'Welcome Back',
              style: TextStyles.regular.copyWith(
                  color: AppColors.black.withAlpha(200),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Get.toNamed(RouteNames.notifications);
          },
          child: Container(
            height: 32.h,
            width: 48.w,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(5.w),
            child: SvgPicture.asset(
              "assets/icons/bell.svg",
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
