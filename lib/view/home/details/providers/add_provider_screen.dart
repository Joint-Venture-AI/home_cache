import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/controller/add_provider_controller.dart';
import 'package:home_cache/view/auth/signup/widgets/custom_elevated_button.dart';
import 'package:home_cache/view/home/account/productsupport/widgets/text_field_widget.dart';
import 'package:home_cache/view/home/details/widgets/tile_button.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';

class AddProviderScreen extends StatefulWidget {
  const AddProviderScreen({super.key});

  @override
  State<AddProviderScreen> createState() => _AddProviderScreenState();
}

class _AddProviderScreenState extends State<AddProviderScreen> {
  final controller = Get.put(AddProviderController());

  //! Pick a file
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any, // all files
    );

    if (result != null) {
      controller.selectedFile.value = File(result.files.single.path!);
      print("Picked file: ${controller.selectedFile.value!.path}");
    } else {
      print("No file selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBarBack(
        title: 'New Provider',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProviderTypeDropdown(
                onChanged: (value) {
                  setState(() {
                    controller.selectedType.value = value ?? "";
                  });
                },
              ),
              SizedBox(height: 16.h),
              _buildTextField('Company Name', controller.companyName),
              SizedBox(height: 16.h),
              _buildTextField('Full Name', controller.fullName),
              SizedBox(height: 16.h),
              _buildTextField('Phone Number', controller.phoneNumber,
                  keyboardType: TextInputType.phone),
              SizedBox(height: 16.h),
              _buildTextField('URL', controller.url,
                  keyboardType: TextInputType.url),
              SizedBox(height: 32.h),
              _buildTileButtons(),
              SizedBox(height: 20.h),
              _buildRatingStars(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: CustomElevatedButton(
              onTap: () {
                controller.submitProvider();
                Get.back();
                Navigator.pop(context);
              },
              btnText: 'Confirm'),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, RxString rxVar,
      {TextInputType keyboardType = TextInputType.text,
      TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: AppTypoGraphy.semiBold.copyWith(color: AppColors.black)),
        SizedBox(height: 6.h),
        TextFieldWidget(
          controller: controller,
          hintText: 'Enter $label',
          keyboardType: keyboardType,
          onChanged: (value) => rxVar.value = value,
        ),
      ],
    );
  }

  Widget _buildTileButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TileButton(
          imagePath: 'assets/images/link.png',
          title: 'Link Meeting',
          onTap: () {},
        ),
        Obx(
          () => TileButton(
            imagePath: controller.selectedFile.value == null
                ? 'assets/images/upload.png'
                : 'assets/logos/pdf_image1.png',
            title: controller.selectedFile.value == null
                ? 'Upload'
                : controller.selectedFile.value!.path.split('/').last,
            onTap: pickFile,
            showRemoveButton: controller.selectedFile.value != null,
            onRemoveTap: () => controller.removeFile(),
          ),
        ),
      ],
    );
  }

  Widget _buildRatingStars() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          5,
          (index) => GestureDetector(
            onTap: () => controller.rating.value = index + 1,
            child: Icon(
              index < controller.rating.value ? Icons.star : Icons.star_border,
              color: AppColors.primaryLight,
              size: 30.sp,
            ),
          ),
        ),
      ),
    );
  }
}

class ProviderTypeDropdown extends StatefulWidget {
  const ProviderTypeDropdown({super.key, this.onChanged});

  final Function(String?)? onChanged; //

  @override
  State<ProviderTypeDropdown> createState() => _ProviderTypeDropdownState();
}

class _ProviderTypeDropdownState extends State<ProviderTypeDropdown> {
  final List<String> providerTypes = [
    'Plumber',
    'Electrician',
    'HVAC Technician',
    'Roofer',
    'General Contractor',
    'Handyman',
    'Landscaper',
    'Pest Control Specialist',
    'Painter',
    'Carpenter',
    'Appliance Repair Technician',
    'Window and Door Installer/Repair',
    'Locksmith',
    'Pool Maintenance Provider',
    'Cleaning Service',
    'Gutter Specialist',
    'Chimney Sweep / Specialist',
    'Fence Installer / Repair',
    'Masonry Specialist',
    'Insulation Contractor',
    'Solar Panel Installer / Maintenance',
    'Siding Contractor',
    'Garage Door Repair / Installer',
    'Tree Service / Arborist',
    'Septic System Service',
    'Foundation Repair Specialist',
    'Home Inspector',
    'Interior Designer / Decorator',
    'Waste Removal / Dumpster Rental',
    'Snow Removal Service',
    'Window Cleaning Service',
    'Paving / Driveway Repair Contractor',
    'Energy Auditor',
    'Water Treatment Specialist',
    'Smart Home Technician',
    'Fireplace Repair Technician',
    'Oil Provider',
    'Trash / Recycling',
    'Other',
  ];

  String? selectedType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Text('Type',
            style: AppTypoGraphy.semiBold.copyWith(color: AppColors.black)),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.lightgrey,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          ),
          initialValue: selectedType,
          items: providerTypes
              .map((type) => DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedType = value;
            });

            if (widget.onChanged != null) {
              widget.onChanged!(value); // Pass value to parent / backend
            }
          },
        ),
      ],
    );
  }
}
