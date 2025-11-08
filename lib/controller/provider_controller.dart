import 'package:get/get.dart';

class ProviderController extends GetxController {
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
}
