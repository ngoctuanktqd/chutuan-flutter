// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  NewPage({super.key, this.id = 0, this.title = ''});
  int id;
  String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        title: Text(title),
      ),
    );
  }
}
