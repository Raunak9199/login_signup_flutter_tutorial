import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:my_project_getx/model/custom_web_services.dart';
import 'package:my_project_getx/model/login_singleton.dart';
import 'package:my_project_getx/model/user_data_model.dart';
import 'package:my_project_getx/model/user_model_list.dart';
import 'package:my_project_getx/view/dashboad/user_dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isDataSubmitting = false.obs;
  var isDataReadingCompleted = false.obs;

  Future<void> loginWithDetail(String id, String pass) async {
    isDataSubmitting.value = true;

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
      isDataSubmitting.value = false;

      Map<String, dynamic> responseData = json.decode(response.body);
      if (responseData['rMsg'] == ['success']) {
        //1. MODELS
        // // 1st way using models
        // UserDataList.profile =
        //     UserDataModel.fromMap(responseData).rUserProfileImg;

        // UserDataList.name = UserDataModel.fromMap(responseData).rUserName;

        // UserDataList.email = UserDataModel.fromMap(responseData).rUserEmail;
        // UserDataList.mobile = UserDataModel.fromMap(responseData).rUserMobile;
        // UserDataList.gender = UserDataModel.fromMap(responseData).rUserGender;

        // //2nd way using models
        // UserDataList.profile = responseData['rUserProfileImg'];
        // UserDataList.name = responseData['rUserName'];
        // UserDataList.email = responseData['rUserEmail'];
        // UserDataList.mobile = responseData['rUserMobile'];
        // UserDataList.gender = responseData['rUserGender'];

        //2. SINGLETON CLASS

        // // Api data retrieving using sigleton class method
        // LoginSingleTon.setUserName(responseData['rUserName']);
        // LoginSingleTon.setUserEmail(responseData['rUserEmail']);
        // LoginSingleTon.setUserMobile(responseData['rUserMobile']);
        // LoginSingleTon.setuserGender(responseData['rUserGender']);
        // LoginSingleTon.setUserProfilePic(responseData['rUserProfileImg']);

        //3. SHARED PREFERENCES

        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();

        Map<String, String> data = {
          "userProfile": responseData['rUserProfileImg'],
          "userName": responseData['rUserName'],
          "userEmail": responseData['rUserEmail'],
          "userMobile": responseData['rUserMobile'],
          "userGender": responseData['rUserGender'],
        };

        sharedPreferences.setString("userData", json.encode(data));

        isDataReadingCompleted.value = true;

        Get.to(() => UserDashBoard());
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
      isDataSubmitting.value = false;
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
