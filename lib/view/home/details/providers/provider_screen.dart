import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/config/route/routes.dart';
import 'package:home_cache/view/home/details/providers/filter_dialog.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/home/chat/widgets/faq_search_bar_widget.dart';
import 'package:home_cache/view/widget/provider_list_tile.dart';

import '../../../../config/route/route_names.dart';

/// --- Provider Model ---
class ProviderModel {
  final String name;
  final String lastUsed;
  final int rating;
  final bool isFavorite;

  ProviderModel({
    required this.name,
    required this.lastUsed,
    required this.rating,
    required this.isFavorite,
  });
}

/// --- Controller with Search + Debounce ---
class ProviderController extends GetxController {
  var providers = <ProviderModel>[].obs;
  var filteredProviders = <ProviderModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  final searchText = ''.obs;

  @override
  void onInit() {
    fetchProviders();

    // Debounce search (wait 200ms after user stops typing)
    debounce<String>(searchText, (query) {
      _applyFilter(query);
    }, time: const Duration(milliseconds: 200));

    super.onInit();
  }

  Future<void> fetchProviders() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      // TODO: Replace with API call
      await Future.delayed(const Duration(seconds: 1));

      final mockData = [
        ProviderModel(
          name: 'HVAC Pros',
          lastUsed: 'Used on Jul 15, 2025',
          rating: 2,
          isFavorite: false,
        ),
        ProviderModel(
          name: 'Bright Electricals',
          lastUsed: 'Used on Jul 15, 2025',
          rating: 5,
          isFavorite: true,
        ),
        ProviderModel(
          name: 'Clean & Shine',
          lastUsed: 'Used on Jul 10, 2025',
          rating: 4,
          isFavorite: false,
        ),
      ];

      providers.value = mockData;
      filteredProviders.value = mockData;
    } catch (e) {
      errorMessage.value = 'Failed to load providers';
    } finally {
      isLoading.value = false;
    }
  }

  /// Called directly from search bar
  void onSearchChanged(String query) {
    searchText.value = query; // debounce will handle filtering
  }

  /// Internal filter logic
  void _applyFilter(String query) {
    if (query.isEmpty) {
      filteredProviders.value = providers;
    } else {
      filteredProviders.value = providers
          .where((p) =>
      p.name.toLowerCase().contains(query.toLowerCase()) ||
          p.lastUsed.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}

/// --- Main Screen ---
class ProviderScreen extends StatelessWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProviderController());

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBarBack(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// --- Top Bar ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 40.w),
                  Text(
                    'Providers',
                    style: TextStyles.bold.copyWith(color: AppColors.secondary),
                  ),
                  TextButton(
                    onPressed: () => Get.toNamed(RouteNames.addProvider),
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      '+ Add',
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              /// --- Search ---
              Text(
                'Search Providers',
                style: TextStyles.bold.copyWith(
                  color: AppColors.black,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(height: 6.h),
              FaqSearchBarWidget(
                hintText: 'Search providers by name or service',
                onChanged: controller.onSearchChanged,
              ),
              SizedBox(height: 24.h),

              /// --- Section Header ---
              Row(
                children: [
                  Text(
                    'Your Providers',
                    style: TextStyles.bold.copyWith(
                      color: AppColors.black,
                      fontSize: 20.sp,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => const FilterDialog(),
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/icons/filter.svg',
                      width: 24.w,
                      height: 24.h,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              /// --- Provider List ---
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (controller.errorMessage.isNotEmpty) {
                    return Center(child: Text(controller.errorMessage.value));
                  }
                  if (controller.filteredProviders.isEmpty) {
                    return const Center(child: Text('No providers found.'));
                  }
                  return ListView.builder(
                    itemCount: controller.filteredProviders.length,
                    itemBuilder: (context, index) {
                      final provider = controller.filteredProviders[index];
                      return ProviderListTile(
                        providerName: provider.name,
                        lastUsedDate: provider.lastUsed,
                        rating: provider.rating,
                        isFavorite: provider.isFavorite,
                        onTap: () => Get.toNamed(RouteNames.providerDetails),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
