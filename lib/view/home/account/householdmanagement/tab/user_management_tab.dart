import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';
import 'package:home_cache/view/widget/text_field_widget.dart';
import 'package:home_cache/view/widget/user_management_tile.dart';

class UserManagementTab extends StatefulWidget {
  const UserManagementTab({super.key});

  @override
  State<UserManagementTab> createState() => _UserManagementTabState();
}

class _UserManagementTabState extends State<UserManagementTab> {
  bool isAddingUser = false;

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
              icon: Icon(
                isAddingUser ? Icons.close : Icons.add,
                size: 32.sp,
                color: AppColors.secondary,
              ),
              onPressed: () {
                setState(() {
                  isAddingUser = !isAddingUser;
                });
              },
            ),
          ],
        ),
        SizedBox(height: 12.h),
        if (isAddingUser)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 218.h,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        Expanded(
                            child: TextFieldWidget(
                          hintText: 'First Name',
                        )),
                        SizedBox(width: 12.w),
                        Expanded(
                            child: TextFieldWidget(
                          hintText: 'Last Name',
                        )),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    TextFieldWidget(
                      hintText: 'Email',
                    ),
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: Column(
                        children: [
                          TextWidgetButton(
                            text: 'Send Invite',
                            onPressed: () {
                              // Get.toNamed(AppRoutes.selectHouse);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        else
          Column(
            children: [
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
          ),
      ],
    );
  }
}
