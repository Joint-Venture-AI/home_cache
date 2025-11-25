import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/view/auth/signup/widgets/custom_elevated_button.dart';
import 'package:home_cache/view/home/account/productsupport/widgets/text_field_widget.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';

class AddDocumentsDetailsScreen extends StatelessWidget {
  const AddDocumentsDetailsScreen({super.key});

  List<Widget> _buildFields(String type) {
    Widget field(String label) => Padding(
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
                controller: SearchController(),
              ),
            ],
          ),
        );

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

  @override
  Widget build(BuildContext context) {
    final String docType = (Get.arguments?['type'] ?? 'Other') as String;
    final String filePath = Get.arguments['imagePath'];

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 24.h),
              ..._buildFields(docType),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.0.sp),
        child: CustomElevatedButton(
          onTap: () {
            // Get.toNamed(RouteNames.documents);

            // print();

            print('File path: $filePath');
          },
          btnText: 'Save',
          height: 48.h,
        ),
      ),
    );
  }
}
