import 'dart:convert';

import 'package:get/get.dart';
import 'package:home_cache/config/route/route_names.dart';
import 'package:home_cache/constants/data/app_constants.dart';
import 'package:home_cache/services/api_checker.dart';
import 'package:home_cache/services/api_clients.dart';
import 'package:home_cache/services/api_constants.dart';
import 'package:home_cache/services/prefs_helper.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

// Signup Api Call
  Future<void> signUp(var data) async {
    isLoading(true);

    Response response = await ApiClient.postData(
        ApiConstants.signup, jsonEncode(data),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      Get.offAllNamed(RouteNames.selectHouse);
    } else {
      ApiChecker.checkApi(response);
    }

    isLoading(false);
  }

// Login Api Call
  Future<void> login(var data) async {
    isLoading(true);

    Response response = await ApiClient.postData(
        ApiConstants.login, jsonEncode(data),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      var responseData = response.body['data'];
      String token = responseData['access_token'];
      await PrefsHelper.setString(AppConstants.bearerToken, token);
      Get.offAllNamed(RouteNames.bottomNav);
    } else {
      ApiChecker.checkApi(response);
    }

    isLoading(false);
  }
}
