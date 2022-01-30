import 'package:flutter/material.dart';

class DashBoardBackGround extends StatelessWidget {
  final Widget child;
  const DashBoardBackGround({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        // alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/main_top.png',
              width: size.width * 0.4,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/bottom.png',
              width: size.width * 0.4,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
