import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:home_cache/services/api_checker.dart';
import 'package:home_cache/services/api_clients.dart';
import 'package:home_cache/services/api_constants.dart';
import 'package:home_cache/model/task_model.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;
  var isLoading = false.obs;
  var selectedIndex = 0.obs;

  RxInt totalTasks = 10.obs;
  RxInt completedTasks = 3.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllTask(
      "upcoming",
    );
  }

  // ! When button clicked
  void selectOption(int index) {
    selectedIndex.value = index;

    if (index == 0) {
      fetchAllTask("upcoming");
    } else {
      fetchAllTask("overdue");
    }
  }

  //! Create Task api call
  Future<void> createTask(var data) async {
    isLoading(true);

    Response response = await ApiClient.postData(
      ApiConstants.createTask,
      jsonEncode(data),
    );

    if (response.statusCode == 200) {
      Get.back();
      fetchAllTask(
        "upcoming",
      );
    } else {
      ApiChecker.checkApi(response);
    }

    isLoading(false);
  }

  // !Fetch task api call
  Future<void> fetchAllTask(String status) async {
    debugPrint('--------------');
    debugPrint(status);
    isLoading(true);

    Response response = await ApiClient.getData(ApiConstants.fetchTask,
        query: {'task_time': status});

    if (response.statusCode == 200) {
      var responseData = response.body;

      if (responseData['data'] != null) {
        var taskData = responseData['data'] as List;

        tasks.value = taskData.map<Task>((e) => Task.fromJson(e)).toList();
      }

      Get.back();
    } else {
      ApiChecker.checkApi(response);
    }

    isLoading(false);
  }
}
