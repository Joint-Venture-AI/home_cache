import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/controller/room_controller.dart';
import 'package:home_cache/model/user_room_item.dart';
import 'package:home_cache/view/auth/signup/widgets/custom_elevated_button.dart';
import 'package:home_cache/view/home/account/productsupport/widgets/text_field_widget.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';

class UpdateRoomItemScreen extends StatefulWidget {
  const UpdateRoomItemScreen({super.key});

  @override
  State<UpdateRoomItemScreen> createState() => _UpdateRoomItemScreenState();
}

class _UpdateRoomItemScreenState extends State<UpdateRoomItemScreen> {
  final TextEditingController brandController = TextEditingController();
  final TextEditingController brandLineController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController finishController = TextEditingController();
  final TextEditingController roomTEController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController lastPaintController = TextEditingController();

  final RoomController roomController = Get.put(RoomController());
  late String itemId;

  @override
  void initState() {
    super.initState();

    final UserRoomItem args = Get.arguments;

    // Prefill fields
    brandController.text = args.details.brand;
    brandLineController.text = args.details.brandLine;
    typeController.text = args.details.type;
    colorController.text = args.details.color;
    finishController.text = args.details.finish;
    locationController.text = args.details.location;
    lastPaintController.text = args.details.lastPainted;

    itemId = args.id;

    // Debugging
    print("Editing Item ID: $itemId");
  }

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: source, imageQuality: 80);

    if (picked != null) {
      roomController.selectedFile.value = File(picked.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBarBack(title: "Update Item"),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------------- IMAGE PICKER ----------------
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                      SafeArea(
                        child: Container(
                          color: Colors.white,
                          child: Wrap(
                            children: [
                              ListTile(
                                leading: Icon(Icons.photo_library),
                                title: Text("Gallery"),
                                onTap: () {
                                  pickImage(ImageSource.gallery);
                                  Get.back();
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.camera_alt),
                                title: Text("Camera"),
                                onTap: () {
                                  pickImage(ImageSource.camera);
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Obx(
                    () => roomController.selectedFile.value == null
                        ? Container(
                            height: 120.h,
                            width: 120.w,
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(35),
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/camera.png',
                                  height: 32.h,
                                  width: 32.w,
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  'Pick Image',
                                  style: AppTypoGraphy.regular.copyWith(
                                    fontSize: 12.sp,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Image.file(
                              roomController.selectedFile.value!,
                              height: 120.h,
                              width: 120.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // ---------------- INPUT FIELDS ----------------
              buildField("Brand", brandController),
              buildField("Brand Line", brandLineController),
              buildField("Type", typeController),
              buildField("Color", colorController),
              buildField("Finish", finishController),
              buildField("Location", locationController),
              buildField("Last Painted", lastPaintController),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: CustomElevatedButton(
            btnText: "Update",
            height: 48.h,
            onTap: () async {
              Map<String, dynamic> payload = {
                "type": typeController.text,
                "location": locationController.text,
                "brand": brandController.text,
                "brand_line": brandLineController.text,
                "color": colorController.text,
                "finish": finishController.text,
                "last_painted": lastPaintController.text,
              };

              print("Updating item: $payload");

              final success =
                  await roomController.updateUserRoomItem(payload, itemId);

              if (success) {
                Get.back(result: true);
              }
            },
          ),
        ),
      ),
    );
  }

  // ---------------- FIELD WIDGET ----------------
  Widget buildField(String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: AppTypoGraphy.semiBold.copyWith(color: AppColors.black)),
        SizedBox(height: 6.h),
        TextFieldWidget(controller: controller, hintText: "Enter $title"),
        SizedBox(height: 16.h),
      ],
    );
  }
}
