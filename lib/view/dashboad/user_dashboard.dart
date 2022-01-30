import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project_getx/controllers/login_controller.dart';
import 'package:my_project_getx/model/user_model_list.dart';
import 'package:my_project_getx/view/dashboad/components/dashboard_background.dart';

import 'components/user_card.dart';

class UserDashBoard extends StatelessWidget {
  LoginController loginController = Get.find();

  UserDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashBoardBackGround(
        child: Obx(
          () => loginController.isDataReadingCompleted.value
              ? UserDetailCard(
                  name: UserDataList.name,
                  email: UserDataList.email,
                  mobile: UserDataList.mobile,
                  gender: UserDataList.gender,
                  profilePic: UserDataList.profile,
                )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
