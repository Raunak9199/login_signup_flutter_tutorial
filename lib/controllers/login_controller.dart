import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:my_project_getx/model/custom_web_services.dart';

class LoginController extends GetxController {
  Future<void> loginWithDetail(String id, String pass) async {
    Map<String, dynamic> databody = {
      CustomWebServices.USER_NUMBER: id,
      CustomWebServices.USER_PASS: pass,
    };

    var dataTOSend = json.encode(databody);

    var response = await http.post(
      Uri.parse(CustomWebServices.loginApiUrl),
      body: dataTOSend,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData['rMsg'] == ['success']) {
        //
      } else {
        Get.snackbar(
          "Sign Up Failed",
          "Credentials didn't matched!",
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 10,
          borderWidth: 2,
        );
      }
    } else {
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
