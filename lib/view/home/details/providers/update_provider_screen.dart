import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/controller/add_provider_controller.dart';
import 'package:home_cache/controller/provider_controller.dart';
import 'package:home_cache/view/auth/signup/widgets/custom_elevated_button.dart';
import 'package:home_cache/view/home/details/widgets/tile_button.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/home/account/productsupport/widgets/text_field_widget.dart';

class UpdateProviderScreen extends StatefulWidget {
  const UpdateProviderScreen({super.key});

  @override
  State<UpdateProviderScreen> createState() => _UpdateProviderScreenState();
}

class _UpdateProviderScreenState extends State<UpdateProviderScreen> {
  final ProviderController providerController = Get.find<ProviderController>();
  final AddProviderController addProviderController =
      Get.put(AddProviderController());

  late RxString selectedType;
  late RxString companyName;
  late RxString fullName;
  late RxString phoneNumber;
  late RxString url;
  late RxInt rating;

  final selectedFile = Rxn<File>();

  bool isFormInitialized = false;
  late String providerId;

  @override
  void initState() {
    super.initState();
    providerId = Get.arguments;
    print('--------------');
    print(Get.arguments);

    // Fetch provider details after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await providerController.fetchProviderDetails(providerId);
      final provider = providerController.selectedProvider.value;

      if (provider != null) {
        selectedType = (provider.type).obs;
        companyName = (provider.company).obs;
        fullName = (provider.name).obs;
        phoneNumber = (provider.mobile).obs;
        url = (provider.webUrl).obs;
        rating = ((double.tryParse(provider.rating) ?? 0).toInt()).obs;

        setState(() => isFormInitialized = true);
      }
    });
  }

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.any);
    if (result != null) selectedFile.value = File(result.files.single.path!);
  }

  void removeFile() => selectedFile.value = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBarBack(title: 'Update Provider'),
      body: Obx(() {
        if (providerController.isLoading.value || !isFormInitialized) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProviderTypeDropdown(
                initialType: selectedType.value,
                onChanged: (value) => selectedType.value = value ?? '',
              ),
              SizedBox(height: 16.h),
              _buildTextField('Company Name', companyName),
              SizedBox(height: 16.h),
              _buildTextField('Full Name', fullName),
              SizedBox(height: 16.h),
              _buildTextField('Phone Number', phoneNumber,
                  keyboardType: TextInputType.phone),
              SizedBox(height: 16.h),
              _buildTextField('URL', url, keyboardType: TextInputType.url),
              SizedBox(height: 32.h),
              _buildTileButtons(),
              SizedBox(height: 20.h),
              _buildRatingStars(),
              SizedBox(height: 20.h),
            ],
          ),
        );
      }),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Obx(() {
            return CustomElevatedButton(
              onTap: () {
                debugPrint("++Provider id===========> $providerId");
                addProviderController.selectedType.value = selectedType.value;
                addProviderController.companyName.value = companyName.value;
                addProviderController.fullName.value = fullName.value;
                addProviderController.phoneNumber.value = phoneNumber.value;
                addProviderController.url.value = url.value;
                addProviderController.rating.value = rating.value;
                addProviderController.selectedFile.value = selectedFile.value;

                // Call update method
                addProviderController.submitUpdateProvider(providerId);
              },
              btnText: addProviderController.isLoading.value
                  ? 'Updating...'
                  : 'Update',
            );
          }),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, RxString rxVar,
      {TextInputType keyboardType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: AppTypoGraphy.semiBold.copyWith(color: AppColors.black)),
        SizedBox(height: 6.h),
        TextFieldWidget(
          hintText: 'Enter $label',
          keyboardType: keyboardType,
          onChanged: (value) => rxVar.value = value,
          controller: TextEditingController(text: rxVar.value),
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
        Obx(() => TileButton(
              imagePath: selectedFile.value == null
                  ? 'assets/images/upload.png'
                  : 'assets/logos/pdf_image1.png',
              title: selectedFile.value == null
                  ? 'Upload'
                  : selectedFile.value!.path.split('/').last,
              onTap: pickFile,
              showRemoveButton: selectedFile.value != null,
              onRemoveTap: removeFile,
            )),
      ],
    );
  }

  Widget _buildRatingStars() {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) => GestureDetector(
              onTap: () => rating.value = index + 1,
              child: Icon(
                index < rating.value ? Icons.star : Icons.star_border,
                color: AppColors.primaryLight,
                size: 30.sp,
              ),
            ),
          ),
        ));
  }
}

class ProviderTypeDropdown extends StatefulWidget {
  const ProviderTypeDropdown({super.key, this.onChanged, this.initialType});

  final Function(String?)? onChanged;
  final String? initialType;

  @override
  State<ProviderTypeDropdown> createState() => _ProviderTypeDropdownState();
}

class _ProviderTypeDropdownState extends State<ProviderTypeDropdown> {
  late List<String> providerTypes;
  String? selectedType;

  @override
  void initState() {
    super.initState();

    providerTypes = [
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
      'Other'
    ];

    selectedType = widget.initialType;

    if (selectedType != null && !providerTypes.contains(selectedType)) {
      providerTypes.insert(0, selectedType!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Type',
            style: AppTypoGraphy.semiBold.copyWith(color: AppColors.black)),
        SizedBox(height: 8.h),
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
          value: selectedType,
          items: providerTypes
              .map((type) => DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() => selectedType = value);
            if (widget.onChanged != null) widget.onChanged!(value);
          },
        ),
      ],
    );
  }
}
