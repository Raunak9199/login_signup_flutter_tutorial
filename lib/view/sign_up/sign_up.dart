import 'package:flutter/material.dart';
import 'package:my_project_getx/view/login/components/textfield_decorator.dart';
import 'package:my_project_getx/view/login/components/userid_text_field.dart';
import 'package:my_project_getx/view/login/login_page.dart';
import 'package:my_project_getx/view/sign_up/components/sign_up_background.dart';
import 'package:my_project_getx/view/welcome_page/components/custom_button.dart';
import 'package:my_project_getx/widgets/my_theme.dart';

import 'components/gender_selection.dart';
import 'components/signup_profile_picture.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController mobileController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPassController = TextEditingController();

    return Scaffold(
      body: SignUpBackGround(
        child: SafeArea(
          child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            padding: const EdgeInsets.only(top: 50),
            // margin: const EdgeInsets.only(bottom: 10),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SignUpProfilePicture(),
                  const SizedBox(height: 20),
                  TextFieldDecorator(
                    child: UserIdTextField(
                      userIdController: nameController,
                      userIdErrorText: 'Name Can not be empty',
                      userId: 'Enter Name',
                      userIdHintTextClr: Colors.purple,
                      userIdTextFieldPrefixIcon: Icons.person,
                      onUserIdValueChanged: () {},
                    ),
                  ),
                  TextFieldDecorator(
                    child: UserIdTextField(
                      userIdController: emailController,
                      userIdErrorText: 'Email Can not be empty',
                      userId: 'Enter Email',
                      userIdHintTextClr: Colors.purple,
                      userIdTextFieldPrefixIcon: Icons.email_rounded,
                      onUserIdValueChanged: () {},
                    ),
                  ),
                  TextFieldDecorator(
                    child: UserIdTextField(
                      userIdController: mobileController,
                      userIdErrorText: 'Mobile number Can not be empty',
                      userId: 'Enter Mobile Number',
                      userIdHintTextClr: Colors.purple,
                      userIdTextFieldPrefixIcon: Icons.call,
                      onUserIdValueChanged: () {},
                    ),
                  ),
                  TextFieldDecorator(
                    child: UserIdTextField(
                      userIdController: passwordController,
                      userIdErrorText: 'Password Can not be empty',
                      userId: 'Enter Password',
                      userIdHintTextClr: Colors.purple,
                      userIdTextFieldPrefixIcon: Icons.lock,
                      onUserIdValueChanged: () {},
                    ),
                  ),
                  TextFieldDecorator(
                    child: UserIdTextField(
                      userIdController: confirmPassController,
                      userIdErrorText: 'This field is mandatory',
                      userId: 'Re - enter password',
                      userIdHintTextClr: Colors.purple,
                      userIdTextFieldPrefixIcon: Icons.lock,
                      onUserIdValueChanged: () {},
                    ),
                  ),
                  //
                  const TextFieldDecorator(
                    child: GenderSelection(),
                  ),
                  //
                  CustomButton(
                    textClr: Colors.white,
                    btnText: 'Sign Up',
                    btnClick: () {},
                    btnClr: MyTheme.loginBtnCLr,
                  ),
                  //
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account ? ',
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
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: const Text(
                          ' Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
