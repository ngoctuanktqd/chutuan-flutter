import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:tintuc/models/category_model.dart';
import 'package:tintuc/models/new_model.dart';
import 'package:tintuc/pages/category/category_page.dart';
import 'package:tintuc/provider/category_provider.dart';
import 'package:tintuc/provider/new_provider.dart';

class HomeCategoryPage extends StatefulWidget {
  HomeCategoryPage({super.key, this.id = 0});
  int id;
  @override
  State<HomeCategoryPage> createState() => _HomeCategoryPageState();
}

class _HomeCategoryPageState extends State<HomeCategoryPage> {
  @override
  Widget build(BuildContext context) {
    // CategoryModel infoCate =
    // (context).read<CategoryProvider>().getInfoCategory(1);
    // print((context).read<CategoryProvider>().getAllCategory());
    return Column(
      children: [
        FutureBuilder(
            future:
                (context).read<CategoryProvider>().getInfoCategory(widget.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
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
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                            child: CategoryPage(id: data.id),
                            type: PageTransitionType.fade,
                          ),
                          (route) => false);
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
                return const Center(child: CircularProgressIndicator());
              }
              // print(snapshot);
              if (!snapshot.hasData) {
                return const Text('No data!');
              }
              List<NewModel> listData = snapshot.data as List<NewModel>;
              return GridView.builder(
                itemCount: listData.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 3 / 1,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                listData[index].thumb,
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              listData[index].title,
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Expanded(
                              child: Text(
                                listData[index].description,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Text(
                              'Mar 5 2023',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            }),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
