import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/view/home/details/widgets/document_tile.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';

import '../../../../config/route/route_names.dart';

/// --- Document Model ---
class DocumentModel {
  final String id; // Unique ID for API
  final String title;
  final String subtitle;
  final String date;
  final String iconPath;
  final String category;
  final String? imagePath;
  final DateTime createdAt;

  DocumentModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.iconPath,
    required this.category,
    this.imagePath,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "subtitle": subtitle,
      "date": date,
      "iconPath": iconPath,
      "category": category,
      "imagePath": imagePath,
      "createdAt": createdAt.toIso8601String(),
    };
  }
}

/// --- Controller ---

class DocumentsController extends GetxController {
  var documents = <DocumentModel>[].obs;

  void addDocument(DocumentModel doc) {
    documents.add(doc);
  }

  List<DocumentModel> getByCategory(String category) {
    return documents.where((d) => d.category == category).toList();
  }
}

/// --- Screen ---
class DocumentsScreen extends StatelessWidget {
  DocumentsScreen({super.key});
  final controller = Get.put(DocumentsController());

  final List<String> categories = [
    "Warranties",
    "Insurance",
    "Receipts",
    "Quotes",
    "Manuals",
    "Other",
  ];
  final RxInt selectedCategoryIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBarBack(
        title: 'Documents',
        titleColor: AppColors.secondary,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: () {
                Get.toNamed(RouteNames.addDocuments);
              },
              style: TextButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r)),
              ),
              child: Text('+ Add',
                  style: TextStyle(color: Colors.white, fontSize: 14.sp)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(24.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Categories
            Obx(() => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        final isSelected = selectedCategoryIndex.value == index;
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: ElevatedButton(
                            onPressed: () =>
                                selectedCategoryIndex.value = index,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isSelected
                                  ? AppColors.primary
                                  : AppColors.lightgrey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r)),
                            ),
                            child: Text(categories[index],
                                style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 12.sp)),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        final actualIndex = index + 3;
                        final isSelected =
                            selectedCategoryIndex.value == actualIndex;
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: ElevatedButton(
                            onPressed: () =>
                                selectedCategoryIndex.value = actualIndex,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isSelected
                                  ? AppColors.primary
                                  : AppColors.lightgrey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r)),
                            ),
                            child: Text(categories[actualIndex],
                                style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 12.sp)),
                          ),
                        );
                      }),
                    ),
                  ],
                )),

            SizedBox(height: 20.h),

            // Documents Grid
            Expanded(
              child: Obx(() {
                final filteredDocs = controller
                    .getByCategory(categories[selectedCategoryIndex.value]);
                if (filteredDocs.isEmpty) {
                  return Center(
                    child: Text('No documents in this category.',
                        style: AppTypoGraphy.medium
                            .copyWith(color: AppColors.black)),
                  );
                }
                return GridView.builder(
                  padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 8.h),
                  itemCount: filteredDocs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 16.w,
                      childAspectRatio: .95),
                  itemBuilder: (context, index) {
                    final doc = filteredDocs[index];
                    return DocumentTile(
                      title: doc.title,
                      subtitle: doc.subtitle,
                      date: doc.date,
                      iconPath: doc.iconPath,
                      onTap: () {
                        Get.toNamed(RouteNames.documentsDetails);
                      },
                    );
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
