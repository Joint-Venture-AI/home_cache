import 'dart:convert';

import 'package:get/get.dart';
import 'package:home_cache/services/api_checker.dart';
import 'package:home_cache/services/api_clients.dart';
import 'package:home_cache/services/api_constants.dart';
import 'package:home_cache/view/home/home/model/task_model.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;
  var isLoading = false.obs;
  var selectedIndex = 0.obs;
  var task = {}.obs;
  RxInt totalTasks = 10.obs;
  RxInt completedTasks = 3.obs;

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

  // List<Task> get filteredTasks {
  //   if (selectedIndex.value == 0) {
  //     return tasks.where((t) => t.status == "upcoming").toList();
  //   } else {
  //     return tasks.where((t) => t.status == "overdue").toList();
  //   }
  // }

  void selectOption(int index) {
    selectedIndex.value = index;
  }

  void updateProgress(int completed, int total) {
    completedTasks.value = completed;
    totalTasks.value = total;
  }

  // Create Task api call
  Future<void> createTask(var data) async {
    isLoading(true);

    Response response = await ApiClient.postData(
      ApiConstants.createTask,
      jsonEncode(data),
    );

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body)['data'];
      var task = responseData['task'];
      Get.back();
    } else {
      ApiChecker.checkApi(response);
    }

    isLoading(false);
  }

  // Fetch task api call
  Future<void> fetchTask() async {
    isLoading(true);

    Response response = await ApiClient.getData(ApiConstants.fetchTask);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      task.value = responseData['data']['task'];
      Get.back();
    } else {
      ApiChecker.checkApi(response);
    }

    isLoading(false);
  }
}
