import 'package:get/get.dart';
import 'package:home_cache/model/home_task_data.dart';
import 'package:home_cache/services/api_checker.dart';
import 'package:home_cache/services/api_clients.dart';
import 'package:home_cache/services/api_constants.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var homeData = <HomeTaskData>[].obs;

  // ! get home task data 
Future<void>getHomeTaskData()async{
  isLoading(true);
  Response response = await ApiClient.getData(ApiConstants.homeTaskData);
  if(response.statusCode == 200){
    var responseData = response.body;
    if(responseData['data'] != null){
      var homeTaskData = responseData['data'] as List;
      homeData.value = homeTaskData.map<HomeTaskData>((e) => HomeTaskData.fromJson(e)).toList();
    }
  }else{
    ApiChecker.checkApi(response);
  }
  isLoading(false);
}
}
