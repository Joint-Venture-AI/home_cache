import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:home_cache/model/provider_model.dart';
import 'package:home_cache/services/api_checker.dart';
import 'package:home_cache/services/api_clients.dart';
import 'package:home_cache/services/api_constants.dart';

class ProviderController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  final searchText = ''.obs;

  var allProviders = <Provider>[].obs;
  var filteredAllProviders = <Provider>[].obs;

  // Single provider details
  var selectedProvider = Rxn<Provider>();

  @override
  void onInit() {
    super.onInit();
    fetchAllProviders();

    debounce<String>(searchText, (query) {
      _applyFilter(query);
    }, time: const Duration(milliseconds: 300));
  }

  //! Called from search bar
  void onSearchChanged(String query) {
    searchText.value = query;
  }

  //! Apply filter logic
  void _applyFilter(String query) {
    debugPrint("Filtering with query: $query");
    if (query.isEmpty) {
      filteredAllProviders.value = allProviders;
      return;
    }

    final lowerQuery = query.toLowerCase();

    filteredAllProviders.value = allProviders.where((p) {
      final name = p.name.toLowerCase();
      final type = p.type.toLowerCase();
      final company = p.company.toLowerCase();
      final lastServiceDate = p.lastServiceDate?.toLowerCase() ?? '';

      final matches = name.contains(lowerQuery) ||
          type.contains(lowerQuery) ||
          company.contains(lowerQuery) ||
          lastServiceDate.contains(lowerQuery);

      debugPrint("Checking ${p.name}: $matches");
      return matches;
    }).toList();
  }

  //! Fetch all providers
  Future<void> fetchAllProviders() async {
    debugPrint('Fetching all providers...');
    isLoading(true);
    Response response = await ApiClient.getData(ApiConstants.fetchProviders);

    if (response.statusCode == 200) {
      var responseData = response.body;
      if (responseData['data'] != null) {
        var providerData = responseData['data'] as List;
        allProviders.value =
            providerData.map<Provider>((e) => Provider.fromJson(e)).toList();

        // add filter here
        filteredAllProviders.value = allProviders;
      }
    } else {
      ApiChecker.checkApi(response);
    }

    isLoading(false);
  }

  //! Fetch single provider by ID
  Future<void> fetchProviderById(String id) async {
    isLoading(true);
    Response response =
        await ApiClient.getData("${ApiConstants.fetchProviders}/$id");
    if (response.statusCode == 200) {
      var responseData = response.body;
      if (responseData['data'] != null) {
        // Assuming API returns a single object in data
        selectedProvider.value = Provider.fromJson(responseData['data']);
      }
    } else {
      ApiChecker.checkApi(response);
      errorMessage.value = "Failed to load provider details";
    }
    isLoading(false);
  }
}
