import 'package:get/get.dart';

class SignUpController extends GetxController {
  var isProfilePicPathSet = false.obs;

  var profilePicPath = "".obs;

  void setProfileImagePath(String path) {
    profilePicPath.value = path;
    isProfilePicPathSet.value = true;
  }
}
