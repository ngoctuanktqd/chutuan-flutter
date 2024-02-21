import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppinggetx/manager/controllers/person_info_controller.dart';
import 'package:shoppinggetx/stores/app_store.dart';

class PersonInfoAvatar extends StatelessWidget {
  const PersonInfoAvatar({
    super.key,
    required this.controller,
  });

  final PersonInfoController controller;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Obx(() {
            return SizedBox(
              width: 120,
              height: 120,
              child: Image.network(
                controller.state.avatarPath.value == ''
                    ? 'https://firebasestorage.googleapis.com/v0/b/shopping-18978.appspot.com/o/images%2Fava.jpeg?alt=media&token=8a3a769d-d817-43d5-9ee9-7bc476ba0470'
                    : controller.state.avatarPath.value,
                fit: BoxFit.fill,
              ),
            );
          }),
          Material(
            child: InkWell(
              onTap: controller.uploadAvatar,
              child: Ink(
                width: 120.0,
                height: 24.0,
                color: Colors.grey,
                child: const Center(
                  child: Icon(
                    Icons.edit_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
