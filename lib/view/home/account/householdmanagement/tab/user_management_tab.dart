import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/view/home/account/productsupport/widgets/text_field_widget.dart';
import 'package:home_cache/view/home/account/widgets/user_management_tile.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';

class UserManagementTab extends StatefulWidget {
  const UserManagementTab({super.key});

  @override
  State<UserManagementTab> createState() => _UserManagementTabState();
}

class _UserManagementTabState extends State<UserManagementTab> {
  bool isAddingUser = false;

  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final List<Map<String, String>> users = [
    {'name': 'Vanessa Alvarez', 'role': 'House Resident'},
    {'name': 'Ahsan Bari', 'role': 'House Resident'},
    {'name': 'Bob T. Builder', 'role': 'House Resident'},
    {'name': 'Thomas T.T. Engine', 'role': 'House Resident'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Header Row
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Column(
            //   children: [
            //     Text(
            //       'Who Can See Your',
            //       style: AppTypoGraphy.bold.copyWith(color: AppColors.secondary),
            //       textAlign: TextAlign.center,
            //     ),
            //     Text(
            //       'HomeCache',
            //       style: AppTypoGraphy.bold.copyWith(color: AppColors.secondary),
            //       textAlign: TextAlign.center,
            //     ),
            //   ],
            // ),

            SizedBox(
              width: 200.w,
              child: Text('Who can see your homeCache',
                  style: AppTypoGraphy.bold.copyWith(color: AppColors.secondary)),
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
                            controller: fnameController,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextFieldWidget(
                            hintText: 'Last Name',
                            controller: lnameController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    TextFieldWidget(
                      hintText: 'Email',
                      controller: emailController,
                    ),
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: TextWidgetButton(
                        text: 'Send Invite',
                        onPressed: () {
                          setState(() {
                            isAddingUser = !isAddingUser;
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  '"${emailController.text}" send email Successfully'),
                              duration: const Duration(seconds: 3),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        else
          ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
          
              return Dismissible(
                key: ValueKey(user['name']), // unique key
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                onDismissed: (direction) {
                  // Save removed user
                  final removedUser = user;
                  final removedIndex = index;
          
                  setState(() {
                    users.removeAt(index);
                  });
          
                  // Show snackbar with UNDO
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${removedUser['name']} removed'),
                      duration: const Duration(seconds: 3),
                      action: SnackBarAction(
                        label: 'Undo',
                        textColor: Colors.yellow,
                        onPressed: () {
                          setState(() {
                            users.insert(removedIndex, removedUser);
                          });
                        },
                      ),
                    ),
                  );
                },
                child: UserManagementTile(
                  onTap: () {},
                  fullName: user['name']!,
                  role: user['role']!,
                ),
              );
            },
          ),
      ],
    );
  }
}
