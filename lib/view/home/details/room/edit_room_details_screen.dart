import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/home/details/room/add_room_team_dialog.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';

class EditRoomDetailsScreen extends StatefulWidget {
  const EditRoomDetailsScreen({super.key});

  @override
  State<EditRoomDetailsScreen> createState() => _EditRoomDetailsScreenState();
}

class _EditRoomDetailsScreenState extends State<EditRoomDetailsScreen> {
  final List<String> categories = [
    "Replace",
    "Paint",
    "Sink",
    "Toilet",
    "Shower",
    "Bath Tub",
  ];

  int selectedCategoryIndex = 0;

  void selectCategory(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
  }

  final List<Map<String, dynamic>> documentTiles = [
    {
      'title': 'Replace Ceiling',
      'subtitle': 'ce color',
      'date': '01 Jul 25',
      'category': 'Replace',
    },
    {
      'title': 'Wall Paint Info',
      'subtitle': 'ce color',
      'date': '02 Jul 25',
      'category': 'Paint',
    },
    {
      'title': 'Sink Maintenance',
      'subtitle': 'ce color',
      'date': '03 Jul 25',
      'category': 'Sink',
    },
    {
      'title': 'Toilet Model Details',
      'subtitle': 'ce color',
      'date': '04 Jul 25',
      'category': 'Toilet',
    },
    {
      'title': 'Shower Head Specs',
      'subtitle': 'ce color',
      'date': '05 Jul 25',
      'category': 'Shower',
    },
    {
      'title': 'Bath Tub Warranty',
      'subtitle': 'ce color',
      'date': '06 Jul 25',
      'category': 'Bath Tub',
    },
  ];

  @override
  Widget build(BuildContext context) {
    String normalize(String s) => s.toLowerCase().replaceAll(' ', '');
    final normalizedSelectedCategory = normalize(
      categories[selectedCategoryIndex],
    );

    final filteredDocuments = documentTiles.where((doc) {
      final normalizedDocCategory = normalize(doc['category'].toString());
      return normalizedDocCategory == normalizedSelectedCategory;
    }).toList();

    return Scaffold(
      appBar: AppBarBack(),
      backgroundColor: AppColors.surface,
      body: Padding(
        padding: EdgeInsets.all(24.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 40.w),
                Text(
                  'Room',
                  style: TextStyles.bold.copyWith(color: AppColors.secondary),
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const AddRoomTeamDialog(),
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

            // Image Container
            Container(
              padding: EdgeInsets.all(8.w),
              height: 140.h,
              decoration: BoxDecoration(
                color: AppColors.lightgrey,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/addimage.png',
                  height: 50.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            SizedBox(height: 20.h),

            // Category Buttons
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

            // List of Documents
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
                                //Get.toNamed(AppRoutes.editAppliances);
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
