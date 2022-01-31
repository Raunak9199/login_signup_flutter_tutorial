import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project_getx/controllers/login_controller.dart';
import 'package:my_project_getx/model/login_singleton.dart';
import 'package:my_project_getx/model/user_model_list.dart';
import 'package:my_project_getx/view/dashboad/components/dashboard_background.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/user_card.dart';

//convert to stateful widget to use sharedPreferences...

class UserDashBoard extends StatefulWidget {
  const UserDashBoard({Key? key}) : super(key: key);

  @override
  State<UserDashBoard> createState() => _UserDashBoardState();
}

class _UserDashBoardState extends State<UserDashBoard> {
  LoginController loginController = Get.find();

  //For Shared Preferences
  String name = "";
  String email = "";
  String mobile = "";
  String gender = "";
  String profilepic = "";
  bool isDataLoadingCompleted = false;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashBoardBackGround(
        //1. Using Models

        // child: Obx(
        //   () => loginController.isDataReadingCompleted.value
        //       ? UserDetailCard(
        //           name: UserDataList.name,
        //           email: UserDataList.email,
        //           mobile: UserDataList.mobile,
        //           gender: UserDataList.gender,
        //           profilePic: UserDataList.profile,
        //         )
        //       : const CircularProgressIndicator(),
        // ),

        //2. Using singleton class

        // child: UserDetailCard(
        //   name: LoginSingleTon.getUserName(),
        //   email: LoginSingleTon.getUserEmail(),
        //   mobile: LoginSingleTon.getUserMobile(),
        //   gender: LoginSingleTon.getUserGender(),
        //   profilePic: LoginSingleTon.getUserProfilePic(),
        // ),

        //3. Using SharedPreferences

        child: isDataLoadingCompleted
            ? Text(name)
            : const CircularProgressIndicator(),
      ),
    );
  }

  void loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var mapData = json.decode(preferences.getString("userData")!);
    setState(() {
      isDataLoadingCompleted = true;
      name = mapData["userName"];
      email = mapData["userEmail"];
      mobile = mapData["userMobile"];
      gender = mapData["userGender"];
      profilepic = mapData["userProfile"];
    });
  }
}
