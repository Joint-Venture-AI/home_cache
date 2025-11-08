import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:home_cache/view/home/home/model/task_model.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;
  var isLoading = false.obs;
  var selectedIndex = 0.obs;

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
