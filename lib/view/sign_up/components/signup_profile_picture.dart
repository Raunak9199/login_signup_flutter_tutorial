import 'package:flutter/material.dart';

class SignUpProfilePicture extends StatelessWidget {
  const SignUpProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          // backgroundImage: AssetImage("assets/images/img.png"),
          child: const FlutterLogo(size: 100),
          backgroundColor: Colors.purple.withOpacity(0.6),
          radius: 80,
        ),
        Positioned(
          bottom: 5,
          right: 20,
          child: InkWell(
            onTap: () {
              debugPrint('Camera Clicked');
            },
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(3, 3),
                    blurRadius: 20,
                    spreadRadius: 2,
                    color: Colors.black38,
                  ),
                ],
              ),
              child: const Icon(
                Icons.add_a_photo,
                size: 28,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
