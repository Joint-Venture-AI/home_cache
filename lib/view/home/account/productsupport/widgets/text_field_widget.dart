import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final bool isReadable;
  final FocusNode? focusNode;

  const TextFieldWidget({
    super.key,
    this.hintText,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.isReadable = false,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: TextFormField(
        focusNode: focusNode,
        readOnly: isReadable,
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.black.withAlpha(180)),
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
