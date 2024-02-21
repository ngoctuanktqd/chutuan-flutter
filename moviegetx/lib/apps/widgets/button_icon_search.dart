import 'package:flutter/material.dart';

class ButtonIconSearch extends StatelessWidget {
  const ButtonIconSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Icon(Icons.search_outlined),
    );
  }
}
