import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/widget/user_management_tile.dart';

class UserManagementTab extends StatefulWidget {
  const UserManagementTab({super.key});

  @override
  State<UserManagementTab> createState() => _UserManagementTabState();
}

class _UserManagementTabState extends State<UserManagementTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'Who Can See Your',
                  style: TextStyles.bold.copyWith(color: AppColors.secondary),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'HomeCache',
                  style: TextStyles.bold.copyWith(color: AppColors.secondary),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(width: 12.w),
            IconButton(
              icon: Icon(Icons.add, size: 32.sp, color: AppColors.secondary),
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(height: 12.h),
        UserManagementTile(
          fullName: 'Vanessa Alvarez',
          role: 'House Resident',
          onTap: () {},
        ),
        UserManagementTile(
          fullName: 'Ahsan Bari',
          role: 'House Resident',
          onTap: () {},
        ),
        UserManagementTile(
          fullName: 'Bob T. Builder',
          role: 'House Resident',
          onTap: () {},
        ),
        UserManagementTile(
          fullName: 'Thomas T.T. Engine',
          role: 'House Resident',
          onTap: () {},
        ),
      ],
    );
  }
}
