// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:moviegetx/apps/ultills/consts.dart';

class GenreCustom extends StatelessWidget {
  GenreCustom({
    super.key,
    required this.name,
  });

  String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(
          width: 1,
          color: MovieColor.primary_500,
        ),
      ),
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: MovieColor.primary_500,
        ),
      ),
    );
  }
}
