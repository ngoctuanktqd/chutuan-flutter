// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class RowSettingsPage extends StatelessWidget {
  RowSettingsPage({
    super.key,
    this.name = '',
    this.preIcon = const Icon(Icons.local_offer_rounded),
    this.funtion,
  });
  String name;
  Icon preIcon;
  Function()? funtion;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: funtion,
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        child: Row(
          children: [
            preIcon,
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                name,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
