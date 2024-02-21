// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TabbarButton extends StatelessWidget {
  TabbarButton({
    super.key,
    required this.name,
    this.index = 0,
    this.currentIndex = 0,
    this.controller,
  });

  String name;
  int index;
  int currentIndex;
  final controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeTab(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 13.0,
          horizontal: 16.0,
        ),
        decoration: BoxDecoration(
          color: index == currentIndex ? const Color(0xffAD4CEE) : null,
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
