import 'package:get/get.dart';
import 'package:home_cache/model/member_model.dart';
import 'package:home_cache/services/api_checker.dart';
import 'package:home_cache/services/api_clients.dart';
import 'package:home_cache/services/api_constants.dart';

class HomeMemberController extends GetxController {
  var isLoading = false.obs;
  var members = <MemberModel>[].obs;

  @override
  void onInit() {
    fetchAllMembers();
    super.onInit();
  }

  // ! fetch all member
  Future<void> fetchAllMembers() async {
    isLoading(true);
    Response response = await ApiClient.getData(ApiConstants.fetchHomeMember);
    if (response.statusCode == 200) {
      var responseData = response.body;
      if (responseData['data'] != null) {
        var membersData = responseData['data'] as List;
        members.value = membersData
            .map<MemberModel>((e) => MemberModel.fromJson(e))
            .toList();
      }
    } else {
      ApiChecker.checkApi(response);
    }
    isLoading(false);
  }
}
