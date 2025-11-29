import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/controller/add_document_controller.dart';
import 'package:home_cache/model/document.dart';
import 'package:home_cache/view/home/account/productsupport/widgets/text_field_widget.dart';
import 'package:home_cache/view/home/details/widgets/online_pdf_viewer.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:intl/intl.dart';

class DocumentsDetailsScreen extends StatefulWidget {
  const DocumentsDetailsScreen({super.key});

  @override
  State<DocumentsDetailsScreen> createState() => _DocumentsDetailsScreenState();
}

class _DocumentsDetailsScreenState extends State<DocumentsDetailsScreen> {
  int selectedToggleIndex = 0;

  final Document args = Get.arguments as Document;

  final AddDocumentController controller = Get.put(AddDocumentController());
  final Map<String, TextEditingController> controllers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(
        title: 'Documents',
        titleColor: AppColors.secondary,
        actions: [
          Obx(
            () => controller.isReadable.value
                ? IconButton(
                    onPressed: () {
                      controller.isReadable.value =
                          !controller.isReadable.value;
                    },
                    icon: Icon(Icons.edit))
                : IconButton(
                    onPressed: () {
                      _updateDocuments();
                      controller.isReadable.value =
                          !controller.isReadable.value;
                    },
                    icon: Icon(Icons.save)),
          )
        ],
      ),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Toggle Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(2, (index) {
                  final labels = ['Documents', 'Details'];
                  final isSelected = selectedToggleIndex == index;
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedToggleIndex = index;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isSelected
                            ? AppColors.primary
                            : AppColors.lightgrey,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Text(
                        labels[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  );
                }),
              ),

              SizedBox(height: 24.h),

