// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/pages/setup_account_profile.dart/widgets/setup_account_profile_dropdown.dart';
import 'package:moviegetx/apps/widgets/text_field_form_custom.dart';
import 'package:moviegetx/managers/controllers/setup_account_controller.dart';

class SetupAccountProfileForm extends StatelessWidget {
  SetupAccountProfileForm({
    super.key,
    this.controller,
  });

  SetupAccountController? controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller!.state.keyForm,
      child: Column(
        children: [
          TextFormFieldCustom(
            controller: controller!.state.fullNameController,
            hinText: 'Full Name',
            inputType: InputType.name,
          ),
          getHeight(context, 0.02),
          TextFormFieldCustom(
            controller: controller!.state.nickNameController,
            hinText: 'Nick Name',
            inputType: InputType.name,
          ),
          getHeight(context, 0.02),
          TextFormFieldCustom(
            controller: controller!.state.emailController,
            hinText: 'Email',
            inputType: InputType.readonly,
            suffixIcon: Icons.email_outlined,
          ),
          getHeight(context, 0.02),
          TextFormFieldCustom(
            controller: controller!.state.phoneController,
            hinText: 'Phone Number',
            inputType: InputType.phone,
            prefixIcon: Icons.phone_iphone_rounded,
          ),
          getHeight(context, 0.02),
          DropdownCustom(
            controller: controller,
          ),
          getHeight(context, 0.02),
        ],
      ),
    );
  }
}
