import 'package:flutter/material.dart';

import 'package:my_project_getx/widgets/my_theme.dart';

class TextFieldDecorator extends StatelessWidget {
  const TextFieldDecorator({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: MyTheme.loginPageBoxClr,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
