import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/document_tile.dart';

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({super.key});

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  final List<String> categories = [
    "Warranties",
    "Insurance",
    "Receipts",
    "Quotes",
    "Manuals",
    "Other",
  ];

  int selectedCategoryIndex = 0;

  void selectCategory(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
  }

  final List<Map<String, dynamic>> documentTiles = [
    {
      'title': 'Warranty',
      'subtitle': 'Electronics',
      'date': '10 Jun 25',
      'iconPath': 'assets/images/document.png',
      'category': 'Warranties',
    },
    {
      'title': 'Laptop',
      'subtitle': 'Computer',
      'date': '22 Aug 25',
      'iconPath': 'assets/images/document.png',
      'category': 'Warranties',
    },
    {
      'title': 'Warranty',
      'subtitle': 'Electronics',
      'date': '10 Jun 25',
      'iconPath': 'assets/images/document.png',
      'category': 'Warranties',
    },
    {
      'title': 'Laptop',
      'subtitle': 'Computer',
      'date': '22 Aug 25',
      'iconPath': 'assets/images/document.png',
      'category': 'Warranties',
    },
    {
      'title': 'Warranty',
      'subtitle': 'Electronics',
      'date': '10 Jun 25',
      'iconPath': 'assets/images/document.png',
      'category': 'Warranties',
    },
    {
      'title': 'Laptop',
      'subtitle': 'Computer',
      'date': '22 Aug 25',
      'iconPath': 'assets/images/document.png',
      'category': 'Warranties',
    },
    {
      'title': 'Warranty',
      'subtitle': 'Electronics',
      'date': '10 Jun 25',
      'iconPath': 'assets/images/document.png',
      'category': 'Warranties',
    },
    {
      'title': 'Laptop',
      'subtitle': 'Computer',
      'date': '22 Aug 25',
      'iconPath': 'assets/images/document.png',
      'category': 'Warranties',
    },
    {
      'title': 'Warranty',
      'subtitle': 'Electronics',
      'date': '10 Jun 25',
      'iconPath': 'assets/images/document.png',
      'category': 'Warranties',
    },
    {
      'title': 'Laptop',
      'subtitle': 'Computer',
      'date': '22 Aug 25',
      'iconPath': 'assets/images/document.png',
      'category': 'Warranties',
    },

    {
      'title': 'Car',
      'subtitle': 'Vehicle',
      'date': '15 May 25',
      'iconPath': 'assets/images/document.png',
      'category': 'Insurance',
    },
    {
      'title': 'Home Insurance',
      'subtitle': 'Hippo',
      'date': 'Expires: 5/8/25',
      'iconPath': 'assets/images/document.png',
      'category': 'Insurance',
    },

    {
      'title': 'Grocery Receipt',
      'subtitle': 'Shopping',
      'date': '20 Jul 25',
      'iconPath': 'assets/images/document.png',
      'category': 'Receipts',
    },
    {
      'title': 'Electronics Receipt',
      'subtitle': 'Gadgets',
      'date': '12 Jun 25',
      'iconPath': 'assets/images/document.png',
      'category': 'Receipts',
    },

    {
      'title': 'Renovation Quote',
      'subtitle': 'Home Improvement',
      'date': '01 Jul 25',
      'iconPath': 'assets/images/document.png',
      'category': 'Quotes',
    },
    {
      'title': 'Painting Quote',
      'subtitle': 'Interior',
      'date': '15 Jul 25',
      'iconPath': 'assets/images/document.png',
      'category': 'Quotes',
    },

    {
      'title': 'User Manual',
      'subtitle': 'Appliance',
      'date': '12 Apr 25',
      'iconPath': 'assets/images/document.png',
      'category': 'Manuals',
    },
    {
      'title': 'TV Manual',
      'subtitle': 'Electronics',
      'date': '30 May 25',
      'iconPath': 'assets/images/document.png',
      'category': 'Manuals',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredDocuments = documentTiles.where((doc) {
      return doc['category'] == categories[selectedCategoryIndex];
    }).toList();

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
                  'Documents',
                  style: TextStyles.bold.copyWith(color: AppColors.secondary),
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: () {
                    // Get.toNamed(AppRoutes.addDocument);
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

            // Category buttons
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    final isSelected = selectedCategoryIndex == index;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: ElevatedButton(
                        onPressed: () => selectCategory(index),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isSelected
                              ? AppColors.primary
                              : AppColors.lightgrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    final actualIndex = index + 3;
                    final isSelected = selectedCategoryIndex == actualIndex;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: ElevatedButton(
                        onPressed: () => selectCategory(actualIndex),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isSelected
                              ? AppColors.primary
                              : AppColors.lightgrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Text(
                          categories[actualIndex],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
            SizedBox(height: 20.h),

            Expanded(
              child: filteredDocuments.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'No documents in this category.',
                            style: TextStyles.medium.copyWith(
                              color: AppColors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 60.h),
                      ],
                    )
                  : GridView.builder(
                      padding: EdgeInsets.only(
                        left: 4.w,
                        right: 4.w,
                        bottom: 8.h,
                      ),
                      itemCount: filteredDocuments.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 16.w,
                        childAspectRatio: .95,
                      ),
                      itemBuilder: (context, index) {
                        final doc = filteredDocuments[index];
                        return DocumentTile(
                          title: doc['title'],
                          subtitle: doc['subtitle'],
                          date: doc['date'],
                          iconPath: doc['iconPath'],
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Tapped ${doc['title']}")),
                            );
                          },
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
