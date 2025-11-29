import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/ai_model.dart';
import '../services/api_clients.dart';
import '../services/api_constants.dart';
import '../services/api_checker.dart';

class AiChatController extends GetxController {
  var isLoading = false.obs;
  var messages = <ChatMessage>[].obs;
  var inputText = ''.obs;
  TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    fetchMessages();
  }

  // Fetch chat history
  Future<void> fetchMessages() async {
    isLoading(true);
    Response response = await ApiClient.getData(ApiConstants.getAiResponse);

    if (response.statusCode == 200) {
      final responseData = response.body;
      if (responseData['data'] != null) {
        final data = responseData['data'];
        if (data is List) {
          messages.value = data
              .map((e) => ChatMessage.fromAiModel(AiModel.fromJson(e)))
              .toList();
        } else if (data is Map<String, dynamic>) {
          messages.add(ChatMessage.fromAiModel(AiModel.fromJson(data)));
        }
      }
    } else {
      ApiChecker.checkApi(response);
    }
  }

  // Send a message
  Future<void> sendMessage(String message) async {
    if (message.trim().isEmpty) return;

    isLoading(true);

    // Add user message to UI immediately
    messages.add(ChatMessage(text: message, isMe: true));
    textController.clear();
    inputText.value = '';

    final body = jsonEncode({"prompt": message});
    Response response = await ApiClient.postData("/ai/get-response", body);

    if (response.statusCode == 200) {
      final responseData = response.body;
      if (responseData['data'] != null) {
        final aiMessage =
            ChatMessage.fromAiModel(AiModel.fromJson(responseData['data']));
        messages.add(aiMessage);
      }
    } else {
      ApiChecker.checkApi(response);
    }

    // Scroll to bottom
    if (scrollController.hasClients) {
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void updateInput(String value) {
    inputText.value = value;
  }
}
