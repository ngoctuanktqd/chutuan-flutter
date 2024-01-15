import 'package:flutter/material.dart';
import 'package:shoppinggetx/apps/widgets/text_field_custom.dart';

class HomeSearchPage extends StatefulWidget {
  const HomeSearchPage({
    super.key,
  });

  @override
  State<HomeSearchPage> createState() => _HomeSearchPageState();
}

class _HomeSearchPageState extends State<HomeSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: TextFieldCustom(
        controller: _searchController,
        hintText: 'Search beverages or foods',
        prefixIcon: Icons.search_rounded,
      ),
    );
  }
}
