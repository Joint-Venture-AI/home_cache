import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_cache/services/api_checker.dart';
import 'package:home_cache/services/api_clients.dart';
import 'package:home_cache/services/api_constants.dart';

class ChatMessage {
  final String text;
  final bool isMe;
  ChatMessage({required this.text, required this.isMe});
}

class ChatController extends GetxController {
  var messages = <ChatMessage>[].obs;
  var isLoading = false.obs;
  var inputText = ''.obs;

  late final TextEditingController textController;

  @override
  void onInit() {
    super.onInit();
    textController = TextEditingController();

    // Keep inputText in sync with TextEditingController
    ever(inputText, (String value) {
      textController.value = TextEditingValue(
        text: value,
        selection: TextSelection.collapsed(offset: value.length),
      );
    });
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  // Update input text
  void updateInput(String value) {
    inputText.value = value;
  }

  // Send user message and get AI response
  void sendMessage() async {
    final text = inputText.value.trim();
    if (text.isEmpty) return;

    // Add user message
    messages.add(ChatMessage(text: text, isMe: true));

    // Clear input
    inputText.value = '';
    textController.clear();

    // Call AI API
    isLoading.value = true;
    final aiResponse = await fetchAiResponse(text);
    isLoading.value = false;

    if (aiResponse != null && aiResponse.isNotEmpty) {
      messages.add(ChatMessage(text: aiResponse, isMe: false));
    }
  }

  // Call API
  Future<String?> fetchAiResponse(String prompt) async {
    try {
      Response response = await ApiClient.postData(
        ApiConstants.aiResponse,
        jsonEncode({"prompt": prompt}),
      );

      if (response.statusCode == 200) {
        final data = response.body['data'];
        return data.toString();
      } else {
        ApiChecker.checkApi(response);
        return null;
      }
    } catch (e) {
      print("Exception in fetchAiResponse: $e");
      return null;
    }
  }
}
