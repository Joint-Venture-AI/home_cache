import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_cache/controller/provider_controller.dart';
import 'package:home_cache/services/api_checker.dart';
import 'package:home_cache/services/api_clients.dart';
import 'package:home_cache/services/api_constants.dart';

/// Controller for AddProviderScreen
class AddProviderController extends GetxController {
  final ProviderController _providerController = Get.find<ProviderController>();

  var selectedType = ''.obs;
  var companyName = ''.obs;
  var fullName = ''.obs;
  var phoneNumber = ''.obs;
  var url = ''.obs;
  var rating = 3.obs;
  var isLoading = false.obs;
  var selectedFile = Rx<File?>(null);

  // Check if the selected file is an image
  bool isImage() {
    if (selectedFile.value == null) return false;
    final ext = selectedFile.value!.path.split('.').last.toLowerCase();
    return ['jpg', 'jpeg', 'png', 'gif'].contains(ext);
  }

  // Remove file
  void removeFile() {
    selectedFile.value = null;
  }

  /// Validate required fields
  bool validateFields() {
    return selectedType.isNotEmpty &&
        companyName.isNotEmpty &&
        fullName.isNotEmpty &&
        phoneNumber.isNotEmpty;
  }


  Future<void> addProvider(Map<String, String> data) async {
    isLoading(true);

    /// Call API with one file
    Response response = await ApiClient.postMultipartData(
      ApiConstants.addProvider,
      data,
      multipartBody: [
        MultipartBody(
          'files',
          selectedFile.value!,
        ),
      ],
    );

    if (response.statusCode == 200) {
      Get.back();
      _providerController.fetchAllProviders();
    } else {
      ApiChecker.checkApi(response);
    }

    isLoading(false);
  }

  /// Send data to API
  submitProvider() async {
    debugPrint(
        "===================>   ${selectedType.value} ${companyName.value} ${fullName.value} ${phoneNumber.value} ${url.value} ${rating.value}");

    if (validateFields()) {
      Map<String, String> data = {
        "type": selectedType.value,
        "company": companyName.value,
        "name": fullName.value,
        "mobile": phoneNumber.value,
        "web_url": url.value,
        "rating": rating.value.toString(),
      };

      await addProvider(data);
    }
  }


  
}
