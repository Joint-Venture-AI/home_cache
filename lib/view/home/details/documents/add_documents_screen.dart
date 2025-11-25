import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_cache/controller/add_document_controller.dart';
import 'package:home_cache/view/auth/signup/widgets/custom_elevated_button.dart';
import 'package:home_cache/view/home/details/documents/documents_screen.dart';
import 'package:intl/intl.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:image_picker/image_picker.dart';
import 'package:home_cache/utils.dart' as utils;
import '../../../../config/route/route_names.dart';

import 'package:home_cache/view/widget/appbar_back_widget.dart';

class AddDocumentsScreen extends StatefulWidget {
  const AddDocumentsScreen({super.key});

  @override
  State<AddDocumentsScreen> createState() => _AddDocumentsScreenState();
}

class _AddDocumentsScreenState extends State<AddDocumentsScreen> {
  final AddDocumentController controller = Get.put(AddDocumentController());

  final List<String> _documentTypes = [
    "Warranties",
    "Insurance",
    "Receipts",
    "Quotes",
    "Manuals",
    "Other",
  ];

  String? _selectedType;
  File? _pickedFile;

  //! Pick file from storage
  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.any);

    if (result != null) {
      final file = File(result.files.single.path!);

      setState(() => _pickedFile = file);
      controller.selectedFile.value = file;

      print("Picked File: ${file.path}");
    }
  }

  //! Pick image from camera
  Future<void> pickFromCamera() async {
    final file = await utils.pickSingleImage(
      context: context,
      source: ImageSource.camera,
    );

    if (file != null) {
      setState(() => _pickedFile = file);
      controller.selectedFile.value = file;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBack(
        title: 'New Document',
        titleColor: AppColors.secondary,
      ),
      backgroundColor: AppColors.surface,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('What type of document are you uploading?',
                style: AppTypoGraphy.medium.copyWith(color: AppColors.black),
                textAlign: TextAlign.center),

            SizedBox(height: 24.h),

            // Document Type Dropdown
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
              dropdownColor: const Color(0xffA7B8BB),
              items: _documentTypes.map((type) {
                return DropdownMenuItem(value: type, child: Text(type));
              }).toList(),
              onChanged: (value) => setState(() => _selectedType = value),
            ),

            SizedBox(height: 32.h),

            Text("Upload your document",
                style: AppTypoGraphy.medium, textAlign: TextAlign.center),
            SizedBox(height: 32.h),

            //* FILE PREVIEW
            if (_pickedFile != null) ...[
              GestureDetector(
                onTap: () {
                  if (controller.isImage()) {
                    showDialog(
                      context: context,
                      builder: (_) => Dialog(
                        child: InteractiveViewer(
                          child: Image.file(_pickedFile!),
                        ),
                      ),
                    );
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: controller.isImage()
                      ? Image.file(
                          _pickedFile!,
                          width: 200.w,
                          height: 200.w,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          width: 200,
                          height: 200,
                          color: Colors.grey.shade300,
                          child: Icon(
                            controller.isPDF()
                                ? Icons.picture_as_pdf
                                : Icons.insert_drive_file,
                            size: 64,
                            color: AppColors.secondary,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 16.h),
              TextButton(
                child: Text("Remove File",
                    style:
                        TextStyle(color: AppColors.secondary, fontSize: 14.sp)),
                onPressed: () {
                  controller.removeFile();
                  setState(() => _pickedFile = null);
                },
              ),
              SizedBox(height: 16.h),
            ],

            //* PICK BUTTONS
            if (_pickedFile == null) ...[
              InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: pickFile,
                child: _uploadButton('Upload', 'assets/images/upload.png'),
              ),
              SizedBox(height: 16.h),
              Text("Or", style: AppTypoGraphy.medium),
              SizedBox(height: 16.h),
              InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: pickFromCamera,
                child: _uploadButton('Use Camera', 'assets/images/camera.png'),
              ),
            ],
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0.sp),
          child: CustomElevatedButton(
            onTap: _proceedNext,
            btnText: 'Next',
            height: 48.h,
          ),
        ),
      ),
    );
  }

  //! Handle NEXT button
  void _proceedNext() {
    if (_selectedType == null) {
      Get.snackbar(
        "Missing Info",
        "Please select a document type.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(.8),
        colorText: Colors.white,
      );
      return;
    }

    // No file selected → go to details screen
    if (_pickedFile == null) {
      Get.toNamed(RouteNames.addDocumentsDetails);
      return;
    }

    // Create new Document model
    final document = DocumentModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: _selectedType!,
      subtitle: 'Uploaded document',
      date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
      iconPath: 'assets/images/document.png',
      category: _selectedType!,
      imagePath: _pickedFile!.path,
    );

    // Save document
    final DocumentsController docs = Get.find<DocumentsController>();
    docs.addDocument(document);

    // Go to preview
    Get.toNamed(RouteNames.previewDocument, arguments: {
      document.toJson(),
    });
  }

  Widget _uploadButton(String label, String assetPath) {
    return Container(
      width: 140.w,
      height: 140.w,
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
          Image.asset(assetPath, height: 48.w, width: 48.w),
          SizedBox(height: 8.h),
          Text(label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
