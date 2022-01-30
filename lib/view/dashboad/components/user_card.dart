import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:my_project_getx/model/user_model_list.dart';

class UserDetailCard extends StatelessWidget {
  final String name;
  final String email;
  final String mobile;
  final String gender;
  final String profilePic;
  const UserDetailCard({
    Key? key,
    required this.name,
    required this.email,
    required this.mobile,
    required this.gender,
    required this.profilePic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Hello"),
        CircleAvatar(
          backgroundImage: MemoryImage(base64Decode(profilePic)),
        ),
      ],
    );
  }
}
