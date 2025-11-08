import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:home_cache/constants/colors.dart';
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/view/auth/signup/widgets/custom_elevated_button.dart';
import 'package:home_cache/view/home/details/providers/provider_screen.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/text_field_widget.dart';
import 'package:home_cache/view/home/details/widgets/tile_button.dart';

/// Controller for AddProviderScreen
class AddProviderController extends GetxController {
  var selectedType = ''.obs;
  var companyName = ''.obs;
  var fullName = ''.obs;
  var phoneNumber = ''.obs;
  var url = ''.obs;
  var rating = 3.obs;

  /// Validate required fields
  bool validateFields() {
    return selectedType.isNotEmpty &&
        companyName.isNotEmpty &&
        fullName.isNotEmpty &&
        phoneNumber.isNotEmpty;
  }

  /// Send data to API
  Future<void> submitProvider() async {
    if (!validateFields()) {
      Get.snackbar(
        'Error',
        'Please fill all required fields',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      // Simulate API call / loading
      await Future.delayed(const Duration(seconds: 1));

      // Create a new provider model
      final newProvider = ProviderModel(
        name: companyName.value,
        lastUsed: 'Just Added',
        rating: rating.value,
        isFavorite: false,
      );

      // Add provider
      final providerController = Get.find<ProviderController>();
      // providerController.providers.add(newProvider);
      // providerController.filteredProviders.add(newProvider);

      providerController.providers.add(newProvider);
      providerController.filteredProviders();

      // ✅ Instead of showing snackbar here, return success result
      Get.back(result: true);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to add provider',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}

class AddProviderScreen extends StatefulWidget {
  const AddProviderScreen({super.key});

  @override
  State<AddProviderScreen> createState() => _AddProviderScreenState();
}

class _AddProviderScreenState extends State<AddProviderScreen> {
  final controller = Get.put(AddProviderController());

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

  late List<String> _providerSuggestions = providerTypes;

  bool _showProviderSuggestions = false;

  final TextEditingController _typeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _typeController.addListener(
      () {
        if (_typeController.text.isEmpty) {
          if (_showProviderSuggestions) {
            setState(() {
              _showProviderSuggestions = false;
            });
          }
        } else {
          setState(() {
            _providerSuggestions = providerTypes
                .where((element) => element.contains(_typeController.text))
                .toList();
          });
          if (!_showProviderSuggestions) {
            setState(() {
              _showProviderSuggestions = true;
            });
          }
        }
      },
    );
  }

  @override
  void dispose() {
    _typeController.dispose();
    super.dispose();
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
              // SizedBox(height: 16.h),
              ProviderTypeDropdown(),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: CustomElevatedButton(
            onTap: () {
              controller.submitProvider();
            },
            btnText: 'Confirm'),
      ),
    );
  }

  Widget _buildDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField('Type', controller.selectedType,
            controller: _typeController),
        if (_providerSuggestions.isNotEmpty && _showProviderSuggestions) ...[
          SizedBox(height: 8.h),
          Container(
            constraints: BoxConstraints(maxHeight: 200.h),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(.3),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _providerSuggestions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _providerSuggestions[index],
                    style:
                        AppTypoGraphy.regular.copyWith(color: AppColors.black),
                  ),
                  onTap: () {
                    _typeController.text = _providerSuggestions[index];
                    _showProviderSuggestions = false;
                  },
                );
              },
            ),
          ),
        ],
      ],
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
        TileButton(
          imagePath: 'assets/images/upload.png',
          title: 'Upload',
          onTap: () {},
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
  const ProviderTypeDropdown({super.key});

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
          value: selectedType,
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
          },
        ),
      ],
    );
  }
}
