import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.textClr,
    required this.btnText,
    required this.btnClick,
    required this.btnClr,
  }) : super(key: key);

  final Color btnClr, textClr;
  final String btnText;
  final Function() btnClick;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: ElevatedButton(
        onPressed: btnClick,
        child: Text(
          btnText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: textClr,
            letterSpacing: 1.5,
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(btnClr),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 10,
            ),
          ),
        ),
      ),
    );
  }
}
