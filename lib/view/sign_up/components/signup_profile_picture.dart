import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_project_getx/controllers/signup_controller.dart';

class SignUpProfilePicture extends StatelessWidget {
  SignUpProfilePicture({
    Key? key,
  }) : super(key: key);

  final SignUpController _signUpController = Get.find();

  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Obx(
          () => ClipRRect(
            child: CircleAvatar(
              backgroundImage:
                  _signUpController.isProfilePicPathSet.value == true
                      ? FileImage(File(_signUpController.profilePicPath.value))
                          as ImageProvider
                      : const AssetImage("assets/images/img.png"),
              // child: const FlutterLogo(size: 100),
              backgroundColor: Colors.purple.withOpacity(0.6),
              radius: 80,
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          right: 20,
          child: InkWell(
            onTap: () {
              // debugPrint('Camera Clicked');
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return buildBottomSheet(context);
                  });
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
              child: Container(
                height: 32,
                width: 32,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Obx(
                  () => Icon(
                    _signUpController.isProfilePicPathSet.value
                        ? Icons.edit
                        : Icons.add_a_photo,
                    size: 28,
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const Text(
            "Choose Profile Photo",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(height: 2),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  takePhoto(ImageSource.gallery);
                },
                child: Column(
                  children: const [
                    Icon(Icons.image),
                    SizedBox(height: 5),
                    Text(
                      'Gallery',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  takePhoto(ImageSource.camera);
                },
                child: Column(
                  children: const [
                    Icon(Icons.camera_alt),
                    SizedBox(height: 5),
                    Text(
                      'Camera',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);

    pickedFile = File(pickedImage!.path);
    _signUpController.setProfileImagePath(pickedFile!.path);
    Get.back();
    // debugPrint(pickedFile.toString());
  }
}
