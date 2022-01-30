import 'package:flutter/material.dart';
import 'package:my_project_getx/view/login/components/login_background.dart';
import 'package:my_project_getx/view/login/components/user_pass_text_fileld.dart';
import 'package:my_project_getx/view/sign_up/sign_up.dart';
import 'package:my_project_getx/view/welcome_page/components/custom_button.dart';
import 'package:my_project_getx/widgets/my_theme.dart';

import 'components/textfield_decorator.dart';
import 'components/userid_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController userIdController = TextEditingController();
    TextEditingController passController = TextEditingController();
    String userIdErrorText = 'User ID cannot be empty';
    String userId = 'Enter User Id';
    Color userIdHintTextClr = Colors.purple;
    IconData userIdTextFieldPrefixIcon = Icons.person;
    IconData suffixIcon = Icons.visibility_off;
    // Color userIdTextFieldPrefixIconClr = Colors.purple;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: LoginBackGround(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/Login.png'),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldDecorator(
                        child: UserIdTextField(
                          userIdController: userIdController,
                          userIdErrorText: userIdErrorText,
                          userId: userId,
                          userIdHintTextClr: userIdHintTextClr,
                          userIdTextFieldPrefixIcon: userIdTextFieldPrefixIcon,
                          onUserIdValueChanged: (value) {
                            debugPrint(value);
                          },
                        ),
                      ),
                      TextFieldDecorator(
                        child: UserPassTextField(
                            userPassController: passController,
                            userPassErrorText: 'Password can not be empty',
                            userPass: 'Enter Password',
                            userPassHintTextClr: Colors.purple,
                            userPassTextFieldPrefixIcon: Icons.lock,
                            onUserPassValueChanged: (value) {
                              debugPrint('pass vlalue $value');
                            },
                            suffixIcon: suffixIcon),
                      ),
                      CustomButton(
                        textClr: Colors.white,
                        btnText: 'LOGIN',
                        btnClick: () {},
                        btnClr: MyTheme.loginBtnCLr,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have account ? ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ),
                        );
                      },
                      child: const Text(
                        ' Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
