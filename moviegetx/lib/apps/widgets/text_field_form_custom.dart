// ignore_for_file: must_be_immutable, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviegetx/apps/ultills/consts.dart';

class TextFormFieldCustom extends StatefulWidget {
  TextFormFieldCustom({
    super.key,
    this.controller,
    required this.hinText,
    this.prefixIcon,
    this.suffixIcon,
    required this.inputType,
    this.maxLength,
    this.minLength = 0,
  });

  TextEditingController? controller;
  String hinText;
  IconData? prefixIcon;
  IconData? suffixIcon;
  InputType inputType;
  int? maxLength;
  int minLength;

  @override
  State<TextFormFieldCustom> createState() => _TextFormFieldCustomState();
}

class _TextFormFieldCustomState extends State<TextFormFieldCustom> {
  bool obscureText = true;
  bool errorMinlength = false;
  List<TextInputFormatter> getFormatters() {
    List<TextInputFormatter> formatters = [];

    if (widget.inputType == InputType.phone) {
      // Add your custom formatter conditionally
      formatters.add(
        FilteringTextInputFormatter.digitsOnly,
      );
    }

    return formatters;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // Onchange

      // Max - min length
      maxLength: widget.maxLength,
      onChanged: (value) {
        if (widget.minLength > 0) {
          if (widget.controller!.text.length < widget.minLength) {
            setState(() {
              errorMinlength = true;
            });
          } else {
            setState(() {
              errorMinlength = false;
            });
          }
        }
      },
      // Read
      readOnly: widget.inputType == InputType.readonly ? true : false,
      // Kieu du lieu
      inputFormatters: getFormatters(),
      // Validate duữ liệu
      validator: (value) {
        if (widget.inputType == InputType.email) {
          if (value == '' || value!.isEmpty) {
            return 'Please type your Email';
          }
          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return 'Email not Valid';
          }
        }

        if (widget.inputType == InputType.password) {
          if (value == '' || value!.isEmpty) {
            return 'Please type your Password';
          }
        }
        if (widget.inputType == InputType.phone) {
          if (value == '' || value!.isEmpty) {
            return 'Please type your number';
          }
          if (errorMinlength) {
            return 'Please type enought Text';
          }
        }
        if (widget.inputType == InputType.name) {
          if (value == '' || value!.isEmpty) {
            return 'Please type your text';
          }
        }
        return null;
      },
      // Controller
      controller: widget.controller,
      // Decor ô input
      decoration: InputDecoration(
        // Màu nền
        filled: true,
        fillColor: MovieColor.dark_2,
        // Ghi chú
        hintText: widget.hinText,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w400,
              color: MovieColor.grey_500,
            ),
        // Icon trước
        prefixIcon: Icon(
          widget.prefixIcon,
          color: MovieColor.grey_500,
        ),
        // Icons sau
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Icon(
            obscureText ? widget.suffixIcon : Icons.visibility_outlined,
            color: MovieColor.grey_500,
          ),
        ),
        // Viền
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
        // Truy cập
        focusColor: const Color(0xffe2122114).withOpacity(0.08),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: MovieColor.primary_500,
          ),
        ),
        hoverColor: const Color(0xffe2122114).withOpacity(0.08),
      ),
      // Ẩn chữ
      obscureText: (widget.inputType == InputType.password && obscureText)
          ? true
          : false,
    );
  }
}
