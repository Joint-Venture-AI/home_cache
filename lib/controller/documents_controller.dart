import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_cache/model/document.dart';
import 'package:home_cache/services/api_clients.dart';
import 'package:home_cache/services/api_constants.dart';

class DocumentsController extends GetxController {
  var documents = <Document>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDocuments("warranty");
  }

  //! Fetch all documents
// documents_controller.dart
  Future<void> fetchDocuments(String docType) async {
    try {
      isLoading(true);
      Response response =
          await ApiClient.getData("${ApiConstants.fetchDocument}$docType");

      if (response.statusCode == 200) {
        var responseData = response.body;
        if (responseData['data'] != null) {
          var documentData = responseData['data'] as List;
          documents.value =
              documentData.map((e) => Document.fromJson(e)).toList();
        }
      }
    } catch (e) {
      debugPrint("Exception fetching documents: $e");
    } finally {
      isLoading(false);
    }
  }

  //! Filter by category/type
  List<Document> getByCategory(String category) {
    return documents.where((d) => d.type == category).toList();
  }
}
