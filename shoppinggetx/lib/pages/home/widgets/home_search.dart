import 'package:flutter/material.dart';
import 'package:shoppinggetx/apps/consts/consts.dart';

class HomeSearchPage extends StatelessWidget {
  const HomeSearchPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search_rounded),
          hintText: 'Search beverages or foods',
          hintStyle: Theme.of(context).textTheme.displaySmall,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: TuConstColor.color_01,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
