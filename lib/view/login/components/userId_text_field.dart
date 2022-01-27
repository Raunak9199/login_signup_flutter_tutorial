import 'package:flutter/material.dart';

class UserIdTextField extends StatelessWidget {
  const UserIdTextField({
    Key? key,
    required this.userIdController,
    required this.userIdErrorText,
    required this.userId,
    required this.userIdHintTextClr,
    required this.userIdTextFieldPrefixIcon,
    required this.onUserIdValueChanged,
  }) : super(key: key);

  final TextEditingController userIdController;
  final String userIdErrorText;
  final String userId;
  final Color userIdHintTextClr;
  final IconData userIdTextFieldPrefixIcon;
  final Function onUserIdValueChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: userIdController,
      validator: (value) {
        if (value!.isEmpty) {
          return userIdErrorText;
        }
        return null;
      },
      onChanged: (value) {
        onUserIdValueChanged(value);
      },
      decoration: InputDecoration(
        hintText: userId,
        hintStyle: TextStyle(
          color: userIdHintTextClr,
        ),
        border: InputBorder.none,
        prefixIcon: Icon(
          userIdTextFieldPrefixIcon,
          color: userIdHintTextClr,
        ),
      ),
    );
  }
}