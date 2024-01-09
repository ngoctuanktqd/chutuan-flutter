// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class RowSettingsPage extends StatelessWidget {
  RowSettingsPage(
      {super.key,
      this.name = '',
      this.preIcon = const Icon(Icons.local_offer_rounded)});
  String name;
  Icon preIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: Row(
        children: [
          preIcon,
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18,
          ),
        ],
      ),
    );
  }
}
