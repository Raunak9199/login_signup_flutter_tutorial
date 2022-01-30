import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project_getx/controllers/gender_controller.dart';
import 'package:my_project_getx/controllers/signup_controller.dart';
import 'package:my_project_getx/view/login/components/textfield_decorator.dart';
import 'package:my_project_getx/view/login/components/userid_text_field.dart';
import 'package:my_project_getx/view/login/login_page.dart';
import 'package:my_project_getx/view/sign_up/components/sign_up_background.dart';
import 'package:my_project_getx/view/sign_up/components/sign_up_mobile_text.dart';
import 'package:my_project_getx/view/welcome_page/components/custom_button.dart';
import 'package:my_project_getx/widgets/my_theme.dart';

import 'components/gender_selection.dart';
import 'components/signup_profile_picture.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final _globalKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  GenderSelectionController genderSelectionController = Get.find();
  SignUpController signUpController = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    // final focusNode = FocusNode();

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
              child: Form(
                key: _globalKey,
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
                    SignUpProfilePicture(),
                    const SizedBox(height: 20),
                    TextFieldDecorator(
                      child: UserIdTextField(
                        userIdController: nameController,
                        userIdErrorText: 'Name Can not be empty',
                        userId: 'Enter Name',
                        userIdHintTextClr: Colors.purple,
                        userIdTextFieldPrefixIcon: Icons.person,
                        onUserIdValueChanged: (value) {},
                      ),
                    ),
                    TextFieldDecorator(
                      child: UserIdTextField(
                        userIdController: emailController,
                        userIdErrorText: 'Email Can not be empty',
                        userId: 'Enter Email',
                        userIdHintTextClr: Colors.purple,
                        userIdTextFieldPrefixIcon: Icons.email_rounded,
                        onUserIdValueChanged: (value) {},
                      ),
                    ),
                    TextFieldDecorator(
                      child: UserMobileTextField(
                        userIdController: mobileController,
                        userIdErrorText: 'Mobile number Can not be empty',
                        userId: 'Enter Mobile Number',
                        userIdHintTextClr: Colors.purple,
                        userIdTextFieldPrefixIcon: Icons.call,
                        onUserIdValueChanged: (value) {},
                      ),
                    ),
                    TextFieldDecorator(
                      child: UserIdTextField(
                        userIdController: passwordController,
                        userIdErrorText: 'Password Can not be empty',
                        userId: 'Enter Password',
                        userIdHintTextClr: Colors.purple,
                        userIdTextFieldPrefixIcon: Icons.lock,
                        onUserIdValueChanged: (value) {},
                      ),
                    ),
                    TextFieldDecorator(
                      child: UserIdTextField(
                        userIdController: confirmPassController,
                        userIdErrorText: 'This field is mandatory',
                        userId: 'Re-enter password',
                        userIdHintTextClr: Colors.purple,
                        userIdTextFieldPrefixIcon: Icons.lock,
                        onUserIdValueChanged: (value) {},
                      ),
                    ),
                    //
                    TextFieldDecorator(
                      child: GenderSelection(),
                    ),
                    //
                    signUpController.isLoading.value
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            textClr: Colors.white,
                            btnText: 'Sign Up',
                            btnClick: () {
                              signUp();
                            },
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
                                builder: (context) => LoginPage(),
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
      ),
    );
  }

  void signUp() {
    final _isValid = _globalKey.currentState!.validate();
    if (_isValid) {
      signUpController.signUpUser(
        nameController.text,
        emailController.text,
        mobileController.text,
        passwordController.text,
        confirmPassController.text,
        genderSelectionController.selectedGender.value,
      );
      // debugPrint(nameController.text);
      // debugPrint(emailController.text);
      // debugPrint(mobileController.text);
      // debugPrint(passwordController.text);
      // debugPrint(confirmPassController.text);
      // debugPrint(genderSelectionController.selectedGender.value);
    } else {
      return;
    }
  }
}
