import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/apps/consts/consts.dart';
import 'package:shoppinggetx/apps/consts/helpers.dart';
import 'package:shoppinggetx/apps/widgets/button_custom.dart';
import 'package:shoppinggetx/apps/widgets/text_field_custom.dart';
import 'package:shoppinggetx/manager/controllers/person_info_controller.dart';
import 'package:shoppinggetx/pages/user/widgets/person_info_avatar.dart';
import 'package:shoppinggetx/stores/app_store.dart';

class PersonInfoPage extends GetView<PersonInfoController> {
  const PersonInfoPage({super.key});
  @override
  Widget build(BuildContext context) {
    controller.state.userNameController.text = AppStore.to.userInfoUsername;
    controller.state.emailController.text = AppStore.to.userInfoEmail;
    controller.state.avatarPath.value = AppStore.to.userInfoAvatar;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person Info'),
      ),
      body: Form(
        key: controller.state.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              PersonInfoAvatar(controller: controller),
              getHeight(context, 0.02),
              TextFieldCustom(
                controller: controller.state.userNameController,
                hintText: 'Please enter your UserName',
                lableText: 'UserName',
                prefixIcon: Icons.person_2_rounded,
              ),
              getHeight(context, 0.02),
              TextFieldCustom(
                controller: controller.state.emailController,
                hintText: 'Please enter your Email',
                lableText: 'Email',
                prefixIcon: Icons.email_rounded,
                inputType: InputType.Email,
              ),
              getHeight(context, 0.02),
              ButtonCustom(
                title: 'UPDATE INFO',
                function: controller.updatePersonInfo,
              )
            ],
          ),
        ),
      ),
    );
  }
}
