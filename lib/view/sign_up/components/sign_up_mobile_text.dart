import 'package:flutter/material.dart';

class UserMobileTextField extends StatelessWidget {
  const UserMobileTextField({
    Key? key,
    required this.userIdController,
    required this.userIdErrorText,
    required this.userId,
    required this.userIdHintTextClr,
    required this.userIdTextFieldPrefixIcon,
    required this.onUserIdValueChanged,
    // this.suffixIcon,
  }) : super(key: key);

  final TextEditingController userIdController;
  final String userIdErrorText;
  final String userId;
  final Color userIdHintTextClr;
  final IconData userIdTextFieldPrefixIcon;
  final Function(String)? onUserIdValueChanged;
  // final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 10,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      controller: userIdController,
      validator: (value) {
        if (value!.isEmpty) {
          return userIdErrorText;
        }
        return null;
      },
      onChanged: (value) {
        onUserIdValueChanged!(value);
      },
      decoration: InputDecoration(
        hintText: userId,
        hintStyle: TextStyle(
          color: userIdHintTextClr,
        ),
        counterText: "",
        border: InputBorder.none,
        prefixIcon: Icon(
          userIdTextFieldPrefixIcon,
          color: userIdHintTextClr,
        ),
      ),
    );
  }
}
