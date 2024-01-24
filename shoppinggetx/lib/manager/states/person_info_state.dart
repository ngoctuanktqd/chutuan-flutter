import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonInfoState {
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  late TextEditingController emailController;
  late GlobalKey<FormState> formKey;
  late RxString avatarPath;
}
