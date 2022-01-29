import 'package:get/get.dart';

// import 'package:get/get_state_manager/get_state_manager.dart';

class GenderSelectionController extends GetxController {
  var selectedGender = "".obs;

  onChangeGender(String gender) {
    selectedGender.value = gender;
  }
}
