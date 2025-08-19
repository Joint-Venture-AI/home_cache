// household_management_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/home/account/householdmanagement/tab/assigned_task_tab.dart';
import 'package:home_cache/view/home/account/householdmanagement/tab/recent_activity_tab.dart';
import 'package:home_cache/view/home/account/householdmanagement/tab/services_settings_tab.dart';
import 'package:home_cache/view/home/account/householdmanagement/tab/user_management_tab.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';

class HouseholdManagementScreen extends StatefulWidget {
  const HouseholdManagementScreen({super.key});

  @override
  State<HouseholdManagementScreen> createState() =>
      _HouseholdManagementScreenState();
}

class _HouseholdManagementScreenState extends State<HouseholdManagementScreen> {
  final List<String> tabTitles = [
    'Recent Activity',
    'Services Settings',
    'Assigned Task',
    'User Management',
  ];

  int selectedIndex = 0;

  void selectTab(int index) {
    setState(() => selectedIndex = index);
  }

  Widget _buildTabContent() {
    switch (selectedIndex) {
      case 0:
        return const RecentActivityTab();
      case 1:
        return const ServicesSettingsTab();
      case 2:
        return const AssignedTaskTab();
      case 3:
        return const UserManagementTab();
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBack(),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title
            Padding(
              padding: EdgeInsets.only(top: 24.h, bottom: 16.h),
              child: Text(
                tabTitles[selectedIndex],
                style: TextStyles.bold.copyWith(
                  color: AppColors.primary,
                  fontSize: 24.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Horizontal Tabs
            SizedBox(
              height: 40.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemBuilder: (context, index) {
                  final isSelected = selectedIndex == index;
                  return ElevatedButton(
                    onPressed: () => selectTab(index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isSelected ? AppColors.primary : AppColors.lightgrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                    ),
                    child: Text(
                      tabTitles[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontSize: 12.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
                separatorBuilder: (_, __) => SizedBox(width: 8.w),
                itemCount: tabTitles.length,
              ),
            ),

            SizedBox(height: 16.h),

            // Tab Content
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: _buildTabContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
