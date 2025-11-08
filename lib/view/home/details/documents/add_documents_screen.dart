import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_cache/view/auth/signup/widgets/custom_elevated_button.dart';
import 'package:intl/intl.dart';
import 'package:home_cache/config/route/routes.dart';
import 'package:home_cache/constants/colors.dart' show AppColors, primary;
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/view/home/details/documents/documents_screen.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:home_cache/utils.dart' as utils;

import '../../../../config/route/route_names.dart';

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
  File? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBack(
        title: 'New Document',
        titleColor: AppColors.secondary,
      ),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            children: [
              Text('What type of document are you uploading?',
                  style: AppTypoGraphy.medium.copyWith(color: AppColors.black),
                  textAlign: TextAlign.center),
              SizedBox(height: 24.h),

              // Dropdown
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
                hint: Text('Select Document Type', style: AppTypoGraphy.medium),
                dropdownColor: Color(0xffA7B8BB),
                items: _documentTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type, style: AppTypoGraphy.regular),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _selectedType = value),
              ),
              SizedBox(height: 32.h),

              Text('Upload your document',
                  style: AppTypoGraphy.medium.copyWith(color: AppColors.black),
                  textAlign: TextAlign.center),
              SizedBox(height: 32.h),

              if (_pickedImage != null) ...[
                GestureDetector(
                  onTap: () => showDialog(
                    context: context,
                    builder: (_) => Dialog(
                      child: InteractiveViewer(
                        child: Image.file(File(_pickedImage!.path)),
                      ),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.file(
                      File(_pickedImage!.path),
                      width: 200.w,
                      height: 200.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                TextButton(
                  onPressed: () => setState(() => _pickedImage = null),
                  child: Text('Remove Image',
                      style: AppTypoGraphy.regular
                          .copyWith(color: AppColors.secondary)),
                ),
                SizedBox(height: 16.h),
              ] else ...[
                InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () async {
                    final file = await utils.pickSingleImage(
                        context: context, source: ImageSource.gallery);

                    setState(() {
                      _pickedImage = file;
                    });
                  },
                  child: _uploadButton('Upload', 'assets/images/upload.png'),
                ),
                SizedBox(height: 16.h),
                Text('Or',
                    style:
                        AppTypoGraphy.medium.copyWith(color: AppColors.black)),
                SizedBox(height: 16.h),
                InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () async {
                    final file = await utils.pickSingleImage(
                        context: context, source: ImageSource.camera);

                    setState(() {
                      _pickedImage = file;
                    });
                  },
                  child:
                      _uploadButton('Use Camera', 'assets/images/camera.png'),
                ),
                SizedBox(height: 16.h),
              ],
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.0.sp),
        child: CustomElevatedButton(
          onTap: _proceedNext,
          btnText: 'Next',
          height: 48.h,
        ),
      ),
    );
  }

  void _proceedNext() {
    if (_selectedType == null) {
      Get.snackbar("Missing Info", "Please select a document type.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withAlpha(200),
          colorText: Colors.white);
      return;
    }

    if (_pickedImage == null) {
      Get.toNamed(
        RouteNames.addDocumentsDetails,
      );
      return;
    }

    // Create the document with all required fields
    final document = DocumentModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: _selectedType!,
      subtitle: 'Uploaded document',
      date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
      iconPath: 'assets/images/document.png',
      category: _selectedType!,
      imagePath: _pickedImage!.path,
    );

    final DocumentsController controller = Get.find<DocumentsController>();
    controller.addDocument(document);

    // Get the controller and add the document
    // final DocumentsController = Get.find<DocumentsController>();
    // controller.addDocument(document);

    // Navigate to preview
    Get.toNamed(
      RouteNames.previewDocument,
      arguments: document.toJson(),
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
            offset: const Offset(0, 4),
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
