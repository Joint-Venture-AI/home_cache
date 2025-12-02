import 'package:get/get.dart';
import 'package:home_cache/model/home_health_data.dart';
import 'package:home_cache/model/home_task_data.dart';

import 'package:home_cache/services/api_checker.dart';
import 'package:home_cache/services/api_clients.dart';
import 'package:home_cache/services/api_constants.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;

  // Single data fetch
  var homeTaskData = Rxn<HomeTaskData>();
  var homeHealthData = Rxn<HomeHealthModel>();

  @override
  void onInit() {
    super.onInit();
    getHomeHealth();
    getHomeHealthData();
  }

  //! Get home task health
  Future<void> getHomeHealth() async {
    try {
      isLoading(true);

      final response = await ApiClient.getData(ApiConstants.homeTaskData);

      if (response.statusCode == 200) {
        final responseData = response.body;

        if (responseData['data'] != null) {
          homeTaskData.value = HomeTaskData.fromJson(responseData['data']);
        }
      } else {
        ApiChecker.checkApi(response);
      }
    } finally {
      isLoading(false);
    }
  }

  // ! get home health
  Future<void> getHomeHealthData() async {
    try {
      isLoading(true);

      final response = await ApiClient.getData(ApiConstants.homeHealthData);

      if (response.statusCode == 200) {
        final responseData = response.body;

        if (responseData['data'] != null) {
          homeHealthData.value = HomeHealthModel.fromJson(responseData['data']);
        }
      } else {
        ApiChecker.checkApi(response);
      }
    } finally {
      isLoading(false);
    }
  }
}
