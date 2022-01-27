import 'package:flutter/material.dart';
import 'package:my_project_getx/view/login/components/login_background.dart';
import 'package:my_project_getx/widgets/my_theme.dart';

import 'components/textField_decorator.dart';
import 'components/userId_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController userIdController = TextEditingController();
    TextEditingController passController = TextEditingController();
    String userIdErrorText = 'User ID cannot be empty';
    String userId = 'Enter User Id';
    Color userIdHintTextClr = Colors.purple;
    IconData userIdTextFieldPrefixIcon = Icons.person;
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
                            print(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
