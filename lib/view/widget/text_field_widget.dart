import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  const TextFieldWidget({
    super.key,
    this.hintText,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.black.withOpacity(.7)),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Colors.grey, width: 1.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Colors.grey, width: 1.5.w),
          ),
        ),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
