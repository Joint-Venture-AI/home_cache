import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/home/details/type/appliances/dialog_appliance.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';

class AppliancesScreen extends StatefulWidget {
  const AppliancesScreen({super.key});

  @override
  State<AppliancesScreen> createState() => _AppliancesScreenState();
}

class _AppliancesScreenState extends State<AppliancesScreen> {
  final List<String> categories = [
    "Refrigerator",
    "Oven",
    "Washer",
    "Stove",
    "Dryer",
    "Ice Maker",
    "Dish Washer",
    "Garbage Disposal",
    "Micro Wave",
  ];

  int selectedCategoryIndex = 0;

  void selectCategory(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
  }

  final List<Map<String, dynamic>> documentTiles = [
    {
      'title': 'LG Fridge Warranty',
      'subtitle': 'Model LGX1200',
      'date': '10 Jun 25',
      'category': 'Refrigerator',
    },
    {
      'title': 'Samsung Oven Manual',
      'subtitle': 'Convection Oven',
      'date': '22 Aug 25',
      'category': 'Oven',
    },
    {
      'title': 'Washer Insurance',
      'subtitle': 'Bosch Washer',
      'date': '15 May 25',
      'category': 'Washer',
    },
    {
      'title': 'Gas Stove Receipt',
      'subtitle': 'GE Brand',
      'date': '20 Jul 25',
      'category': 'Stove',
    },
    {
      'title': 'Dryer User Manual',
      'subtitle': 'Whirlpool',
      'date': '12 Jun 25',
      'category': 'Dryer',
    },
    {
      'title': 'Ice Maker Quote',
      'subtitle': 'Installation',
      'date': '01 Jul 25',
      'category': 'Ice Maker',
    },
    {
      'title': 'Dishwasher Invoice',
      'subtitle': 'LG Smart Dish Washer',
      'date': '15 Jul 25',
      'category': 'Dish Washer',
    },
    {
      'title': 'Garbage Disposal Warranty',
      'subtitle': 'Model GD300',
      'date': '12 Apr 25',
      'category': 'Garbage Disposal',
    },
    {
      'title': 'Microwave Manual',
      'subtitle': 'Panasonic Inverter',
      'date': '30 May 25',
      'category': 'Micro Wave',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Normalize categories for comparison (lowercase, no spaces)
    String normalize(String s) => s.toLowerCase().replaceAll(' ', '');

    final normalizedSelectedCategory = normalize(
      categories[selectedCategoryIndex],
    );

    final filteredDocuments = documentTiles.where((doc) {
      final normalizedDocCategory = normalize(doc['category'].toString());
      return normalizedDocCategory == normalizedSelectedCategory;
    }).toList();

    // Debug prints to check filtering
    // ignore: avoid_print
    print('Selected category: ${categories[selectedCategoryIndex]}');
    // ignore: avoid_print
    print('Filtered docs count: ${filteredDocuments.length}');

    return Scaffold(
      appBar: AppBarBack(),
      backgroundColor: AppColors.surface,
      body: Padding(
        padding: EdgeInsets.all(24.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 40.w),
                Text(
                  'Appliances',
                  style: TextStyles.bold.copyWith(color: AppColors.secondary),
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const DialogAppliance(),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
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
            SizedBox(height: 20.h),

            Wrap(
              alignment: WrapAlignment.center,
              spacing: 6.w,
              runSpacing: 8.h,
              children: List.generate(categories.length, (index) {
                final isSelected = selectedCategoryIndex == index;
                return ElevatedButton(
                  onPressed: () => selectCategory(index),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected
                        ? AppColors.primary
                        : AppColors.lightgrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                  ),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontSize: 12.sp,
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 20.h),
            Text(
              'View All',
              style: TextStyles.medium.copyWith(color: AppColors.black),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 20.h),
            // List View
            Expanded(
              child: filteredDocuments.isEmpty
                  ? Center(
                      child: Text(
                        'No appliances in this category.',
                        style: TextStyles.medium.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    )
                  : ListView.separated(
                      itemCount: filteredDocuments.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        final doc = filteredDocuments[index];
                        return Container(
                          decoration: BoxDecoration(
                            color: AppColors.lightgrey,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: AppColors.lightgrey,
                              width: 1,
                            ),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 24.w,
                            ),
                            title: Text(
                              doc['title'],
                              style: TextStyles.medium.copyWith(
                                fontSize: 20.sp,
                              ),
                            ),
                            subtitle: Text(
                              doc['subtitle'],
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.edit, color: AppColors.black),
                              onPressed: () {
                                Get.toNamed(AppRoutes.editAppliances);
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
