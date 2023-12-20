import 'package:flutter/material.dart';
import 'package:tintuc/models/new_model.dart';
import 'package:tintuc/provider/new_provider.dart';
import 'package:tintuc/widgets/grid_custom_page.dart';
import 'package:tintuc/widgets/skeletonizer/grid_skeleton.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key, this.idCate = 0, this.nameCate = ''});
  int idCate;
  String nameCate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(nameCate),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: NewProvider().getNewByCategoryId(idCate, 16),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return GridSkeleton(
                  length: 16,
                );
              }
              if (!snapshot.hasData) {
                return const Text('No data!');
              }
              List<NewModel> listData = snapshot.data as List<NewModel>;
              return GridCustomPost(listData: listData);
            },
          ),
        ),
      ),
    );
  }
}
