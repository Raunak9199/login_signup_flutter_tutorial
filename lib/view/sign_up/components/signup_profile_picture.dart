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
        const CircleAvatar(
          backgroundImage: AssetImage("assets/images/img.png"),
          // backgroundColor: Colors.,
          radius: 80,
        ),
        Positioned(
          bottom: 0,
          child: InkWell(
            onTap: () {
              print('Camera Clicked');
            },
            child: const Icon(
              Icons.add_a_photo,
              size: 28,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
