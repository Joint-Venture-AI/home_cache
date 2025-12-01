import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';

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
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 6.h),
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
                    title: Text(person.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(person.role,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        )),
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
