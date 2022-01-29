import 'package:get/get.dart';

class GenderSelectionController extends GetxController {
  var selectedGender = "".obs;

  onChangeGender(String gender) {
    selectedGender.value = gender;
  }
}
