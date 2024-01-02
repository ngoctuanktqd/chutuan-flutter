import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tintuc/models/new_model.dart';
import 'package:tintuc/provider/new_provider.dart';
import 'package:tintuc/widgets/grid_custom_page.dart';

class ReadingPage extends StatelessWidget {
  const ReadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<NewModel> listNewReading =
        (context).read<NewProvider>().listNewReading;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách tin tức đang đọc'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: GridCustomPost(listData: listNewReading),
        ),
      ),
    );
  }
}
