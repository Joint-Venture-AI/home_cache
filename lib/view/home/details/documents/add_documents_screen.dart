import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';

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

  Future<void> _pickFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print('Picked image from gallery: ${image.path}');
    }
  }

  Future<void> _captureWithCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      print('Captured image from camera: ${image.path}');
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
              Text(
                'New Document',
                style: TextStyles.bold.copyWith(color: AppColors.secondary),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              Text(
                'What type of document are you uploading?',
                style: TextStyles.medium.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              DropdownButtonFormField<String>(
                value: _selectedType,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                ),
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.secondary,
                ),
                hint: Text('Select Document Type', style: TextStyles.medium),
                items: _documentTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type, style: TextStyles.regular),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedType = value;
                  });
                },
              ),
              SizedBox(height: 32.h),
              Text(
                'Upload your document',
                style: TextStyles.medium.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),

              // Upload from Gallery
              InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: _pickFromGallery,
                child: Container(
                  width: 120.w,
                  height: 120.w, // Square shape
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/upload.png",
                        height: 48.w,
                        width: 48.w,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Upload',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16.h),
              Text(
                'Or',
                style: TextStyles.medium.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),

              // Use Camera
              InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: _captureWithCamera,
                child: Container(
                  width: 120.w,
                  height: 120.w, // Square shape
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/camera.png",
                        height: 48.w,
                        width: 48.w,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Use Camera',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Or',
                style: TextStyles.medium.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              InkWell(
                onTap: () {
                  // Get.to(() => YourTargetScreen()); // Replace with your target screen
                },
                child: Text(
                  'Manually Enter Your Details',
                  style: TextStyles.regular.copyWith(
                    color: AppColors.secondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Column(
                  children: [
                    TextWidgetButton(
                      text: 'Sign Up',
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
      ),
    );
  }
}
