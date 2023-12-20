import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tintuc/apps/router/router_name.dart';
import 'package:tintuc/models/category_model.dart';
import 'package:tintuc/models/new_model.dart';
import 'package:tintuc/provider/category_provider.dart';
import 'package:tintuc/provider/new_provider.dart';
import 'package:tintuc/widgets/skeletonizer/grid_skeleton.dart';
import 'package:tintuc/widgets/grid_custom_page.dart';

class HomeCategoryPage extends StatefulWidget {
  HomeCategoryPage({super.key, this.id = 0});
  int id;
  @override
  State<HomeCategoryPage> createState() => _HomeCategoryPageState();
}

class _HomeCategoryPageState extends State<HomeCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future:
                (context).read<CategoryProvider>().getInfoCategory(widget.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Skeletonizer(
                  enabled: true,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Loading',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (!snapshot.hasData) {
                return const Text('No data!');
              }
              CategoryModel data = snapshot.data as CategoryModel;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data.name,
                    style: const TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouterName.catePage,
                        arguments: {
                          'id': data.id,
                          'name': data.name,
                        },
                      );
                    },
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              );
            }),
        const SizedBox(
          height: 20,
        ),
        FutureBuilder(
            future:
                (context).read<NewProvider>().getNewByCategoryId(widget.id, 4),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return GridSkeleton(
                  length: 4,
                );
              }
              // print(snapshot);
              if (!snapshot.hasData) {
                return const Text('No data!');
              }
              List<NewModel> listData = snapshot.data as List<NewModel>;
              return GridCustomPost(listData: listData);
            }),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
