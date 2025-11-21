import 'dart:convert';

import 'package:get/get.dart';
import 'package:home_cache/config/route/route_names.dart';
import 'package:home_cache/constants/data/app_constants.dart';
import 'package:home_cache/model/sing_up_collected_data.dart';
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

  // Sing up collected data
  Rx<SingUpCollectedData> collectedData = SingUpCollectedData(
    userId: '',
    homeType: '',
    homeAddress: '',
    homePowerType: [],
    homeWaterSupplyType: [],
    homeHeatingType: [],
    homeHeatingPower: '',
    homeCoolingType: [],
    responsibleFor: [],
    wantToTrack: [],
    lastServiceData: LastServiceData(type: '', lastService: '', note: ''),
  ).obs;

  // Update user ID
  void updateUserId(String userId) {
    collectedData.update((data) {
      data?.userId = userId;
    });
  }

  // Update home type
  void updateHomeType(String homeType) {
    collectedData.update((data) {
      data?.homeType = homeType;
    });
  }

  // Update home address
  void updateHomeAddress(String homeAddress) {
    collectedData.update((data) {
      data?.homeAddress = homeAddress;
    });
  }

  // Update home power type
  void updateHomePowerType(List<String> homePowerType) {
    collectedData.update((data) {
      data?.homePowerType = homePowerType;
    });
  }

  // Update home water supply type
  void updateHomeWaterSupplyType(List<String> homeWaterSupplyType) {
    collectedData.update((data) {
      data?.homeWaterSupplyType = homeWaterSupplyType;
    });
  }

  // Update home heating type
  void updateHomeHeatingType(List<String> homeHeatingType) {
    collectedData.update((data) {
      data?.homeHeatingType = homeHeatingType;
    });
  }

  // Update home heating power
  void updateHomeHeatingPower(String homeHeatingPower) {
    collectedData.update((data) {
      data?.homeHeatingPower = homeHeatingPower;
    });
  }

  // Update home cooling type
  void updateHomeCoolingType(List<String> homeCoolingType) {
    collectedData.update((data) {
      data?.homeCoolingType = homeCoolingType;
    });
  }

  // Update responsible for
  void updateResponsibleFor(List<String> responsibleFor) {
    collectedData.update((data) {
      data?.responsibleFor = responsibleFor;
    });
  }

  // Update want to track
  void updateWantToTrack(List<String> wantToTrack) {
    collectedData.update((data) {
      data?.wantToTrack = wantToTrack;
    });
  }

  // Update last service data
  void updateLastServiceData(String type, String lastService, String note) {
    collectedData.update((data) {
      data?.lastServiceData = LastServiceData(
        type: type,
        lastService: lastService,
        note: note,
      );
    });
  }

  // Signup collection data Api Call
  Future<void> submitData() async {
    isLoading(true);
  }
}
