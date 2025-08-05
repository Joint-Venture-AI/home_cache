import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';
import 'package:image_picker/image_picker.dart';

class AddDocumentsScreen extends StatefulWidget {
  const AddDocumentsScreen({super.key});

  @override
  State<AddDocumentsScreen> createState() => _AddDocumentsScreenState();
}

class _AddDocumentsScreenState extends State<AddDocumentsScreen> {
  final List<String> _documentTypes = [
    "Warranties",
    "Insurance",
    "Receipts",
    "Quotes",
    "Manuals",
    "Other",
  ];

  String? _selectedType;
  final ImagePicker _picker = ImagePicker();
  XFile? _pickedImage;

  Future<void> _pickFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() => _pickedImage = image);
    }
  }

  Future<void> _captureWithCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() => _pickedImage = image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBack(),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            children: [
              Text('New Document',
                  style: TextStyles.bold.copyWith(color: AppColors.secondary),
                  textAlign: TextAlign.center),
              SizedBox(height: 24.h),
              Text('What type of document are you uploading?',
                  style: TextStyles.medium.copyWith(color: AppColors.black),
                  textAlign: TextAlign.center),
              SizedBox(height: 24.h),

              // Dropdown for document type
              DropdownButtonFormField<String>(
                value: _selectedType,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                ),
                icon: Icon(Icons.keyboard_arrow_down_rounded,
                    color: AppColors.secondary),
                hint: Text('Select Document Type', style: TextStyles.medium),
                items: _documentTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type, style: TextStyles.regular),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _selectedType = value),
              ),
              SizedBox(height: 32.h),

              Text('Upload your document',
                  style: TextStyles.medium.copyWith(color: AppColors.black),
                  textAlign: TextAlign.center),
              SizedBox(height: 32.h),

              if (_pickedImage != null) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.file(
                    File(_pickedImage!.path),
                    width: 200.w,
                    height: 200.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16.h),
                TextButton(
                  onPressed: () => setState(() => _pickedImage = null),
                  child: Text('Remove Image',
                      style: TextStyles.regular
                          .copyWith(color: AppColors.secondary)),
                ),
                SizedBox(height: 16.h),
              ] else ...[
                // Upload Button
                InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: _pickFromGallery,
                  child: _uploadButton('Upload', 'assets/images/upload.png'),
                ),
                SizedBox(height: 16.h),
                Text('Or',
                    style: TextStyles.medium.copyWith(color: AppColors.black),
                    textAlign: TextAlign.center),
                SizedBox(height: 16.h),

                // Camera Button
                InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: _captureWithCamera,
                  child:
                      _uploadButton('Use Camera', 'assets/images/camera.png'),
                ),
                SizedBox(height: 16.h),
                Text('Or',
                    style: TextStyles.medium.copyWith(color: AppColors.black),
                    textAlign: TextAlign.center),
                SizedBox(height: 16.h),
              ],

              InkWell(
                onTap: () {},
                child: Text('Manually Enter Your Details',
                    style:
                        TextStyles.regular.copyWith(color: AppColors.secondary),
                    textAlign: TextAlign.center),
              ),
              SizedBox(height: 16.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: TextWidgetButton(
                  text: '→  Next',
                  onPressed: () {
                    if (_selectedType != null) {
                      Get.toNamed(AppRoutes.previewDocument, arguments: {
                        'type': _selectedType,
                        'imagePath': _pickedImage?.path,
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _uploadButton(String label, String assetPath) {
    return Container(
      width: 120.w,
      height: 120.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(assetPath,
              height: 48.w, width: 48.w, fit: BoxFit.contain),
          SizedBox(height: 8.h),
          Text(label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