              if (selectedToggleIndex == 0) ...[
                Text(
                  args.type.toString(),
                  style: AppTypoGraphy.medium.copyWith(color: AppColors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4.h),
                Text(
                  args.details.warrantyEndDate != null
                      ? "Expires ${DateFormat('dd/MM/yyyy').format(
                          DateTime.parse(args.details.warrantyEndDate!),
                        )}"
                      : 'Expired Date not found',
                  style: AppTypoGraphy.regular.copyWith(color: AppColors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Spacer(),
                    Image.asset(
                      'assets/images/download.png',
                      width: 24.w,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10),
                    Image.asset(
                      'assets/images/expand.png',
                      width: 24.w,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  height: 400.h,
                  child: args.files.isNotEmpty
                      ? OnlinePdfViewer(url: args.files.first.fileUrl)
                      : Center(child: Text('No document available')),
                ),
              ] else ...[
                ..._buildDetailsFields(args),
              ],
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDetailsFields(Document doc) {
    bool isFirstField = true;

    Widget detailField(String label, String value) {
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
            Obx(() => TextFieldWidget(
                  controller: TextEditingController(text: value),
                  isReadable: controller.isReadable.value,
                  focusNode: isFirstField ? controller.firstFieldFocus : null,
                )),
          ],
        ),
      );
    }

    List<Widget> fields = [];

    switch (doc.type.toLowerCase()) {
      case 'warranty':
        fields.add(detailField("Name", doc.details.name ?? ""));
        isFirstField = false;
        fields.addAll([
          detailField("Brand/Manufacturer", doc.details.brand ?? ""),
          detailField(
              "Warranty Start Date", doc.details.warrantyStartDate ?? ""),
          detailField("Warranty End Date", doc.details.warrantyEndDate ?? ""),
          detailField("Serial Number", doc.details.serialNumber ?? ""),
          detailField(
              "Service Contact Info", doc.details.serviceContactInfo ?? ""),
        ]);
        break;

      case 'insurance':
        fields
            .add(detailField("Policy Number", doc.details.policyNumber ?? ""));
        isFirstField = false;
        fields.addAll([
          detailField("Provider Name", doc.details.providerName ?? ""),
          detailField(
              "Coverage Start Date", doc.details.coverageStartDate ?? ""),
          detailField("Coverage End Date", doc.details.coverageEndDate ?? ""),
          detailField("Premium Amount", doc.details.premiumAmount.toString()),
          detailField(
              "Claim Contact Info", doc.details.serviceContactInfo ?? ""),
        ]);
        break;

      case 'receipt':
        fields.add(detailField(
            "Vendor/Store Name", doc.details.vendorStoreName ?? ""));
        isFirstField = false;
        fields.addAll([
          detailField("Date of Purchase", doc.details.dateOfPurchase ?? ""),
          detailField(
              "Total Amount Paid", doc.details.totalAmountPaid.toString()),
          detailField("Payment Method", doc.details.paymentMethod ?? ""),
          detailField("Order Number", doc.details.orderNumber ?? ""),
        ]);
        break;

      case 'quote':
        fields.add(detailField(
            "Service/Item Quoted", doc.details.serviceItemQuoted ?? ""));
        isFirstField = false;
        fields.addAll([
          detailField("Quote Amount", doc.details.quoteAmount.toString()),
          detailField("Quote Date", doc.details.quoteDate ?? ""),
          detailField(
              "Vendor/Company Name", doc.details.vendorCompanyName ?? ""),
          detailField("Valid Until Date", doc.details.validUntilDate ?? ""),
          detailField("Contact Info", doc.details.contactInfo ?? ""),
          detailField(
              "Quote Reference Number", doc.details.quoteReferenceNumber ?? ""),
        ]);
        break;

      case 'manual':
        fields.add(detailField("Title", doc.details.title ?? ""));
        isFirstField = false;
        fields.addAll([
          detailField("Brand/Company", doc.details.brandCompany ?? ""),
          detailField("Item ID", doc.details.itemId ?? ""),
          detailField("Model Number", doc.details.modelNumber ?? ""),
          detailField("Manual Type", doc.details.manualType ?? ""),
          detailField("Publication Date", doc.details.publicationDate ?? ""),
        ]);
        break;

      default:
        fields.add(detailField("Title", doc.details.otherTitle ?? ""));
        isFirstField = false;
        fields.addAll([
          detailField("Brand/Company", doc.details.otherBrandCompany ?? ""),
          detailField("URL", doc.details.url ?? ""),
          detailField("Notes", doc.details.notes ?? ""),
        ]);
    }

    return fields;
  }

  void _updateDocuments() async {
    final fieldData = {
      for (var entry in controllers.entries) entry.key: entry.value.text.trim(),
    };

    void addFieldIfNotEmpty(Map<String, dynamic> target, String key,
        String? typedValue, String? existingValue) {
      final value = typedValue?.isNotEmpty == true
          ? typedValue
          : (existingValue?.isNotEmpty == true ? existingValue : null);

      if (value != null) {
        target[key] = value;
      }
    }

    // FIX: Ensure "data" is always a Map<String, dynamic>
    final Map<String, dynamic> data = {
      "type": args.type.toLowerCase(),
      "data": <String, dynamic>{},
    };

    // Safe reference
    final details = data["data"] as Map<String, dynamic>;

    switch (args.type.toLowerCase()) {
      case 'warranty':
        addFieldIfNotEmpty(
            details, "name", fieldData['Name'], args.details.name);
        addFieldIfNotEmpty(details, "brand", fieldData['Brand/Manufacturer'],
            args.details.brand);
        addFieldIfNotEmpty(details, "warranty_start_date",
            fieldData['Warranty Start Date'], args.details.warrantyStartDate);
        addFieldIfNotEmpty(details, "warranty_end_date",
            fieldData['Warranty End Date'], args.details.warrantyEndDate);
        addFieldIfNotEmpty(details, "serial_number", fieldData['Serial Number'],
            args.details.serialNumber);
        addFieldIfNotEmpty(details, "service_contact_info",
            fieldData['Service Contact Info'], args.details.serviceContactInfo);
        break;

      case 'insurance':
        addFieldIfNotEmpty(details, "policy_number", fieldData['Policy Number'],
            args.details.policyNumber);
        addFieldIfNotEmpty(details, "provider_name", fieldData['Provider Name'],
            args.details.providerName);
        addFieldIfNotEmpty(details, "coverage_start_date",
            fieldData['Coverage Start Date'], args.details.coverageStartDate);
        addFieldIfNotEmpty(details, "coverage_end_date",
            fieldData['Coverage End Date'], args.details.coverageEndDate);
        addFieldIfNotEmpty(
            details,
            "premium_amount",
            fieldData['Premium Amount'],
            args.details.premiumAmount?.toString());
        addFieldIfNotEmpty(details, "claim_contact_info",
            fieldData['Claim Contact Info'], args.details.claimContactInfo);
        break;

      case 'receipt':
        addFieldIfNotEmpty(details, "vendor_store_name",
            fieldData['Vendor/Store Name'], args.details.vendorStoreName);
        addFieldIfNotEmpty(details, "date_of_purchase",
            fieldData['Date of Purchase'], args.details.dateOfPurchase);

        // Fix number issue
        addFieldIfNotEmpty(
            details,
            "total_amount_paid",
            fieldData['Total Amount Paid'],
            args.details.totalAmountPaid?.toString());

        addFieldIfNotEmpty(details, "payment_method",
            fieldData['Payment Method'], args.details.paymentMethod);
        addFieldIfNotEmpty(details, "order_number", fieldData['Order Number'],
            args.details.orderNumber);
        break;

      case 'quote':
        addFieldIfNotEmpty(details, "service_item_quoted",
            fieldData['Service/Item Quoted'], args.details.serviceItemQuoted);
        addFieldIfNotEmpty(details, "quote_amount", fieldData['Quote Amount'],
            args.details.quoteAmount?.toString());
        addFieldIfNotEmpty(details, "quote_date", fieldData['Quote Date'],
            args.details.quoteDate);
        addFieldIfNotEmpty(details, "vendor_company_name",
            fieldData['Vendor/Company Name'], args.details.vendorCompanyName);
        addFieldIfNotEmpty(details, "valid_until_date",
            fieldData['Valid Until Date'], args.details.validUntilDate);
        addFieldIfNotEmpty(details, "contact_info", fieldData['Contact Info'],
            args.details.contactInfo);
        addFieldIfNotEmpty(
            details,
            "quote_reference_number",
            fieldData['Quote Reference Number'],
            args.details.quoteReferenceNumber);
        break;

      case 'manual':
        addFieldIfNotEmpty(
            details, "title", fieldData['Title'], args.details.title);
        addFieldIfNotEmpty(details, "brand", fieldData['Brand/Company'],
            args.details.brandCompany);
        addFieldIfNotEmpty(
            details, "item_id", fieldData['Item ID'], args.details.itemId);
        addFieldIfNotEmpty(details, "model_number", fieldData['Model Number'],
            args.details.modelNumber);
        addFieldIfNotEmpty(details, "manual_type", fieldData['Manual Type'],
            args.details.manualType);
        addFieldIfNotEmpty(details, "publication_date",
            fieldData['Publication Date'], args.details.publicationDate);
        break;

      case 'other':
      default:
        addFieldIfNotEmpty(
            details, "title", fieldData['Title'], args.details.otherTitle);
        addFieldIfNotEmpty(details, "brand", fieldData['Brand / Company'],
            args.details.otherBrandCompany);
        addFieldIfNotEmpty(details, "url", fieldData['URL'], args.details.url);
        addFieldIfNotEmpty(
            details, "note", fieldData['Notes'], args.details.notes);
        break;
    }

    debugPrint('FINAL JSON TO SEND ====> $data');

    await controller.updateDocument(data, args.id);
  }
}
