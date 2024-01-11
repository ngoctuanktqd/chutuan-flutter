import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  TextFieldCustom({
    super.key,
    this.prefixIcon = Icons.abc,
    this.suffixIcon = Icons.abc,
    this.hintText = 'Enter your password!',
    this.obscure = false,
    required this.controller,
  });

  IconData prefixIcon;
  IconData suffixIcon;
  String hintText;
  bool obscure;
  TextEditingController controller;

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  bool hiddenText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
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
        prefixIcon: Icon(widget.prefixIcon),
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
        // Nen input
        fillColor: const Color(0xffE8EFF3),
        filled: true,
        // hoverColor: const Color(0xff027335),
        // Con tro trong input
        focusColor: Theme.of(context).colorScheme.secondary,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        // Con tro ngoa input
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
