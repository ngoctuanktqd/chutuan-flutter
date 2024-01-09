import 'package:flutter/material.dart';

class HomeSearchPage extends StatelessWidget {
  const HomeSearchPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search_rounded),
          hintText: 'Search beverages or foods',
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffE8EFF3),
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
