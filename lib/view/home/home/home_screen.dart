import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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

  final TaskController controller = Get.put(TaskController());

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
              onTap: () => Get.toNamed('/homeHealth'),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.lightgrey.withOpacity(.7),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
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
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
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
                              backgroundColor: controller.selectedIndex.value == 0
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
                              backgroundColor: controller.selectedIndex.value == 1
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
                          onTap: () => Get.toNamed(AppRoutes.notificationDetails),
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
}

class HomeHealthScore extends StatelessWidget {
  final int percentage;
  final String subtitle;

  const HomeHealthScore(
      {Key? key, required this.percentage, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: CircularProgressIndicator(
                value: percentage / 100,
                strokeWidth: 10,
                backgroundColor: Colors.grey[200],
                color: Color(0xFF1d545d),
                // valueColor: Color(0xFF1d545d),
              ),
            ),
            Column(
              children: [
                Text(
                  '$percentage%',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1d545d),
                    // color:getColorForPercentage(),
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1d545d),
                    // color:getColorForPercentage(),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class Task {
  final String title;
  final String date;
  final String status; // e.g., upcoming, overdue

  Task({required this.title, required this.date, required this.status});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'] ?? '',
      date: json['date'] ?? '',
      status: json['status'] ?? 'upcoming',
    );
  }
}




///controller
class TaskController extends GetxController {
  var tasks = <Task>[].obs;
  var isLoading = false.obs;
  var selectedIndex = 0.obs; // 0 = Upcoming, 1 = Overdue

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  void fetchTasks() async {
    try {
      isLoading.value = true;
      // Example mock API response (replace with real API call)
      await Future.delayed(const Duration(seconds: 1));
      final response = [
        {"title": "HVAC Service", "date": "3/10/25", "status": "upcoming"},
        {"title": "Roof Check", "date": "3/12/25", "status": "upcoming"},
        {"title": "Filter Change", "date": "3/9/25", "status": "overdue"},
      ];

      tasks.value = response.map((e) => Task.fromJson(e)).toList();
    } finally {
      isLoading.value = false;
    }
  }

  List<Task> get filteredTasks {
    if (selectedIndex.value == 0) {
      return tasks.where((t) => t.status == "upcoming").toList();
    } else {
      return tasks.where((t) => t.status == "overdue").toList();
    }
  }

  void selectOption(int index) {
    selectedIndex.value = index;
  }
}