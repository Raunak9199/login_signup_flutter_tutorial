import 'package:flutter/material.dart';
import 'package:my_project_getx/view/login/login_page.dart';
import 'package:my_project_getx/view/sign_up/sign_up.dart';

import 'package:my_project_getx/view/welcome_page/components/background.dart';
import 'package:my_project_getx/view/welcome_page/components/custom_button.dart';
import 'package:my_project_getx/widgets/my_theme.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: BackGround(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const Text(
                  'Welcome to My App',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Image.asset(
                  'assets/images/undraw_Balloons.png',
                  width: size.width * 0.7,
                ),
                CustomButton(
                  btnClick: () => loginBtnHandler(context),
                  btnClr: MyTheme.loginBtnCLr,
                  btnText: 'LOGIN',
                  textClr: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  btnClick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ),
                    );
                  },
                  btnClr: MyTheme.signUpBtnClr,
                  btnText: 'SIGN UP',
                  textClr: Theme.of(context).colorScheme.secondary,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  loginBtnHandler(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginPage()));
    // );
    debugPrint('login clicked');
  }
}
