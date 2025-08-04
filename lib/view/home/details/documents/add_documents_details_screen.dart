import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/text_style.dart';
import 'package:home_cache/routes.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';
import 'package:home_cache/view/widget/text_field_widget.dart';

class AddDocumentsDetailsScreen extends StatelessWidget {
  const AddDocumentsDetailsScreen({super.key});

  List<Widget> _buildFields(String type) {
    Widget _field(String label) => Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyles.semiBold.copyWith(color: AppColors.black),
              ),
              SizedBox(height: 6.h),
              TextFieldWidget(
                hintText: 'Enter $label',
              ),
            ],
          ),
        );

    switch (type) {
      case 'Warranties':
        return [
          _field('Name'),
          _field('Brand/Manufacturer'),
          _field('Warranty Start Date'),
          _field('Warranty End Date'),
          _field('Serial Number'),
          _field('Service Contact Info'),
        ];
      case 'Insurance':
        return [
          _field('Policy Number'),
          _field('Provider Name'),
          _field('Coverage Start Date'),
          _field('Coverage End Date'),
          _field('Premium Amount'),
          _field('Claim Contact Info'),
        ];
      case 'Receipts':
        return [
          _field('Vendor/Store Name'),
          _field('Date of Purchase'),
          _field('Total Amount Paid'),
          _field('Payment Method'),
          _field('Order Number'),
        ];
      case 'Quotes':
        return [
          _field('Service/Item Quoted'),
          _field('Quote Amount'),
          _field('Quote Date'),
          _field('Vendor/Company Name'),
          _field('Valid Until Date'),
          _field('Contact Info'),
          _field('Quote Reference Number'),
        ];
      case 'Manuals':
        return [
          _field('Title'),
          _field('Brand/Company'),
          _field('Item ID'),
          _field('Model Number'),
          _field('Manual Type'),
          _field('Publication Date'),
        ];
      case 'Other':
      default:
        return [
          _field('Title'),
          _field('Brand / Company'),
          _field('URL'),
          _field('Notes'),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final String docType = (Get.arguments?['type'] ?? 'Other') as String;

    return Scaffold(
      appBar: const AppBarBack(),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'New Document',
                style: TextStyles.bold.copyWith(color: AppColors.secondary),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              ..._buildFields(docType),
              SizedBox(height: 48.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: TextWidgetButton(
                  text: 'Save',
                  onPressed: () {
                    Get.toNamed(AppRoutes.documents);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
