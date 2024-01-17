import 'package:flutter/material.dart';
import 'package:shoppinggetx/apps/consts/consts.dart';
import 'package:shoppinggetx/apps/consts/functions.dart';

class TextFieldCustom extends StatefulWidget {
  TextFieldCustom({
    super.key,
    this.prefixIcon = Icons.abc,
    this.showPreicon = true,
    this.suffixIcon = Icons.abc,
    this.hintText = 'Enter your password!',
    this.obscure = false,
    required this.controller,
    this.inputType,
  });

  IconData prefixIcon;
  bool showPreicon;
  IconData suffixIcon;
  String hintText;
  bool obscure;
  TextEditingController controller;
  InputType? inputType;

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  bool hiddenText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }

        switch (widget.inputType) {
          case InputType.Email:
            return checkEmailForm(value) ? null : 'Email not correct';
          default:
        }

        return null;
      },
      controller: widget.controller,
      // hien ban phim
      scrollPadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20 * 4),
      // Neu la pass
      obscuringCharacter: '•',
      obscureText: widget.obscure && hiddenText ? true : false,
      autocorrect: !widget.obscure,
      // decor input
      decoration: InputDecoration(
        // bool autofocus = false,
        prefixIcon: widget.showPreicon ? Icon(widget.prefixIcon) : null,
        suffixIcon: widget.obscure
            ? InkWell(
                onTap: () {
                  setState(() {
                    hiddenText = !hiddenText;
                  });
                },
                child: hiddenText
                    ? Icon(widget.suffixIcon)
                    : const Icon(Icons.visibility_off_rounded),
              )
            : null,
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.tertiary,
              fontWeight: FontWeight.normal,
            ),
        isDense: true,
        // Border bt
        // Nen input
        fillColor: const Color(0xffE8EFF3),
        filled: true,
        // hoverColor: const Color(0xff027335),
        // Con tro trong input
        focusColor: Theme.of(context).colorScheme.outline,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        // Con tro ngoa input
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
