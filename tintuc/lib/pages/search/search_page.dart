import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tintuc/models/new_model.dart';
import 'package:tintuc/provider/new_provider.dart';
import 'package:tintuc/widgets/grid_custom_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
  }

  Timer? timer;
  void getLiveSearch(value) {
    if (timer != null) {
      timer?.cancel();
    }
    timer = Timer(const Duration(seconds: 1), () {
      Future.wait([
        (context).read<NewProvider>().getNewByKey(value),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: TextFormField(
          onChanged: getLiveSearch,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            hintText: 'Nhập từ khoá tìm kiếm',
            suffixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Consumer<NewProvider>(
          builder: (context, newProvider, child) {
            List<NewModel> listData = newProvider.listNewByCategoryKey;
            if (listData.isNotEmpty) {
              return GridCustomPost(listData: listData);
            } else {
              return const Center(child: Text("Not Found Data!"));
            }
          },
        ),
      ),
    );
  }
}
