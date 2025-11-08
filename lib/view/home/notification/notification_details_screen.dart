import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/assigned_person_tile.dart';
import 'package:home_cache/view/widget/provider_list_tile.dart';

import '../../../../config/route/route_names.dart';

/// Mock API service (replace with real repo/providers later)
class NotificationService {
  Future<Map<String, dynamic>> fetchNotificationDetails() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return {
      "title": "Change Your Air Filters",
      "lastServiceDate": "Jan. 1, 2023",
      "providerName": "HVAC Pros",
      "providerLastUsed": "Used on Jul 15, 2025",
      "providerRating": 4,
    };
  }

  Future<void> assignPerson(Person person) async {
    await Future.delayed(const Duration(milliseconds: 300));
    // API call: assign person
  }
}

class NotificationDetailsScreen extends StatefulWidget {
  const NotificationDetailsScreen({super.key});

  @override
  State<NotificationDetailsScreen> createState() =>
      _NotificationDetailsScreenState();
}

class _NotificationDetailsScreenState extends State<NotificationDetailsScreen> {
  bool _isNameVisible = false;
  bool _isNotificationSettingsVisible = false;

  Person? _selectedPerson;
  late Future<Map<String, dynamic>> _notificationDetails;

  final NotificationService _service = NotificationService();

  @override
  void initState() {
    super.initState();
    _notificationDetails = _service.fetchNotificationDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _notificationDetails,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final data = snapshot.data!;
            return SingleChildScrollView(
              padding: EdgeInsets.all(24.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /// Title
                  Text(
                    data["title"],
                    style: TextStyles.bold.copyWith(color: AppColors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),

                  /// Schedule Status
                  _buildScheduleSection(),

                  SizedBox(height: 24.h),

                  /// Quick Actions
                  _buildQuickActions(),

                  SizedBox(height: 24.h),

                  /// Last Service
                  _buildLastServiceSection(data),

                  SizedBox(height: 20.h),

                  /// Assigned To
                  _buildAssignedSection(),

                  SizedBox(height: 48.h),

                  /// Notification Settings
                  _buildNotificationSettings(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildScheduleSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Schedule',
              style: TextStyles.bold.copyWith(color: AppColors.black),
            ),
            Container(
              height: 40.h,
              width: 40.h,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.check, color: Colors.white, size: 20.sp),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Text('No schedule currently linked.'),
      ],
    );
  }

  Widget _buildQuickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _quickActionTile(
          title: "Link Meeting",
          asset: "assets/images/link.png",
          onTap: () {
            // TODO: API - Link meeting
          },
        ),
        _quickActionTile(
          title: "Schedule Now",
          asset: "assets/images/calender.png",
          onTap: () {
            // Get.toNamed(AppRoutes.calendar);
            showDatePicker(
              context: context,
              firstDate: DateTime(1995),
              lastDate: DateTime(2050),
            );
          },
        ),
      ],
    );
  }

  Widget _quickActionTile({
    required String title,
    required String asset,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 128.w,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: AppColors.lightgrey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Image.asset(asset, height: 48.h, fit: BoxFit.contain),
            SizedBox(height: 12.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black.withAlpha(200),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLastServiceSection(Map<String, dynamic> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Details',
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20.h),
        Text('Last Service On', style: TextStyles.regular),
        SizedBox(height: 5.h),
        Text(data["lastServiceDate"], style: TextStyles.semiBold),
        SizedBox(height: 20.h),
        Text('Last Service By', style: TextStyles.regular),
        ProviderListTile(
          providerName: data["providerName"],
          lastUsedDate: data["providerLastUsed"],
          rating: data["providerRating"],
          isFavorite: false,
          onTap: () => Get.toNamed(RouteNames.providerDetails),
        ),
      ],
    );
  }

  Widget _buildAssignedSection() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isNameVisible = !_isNameVisible;
            });
          },
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.person,
                        size: 20.sp, color: AppColors.primaryLight),
                    SizedBox(width: 8.w),
                    Text('Assigned To',
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                Row(
                  children: [
                    if (_isNameVisible && _selectedPerson != null)
                      Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: Text(
                          _selectedPerson!.name,
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    Icon(
                      _isNameVisible
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                      color: AppColors.primary,
                      size: 24.sp,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Divider(color: Colors.grey),
        if (_isNameVisible)
          AssignedPersonTile(
            name: _selectedPerson?.name ?? 'Select a person',
            role: _selectedPerson?.role ?? '',
            onEdit: () async {
              final selected = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PersonSelectionPage(
                    currentSelection: _selectedPerson,
                    people: [
                      Person(name: 'Vanessa Alvarez', role: 'House Resident'),
                      Person(name: 'Jess Soyak', role: 'House Owner'),
                      Person(name: 'Ahsan Bari', role: 'House Resident'),
                    ],
                  ),
                ),
              );
              if (selected != null) {
                await _service.assignPerson(selected);
                setState(() {
                  _selectedPerson = selected;
                });
              }
            },
          ),
      ],
    );
  }

  Widget _buildNotificationSettings() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isNotificationSettingsVisible = !_isNotificationSettingsVisible;
            });
          },
          behavior: HitTestBehavior.translucent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.notifications,
                      color: AppColors.primaryLight, size: 20.sp),
                  SizedBox(width: 8.w),
                  Text('Notification Settings',
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600)),
                ],
              ),
              Icon(
                _isNotificationSettingsVisible
                    ? Icons.arrow_drop_up
                    : Icons.arrow_drop_down,
                color: AppColors.primary,
                size: 24.sp,
              ),
            ],
          ),
        ),
        const Divider(color: Colors.grey),
        if (_isNotificationSettingsVisible)
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                // TODO: Implement actual notification settings UI
                Text("🔔 Daily reminders"),
                Text("🔔 Push notifications"),
              ],
            ),
          ),
      ],
    );
  }
}

/// Person Model
class Person {
  final String name;
  final String role;

  Person({required this.name, required this.role});
}

class PersonSelectionPage extends StatelessWidget {
  final Person? currentSelection;
  final List<Person> people;

  const PersonSelectionPage({
    super.key,
    required this.currentSelection,
    required this.people,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Assignee',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  color: AppColors.text),
            ),
            Text(
              'Who do you want to assign this task to?',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: people.length,
                itemBuilder: (context, index) {
                  final person = people[index];
                  final isSelected = person == currentSelection;
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 6.h,
                    ),
                    tileColor: Colors.transparent,
                    leading: Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: AppColors.primary, width: 3.w)),
                      child: SvgPicture.asset(
                        'assets/icons/user.svg',
                        width: 24.w,
                        height: 24.w,
                        color: AppColors.primary,
                      ),
                    ),
                    title: Text(
                      person.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      person.role,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context, person);
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
