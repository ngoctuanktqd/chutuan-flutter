// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/managers/controllers/setup_account_controller.dart';

class DropdownCustom extends StatelessWidget {
  DropdownCustom({
    super.key,
    this.controller,
  });

  SetupAccountController? controller;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Obx(
        () {
          return DropdownButton2(
            value: controller != null ? controller!.state.gender.value : 0,
            onChanged: controller!.setGender,
            isExpanded: true,
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: MovieColor.dark_3,
                ),
                color: MovieColor.dark_2,
              ),
              elevation: 2,
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down_rounded,
              ),
              iconSize: 32,
              iconEnabledColor: MovieColor.grey_500,
              iconDisabledColor: MovieColor.dark_3,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 300,
              // width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: MovieColor.dark_2,
                border: Border.all(
                  color: MovieColor.dark_3,
                ),
              ),
              offset: const Offset(0, -5),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all<double>(6),
                thumbVisibility: MaterialStateProperty.all<bool>(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
            items: const <DropdownMenuItem>[
              DropdownMenuItem(
                value: 0,
                child: Text('Gender'),
              ),
              DropdownMenuItem(
                value: 1,
                child: Text('Male'),
              ),
              DropdownMenuItem(
                value: 2,
                child: Text('Female'),
              ),
            ],
          );
        },
      ),
    );
  }
}
