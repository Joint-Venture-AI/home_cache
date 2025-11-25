import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/controller/add_document_controller.dart';
import 'package:home_cache/view/auth/signup/widgets/custom_elevated_button.dart';
import 'package:home_cache/view/home/account/productsupport/widgets/text_field_widget.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import '../../../../config/route/route_names.dart';

class AddDocumentsDetailsScreen extends StatefulWidget {
  const AddDocumentsDetailsScreen({super.key});

  @override
  State<AddDocumentsDetailsScreen> createState() =>
      _AddDocumentsDetailsScreenState();
}

class _AddDocumentsDetailsScreenState extends State<AddDocumentsDetailsScreen> {
  late final String docType;
  String? filePath;

  final Map<String, TextEditingController> controllers = {};

  final AddDocumentController _addDocumentController =
      Get.put(AddDocumentController());

  @override
  void initState() {
    super.initState();
    final Map<String, dynamic> args = Get.arguments ?? {};
    docType = args['type'] ?? 'Other';
    filePath = args['imagePath'];
  }

  List<Widget> _buildFields(String type) {
    Widget field(String label) {
      final controller = TextEditingController();
      controllers[label] = controller;

      return Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTypoGraphy.semiBold.copyWith(color: AppColors.black),
            ),
            SizedBox(height: 6.h),
            TextFieldWidget(
              hintText: 'Enter $label',
              controller: controller,
            ),
          ],
        ),
      );
    }

    switch (type) {
      case 'Warranties':
        return [
          field('Name'),
          field('Brand/Manufacturer'),
          field('Warranty Start Date'),
          field('Warranty End Date'),
          field('Serial Number'),
          field('Service Contact Info'),
        ];
      case 'Insurance':
        return [
          field('Policy Number'),
          field('Provider Name'),
          field('Coverage Start Date'),
          field('Coverage End Date'),
          field('Premium Amount'),
          field('Claim Contact Info'),
        ];
      case 'Receipts':
        return [
          field('Vendor/Store Name'),
          field('Date of Purchase'),
          field('Total Amount Paid'),
          field('Payment Method'),
          field('Order Number'),
        ];
      case 'Quotes':
        return [
          field('Service/Item Quoted'),
          field('Quote Amount'),
          field('Quote Date'),
          field('Vendor/Company Name'),
          field('Valid Until Date'),
          field('Contact Info'),
          field('Quote Reference Number'),
        ];
      case 'Manuals':
        return [
          field('Title'),
          field('Brand/Company'),
          field('Item ID'),
          field('Model Number'),
          field('Manual Type'),
          field('Publication Date'),
        ];
      case 'Other':
      default:
        return [
          field('Title'),
          field('Brand / Company'),
          field('URL'),
          field('Notes'),
        ];
    }
  }

  void _saveDocument() {
    // Collect input fields
    final Map<String, dynamic> fieldData = {};
    controllers.forEach((label, controller) {
      fieldData[label] = controller.text;
    });

    // Prepare JSON
    final Map<String, String> documentData = {
      "type": docType,
      "title": fieldData['Title'] ?? '',
      "brand":
          fieldData['Brand/Manufacturer'] ?? fieldData['Brand / Company'] ?? '',
      "url": fieldData['URL'] ?? '',
      "note": fieldData['Notes'] ?? '',
      // "created_at": DateTime.now().toIso8601String(),
    };

    // Set selected file for upload
    if (filePath != null) {
      _addDocumentController.selectedFile.value = File(filePath!);
    }

    print('Prepared Document JSON:=====>>>> $documentData');

    // Upload document
    _addDocumentController.addDocument(documentData);
    Get.offAndToNamed(RouteNames.documents);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBack(
        title: 'Document Details',
        titleColor: AppColors.secondary,
      ),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Show uploaded file preview
              if (filePath != null)
                Container(
                  height: 200.h,
                  margin: EdgeInsets.only(bottom: 16.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: filePath!.endsWith('.pdf')
                      ? Center(
                          child: Text('PDF File: ${filePath!.split('/').last}'),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            File(filePath!),
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),

              // Dynamic fields
              ..._buildFields(docType),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.0.sp),
        child: CustomElevatedButton(
          onTap: _saveDocument,
          btnText: 'Save',
          height: 48.h,
        ),
      ),
    );
  }
}
