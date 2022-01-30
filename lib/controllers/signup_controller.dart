import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project_getx/model/custom_web_services.dart';
import 'package:my_project_getx/view/login/login_page.dart';

class SignUpController extends GetxController {
  var isProfilePicPathSet = false.obs;

  var profilePicPath = "".obs;
  var profileImageBase64;

  var isLoading = false.obs;

  String userName = "";
  String userEmail = "";
  String userMobile = "";
  String userPass = "";
  String userGender = "";

  void setProfileImagePath(String path) {
    profilePicPath.value = path;
    isProfilePicPathSet.value = true;

    final bytes = File(profilePicPath.value).readAsBytesSync();
    // profileImageBase64 = base64UrlEncode(bytes);
    profileImageBase64 = base64.encode(bytes);
  }

  void signUpUser(
    String name,
    String email,
    String mobile,
    String pass,
    String confPass,
    String gender,
  ) {
    if (!isProfilePicPathSet.value) {
      Get.snackbar(
        "Sign Up Failed",
        "Please select an image",
        backgroundColor: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        borderWidth: 2,
      );
    } else if (pass != confPass) {
      Get.snackbar(
        "Sign Up Failed",
        "Password didn't matched",
        backgroundColor: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        borderWidth: 2,
      );
    } else if (!isEmailValid(email)) {
      Get.snackbar(
        "Sign Up Failed",
        "Email is not valid",
        backgroundColor: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        borderWidth: 2,
      );
    } else {
      userName = name;
      userEmail = email;
      userMobile = mobile;
      userPass = pass;
      userGender = gender;
      sendUserDataToServer();
    }
  }

  bool isEmailValid(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  Future<void> sendUserDataToServer() async {
    isLoading.value = true;

    Map<String, dynamic> databody = {
      CustomWebServices.PROFILE_IMAGE = profileImageBase64,
      CustomWebServices.USER_NAME = userName,
      CustomWebServices.USER_EMAIL = userEmail,
      CustomWebServices.USER_NUMBER = userMobile,
      CustomWebServices.USER_PASS = userPass,
      CustomWebServices.USER_GENDR = userGender,
    } as Map<String, dynamic>;
    var dataToSend = json.encode(databody);

    var response = await http.post(
      Uri.parse(CustomWebServices.signUpApiUrl),
      body: dataToSend,
    );
    if (response.statusCode == 200) {
      isLoading.value = false;
      Map<String, dynamic> responseData = json.decode(response.body);

      if (responseData['r_msg'] == "success") {
        //redirect to login page
        Get.to(() => const LoginPage());
      } else if (responseData['r_msg'] == "failsed") {
        Get.snackbar(
          "Sign Up Failed",
          "Server error occured!",
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 10,
          borderWidth: 2,
        );
      } else if (responseData['r_msg'] == "mobilre number already exists") {
        Get.snackbar(
          "Sign Up Failed",
          "This mobile number is already registered!",
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 10,
          borderWidth: 2,
        );
      }
    } else {
      isLoading.value = false;
      Get.snackbar(
        "Sign Up Failed",
        "Server error occured!",
        backgroundColor: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        borderWidth: 2,
      );
    }
  }
}
