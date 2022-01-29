import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project_getx/controllers/gender_controller.dart';

class GenderSelection extends StatelessWidget {
  const GenderSelection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GenderSelectionController genderSelectionController =
        Get.put(GenderSelectionController());
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Expanded(
            child: Text(
              'Gender',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
          ),
          Row(
            children: [
              Obx(
                () => Radio(
                  value: "Male",
                  groupValue: genderSelectionController.selectedGender.value,
                  onChanged: (value) {
                    genderSelectionController.onChangeGender(value as String);
                    debugPrint('Male Clicked');
                  },
                  activeColor: Colors.purple,
                  fillColor: MaterialStateProperty.all(Colors.purple),
                ),
              ),
              const Text(
                'Male',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
          //
          Row(
            children: [
              Obx(
                () => Radio(
                  value: "Female",
                  groupValue: genderSelectionController.selectedGender.value,
                  onChanged: (value) {
                    genderSelectionController.onChangeGender(value as String);
                    debugPrint('Female Clicked');
                  },
                  activeColor: Colors.purple,
                  fillColor: MaterialStateProperty.all(Colors.purple),
                ),
              ),
              const Text(
                'Female',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
