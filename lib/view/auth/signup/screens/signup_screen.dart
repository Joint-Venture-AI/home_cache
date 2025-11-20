import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/controller/auth_controller.dart';
import 'package:home_cache/utils/form_validator.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/auth/widgets/auth_text_form_field.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';

import '../../../../constants/app_assets.dart';
import '../../widgets/custom_social_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  final FormValidator formValidator = FormValidator();

  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBarBack(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Form(
            key: _fromKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 30.h),
                Text(
                  'Create A New Account',
                  style:
                      AppTypoGraphy.bold.copyWith(color: AppColors.secondary),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.h),
                Text(
                  'Name',
                  style:
                      AppTypoGraphy.semiBold.copyWith(color: AppColors.black),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Expanded(
                        child: AuthTextFormField(
                      hintText: 'First',
                      controller: _firstNameTEController,
                      validator: formValidator.validateName,
                    )),
                    SizedBox(width: 16.w),
                    Expanded(
                        child: AuthTextFormField(
                      hintText: 'Last',
                      controller: _lastNameTEController,
                      validator: formValidator.validateName,
                    )),
                  ],
                ),
                SizedBox(height: 20.h),
                Text(
                  'Email',
                  style:
                      AppTypoGraphy.semiBold.copyWith(color: AppColors.black),
                  textAlign: TextAlign.start,
                ),
                AuthTextFormField(
                  hintText: 'example@example.com',
                  controller: _emailTEController,
                  validator: formValidator.validateEmail,
                ),
                SizedBox(height: 20.h),
                Text(
                  'Password',
                  style:
                      AppTypoGraphy.semiBold.copyWith(color: AppColors.black),
                  textAlign: TextAlign.start,
                ),
                AuthTextFormField(
                  hintText: '*************',
                  controller: _passwordTEController,
                  validator: formValidator.validatePassword,
                ),
                SizedBox(height: 34.h),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: AppTypoGraphy.regular.copyWith(
                      color: AppColors.black,
                      fontSize: 14.sp,
                    ),
                    children: [
                      const TextSpan(text: 'By continuing, you agree to '),
                      TextSpan(
                        text: 'Terms of Use',
                        style: AppTypoGraphy.regular.copyWith(
                          color: AppColors.secondary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy.',
                        style: AppTypoGraphy.regular.copyWith(
                          color: AppColors.secondary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: Column(
                    children: [
                      Obx(
                        () => TextWidgetButton(
                          text: 'Sign Up',
                          onPressed: _signUpButton,
                          isLoading: _authController.isLoading.value,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.h),
                Text(
                  'Or Sign Up with',
                  style: AppTypoGraphy.semiBold.copyWith(
                    color: AppColors.black,
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.h),
                Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  children: [
                    CustomSocialButton(
                      btnIcon: AppAssets.googleIcon,
                      onTap: () {},
                    ),
                    CustomSocialButton(
                      btnIcon: AppAssets.appleIcon,
                      onTap: () {},
                    ),
                    CustomSocialButton(
                      btnIcon: AppAssets.microsoftIcon,
                      onTap: () {},
                    ),
                    CustomSocialButton(
                      btnIcon: AppAssets.metaIcon,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signUpButton() {
    formValidator.validateAndProceed(
      _fromKey,
      () {
        _authController.signUp({
          "email": _emailTEController.text,
          "password": _passwordTEController.text,
          "profile": {
            "first_name": _firstNameTEController.text,
            "last_name": _lastNameTEController.text
          }
        });
      },
    );
  }
}
