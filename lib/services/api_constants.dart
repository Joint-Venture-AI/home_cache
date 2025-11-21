import 'dart:core';

class ApiConstants {
  static String baseUrl = "https://k10swf0g-6000.inc1.devtunnels.ms/api/v1";

  static String signup = "/auth/create-user";
  static String login = "/auth/login";
  static String createTask = "/task/add_task";
  static String fetchTask = "/task/get_users_task?task_time=upcoming";

  // static String forgotPassword = "/auth/forgotPassword";
  // static String resetPassword = "/auth/resetPassword";
  // static String verifyOtp = "/auth/verifyOtp";
  // static String productsDetails(String id) => "/products/$id";
}
