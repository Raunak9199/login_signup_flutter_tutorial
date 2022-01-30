import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project_getx/view/welcome_page/my_home_page.dart';
import 'package:my_project_getx/widgets/my_theme.dart';

import 'controllers/gender_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  GenderSelectionController genderSelectionController =
      Get.put(GenderSelectionController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      home: const MyHomePage(),
    );
  }
}
