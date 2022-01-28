import 'package:flutter/material.dart';

class UserPassTextField extends StatelessWidget {
  const UserPassTextField({
    Key? key,
    required this.userPassController,
    required this.userPassErrorText,
    required this.userPass,
    required this.userPassHintTextClr,
    required this.userPassTextFieldPrefixIcon,
    required this.onUserPassValueChanged,
    required this.suffixIcon,
  }) : super(key: key);

  final TextEditingController userPassController;
  final String userPassErrorText;
  final String userPass;
  final Color userPassHintTextClr;
  final IconData userPassTextFieldPrefixIcon;
  final Function onUserPassValueChanged;
  final IconData suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: userPassController,
      validator: (value) {
        if (value!.isEmpty) {
          return userPassErrorText;
        }
        return null;
      },
      onChanged: (value) {
        onUserPassValueChanged(value);
      },
      obscureText: true,
      decoration: InputDecoration(
        hintText: userPass,
        hintStyle: TextStyle(
          color: userPassHintTextClr,
        ),
        border: InputBorder.none,
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(suffixIcon),
          color: userPassHintTextClr,
        ),
        prefixIcon: Icon(
          userPassTextFieldPrefixIcon,
          color: userPassHintTextClr,
        ),
      ),
    );
  }
}
