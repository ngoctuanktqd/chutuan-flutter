import 'package:flutter/material.dart';
import 'package:todogetx/apps/untils/const.dart';

class NavigatorBottomDrawerItemExpansionTile extends StatelessWidget {
  NavigatorBottomDrawerItemExpansionTile({
    super.key,
    this.name = '',
  });
  String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      child: Row(
        children: [
          const Icon(
            Icons.text_snippet_rounded,
            color: Colors.grey,
          ),
          getWidth(context, 0.05),
          Expanded(
            child: Text(name),
          ),
        ],
      ),
    );
  }
}
