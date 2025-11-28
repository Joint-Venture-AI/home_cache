import 'dart:core';

class ApiConstants {
  static String baseUrl = "https://k10swf0g-6000.inc1.devtunnels.ms/api/v1";

  static String signup = "/auth/create-user";
  static String login = "/auth/login";

  static String updateHomeData = "/user/update_home_data";

  static String createTask = "/task/add_task";
  static String fetchTask = "/task/get_users_task";
  static String fetchTaskDetails = "/task/task_details/";

  static String addProvider = "/provider/";
  static String fetchProviders = "/provider/";
  static String updateProvider = "/provider/";

  static String addDocument = "/document";
  static String fetchDocument = "/document/all?type=";

  static String addRoom = "/view-by-room/add";
  static String fetchAllRoom = "/view-by-room/all";
  static String fetchRoomType = "/view-by-room/all-type";
  static String fetchRoomDetails = "/view-by-room";

  static String aiResponse = "/ai/get-response";

  // static String forgotPassword = "/auth/forgotPassword";
  // static String resetPassword = "/auth/resetPassword";
  // static String verifyOtp = "/auth/verifyOtp";
  // static String productsDetails(String id) => "/products/$id";
}
