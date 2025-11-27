import 'dart:io';
import 'package:get/get.dart';
import 'package:home_cache/model/room.dart';
import 'package:home_cache/model/room_data.dart';
import 'package:home_cache/model/room_type.dart';

import 'package:home_cache/services/api_checker.dart';
import 'package:home_cache/services/api_clients.dart';
import 'package:home_cache/services/api_constants.dart';

class RoomController extends GetxController {
  var isLoading = false.obs;
  var selectedFile = Rx<File?>(null);

  var allRooms = <RoomData>[].obs;
  var roomType = <RoomTypeModel>[].obs;
  var roomDetails = Rx<Room?>(null);

  /// Clear selected file
  void removeFile() => selectedFile.value = null;

  /// Add new room
  Future<void> addRoom(Map<String, String> data) async {
    isLoading(true);

    Response response = await ApiClient.postMultipartData(
      ApiConstants.addRoom,
      data,
      multipartBody: selectedFile.value != null
          ? [MultipartBody('file', selectedFile.value!)]
          : [],
    );

    if (response.statusCode == 200) {
      fetchAllRoom();
      Get.back();
    } else {
      ApiChecker.checkApi(response);
    }

    isLoading(false);
  }

//! get all room
  Future<void> fetchAllRoom() async {
    isLoading(true);

    Response response = await ApiClient.getData(ApiConstants.fetchAllRoom);

    if (response.statusCode == 200) {
      var responseData = response.body;
      if (responseData['data'] != null) {
        var roomData = responseData['data'] as List;
        allRooms.value =
            roomData.map<RoomData>((e) => RoomData.fromJson(e)).toList();
      }
    } else {
      ApiChecker.checkApi(response);
    }

    isLoading(false);
  }

  // ! get room type
  Future<void> fetchRoomType() async {
    isLoading(true);

    Response response = await ApiClient.getData(ApiConstants.fetchRoomType);

    if (response.statusCode == 200) {
      var responseData = response.body;
      if (responseData['data'] != null) {
        var roomTypeData = responseData['data'] as List;
        roomType.value = roomTypeData
            .map<RoomTypeModel>((e) => RoomTypeModel.fromJson(e))
            .toList();
      }
    } else {
      ApiChecker.checkApi(response);
    }

    isLoading(false);
  }

  // ! get room details
  Future<void> fetchRoomDetails(String roomId) async {
    isLoading(true);

    Response response = await ApiClient.getData(
      '${ApiConstants.fetchRoomDetails}/$roomId',
    );

    if (response.statusCode == 200) {
      var responseData = response.body;
      if (responseData['data'] != null) {
        roomDetails.value = Room.fromJson(responseData['data']);
      }
    } else {
      ApiChecker.checkApi(response);
    }

    isLoading(false);
  }
}
