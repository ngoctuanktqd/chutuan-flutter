import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoppinggetx/manager/controllers/person_info_controller.dart';
import 'package:shoppinggetx/stores/app_store.dart';

class PersonInfoAvatar extends StatefulWidget {
  const PersonInfoAvatar({
    super.key,
    required this.controller,
  });

  final PersonInfoController controller;

  @override
  State<PersonInfoAvatar> createState() => _PersonInfoAvatarState();
}

class _PersonInfoAvatarState extends State<PersonInfoAvatar> {
  File? _imageFile;
  String path = '';
  final pickedFile = null;
  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);

      if (pickedFile != null) {
        widget.controller.state.avatarPath.value = pickedFile.path;

        // setState(() {
        //   _imageFile = File(pickedFile.path);
        //   path = pickedFile.path;
        // });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_imageFile);
    print(path);
    return ClipOval(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // _imageFile == null
          widget.controller.state.avatarPath.value == AppStore.to.userInfoAvatar
              ? SizedBox(
                  width: 120,
                  height: 120,
                  child: Image.network(
                    widget.controller.state.avatarPath.value != ''
                        ? widget.controller.state.avatarPath.value
                        : 'https://firebasestorage.googleapis.com/v0/b/shopping-18978.appspot.com/o/images%2Fava.jpeg?alt=media&token=8a3a769d-d817-43d5-9ee9-7bc476ba0470',
                    fit: BoxFit.fill,
                  ),
                )
              : Image.file(
                  File(widget.controller.state.avatarPath.value),
                  height: 120,
                  width: 120,
                  fit: BoxFit.fill,
                ),
          Material(
            child: InkWell(
              onTap: () => _pickImage(ImageSource.gallery),
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
