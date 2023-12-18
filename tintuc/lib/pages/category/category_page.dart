import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tintuc/models/new_model.dart';
import 'package:tintuc/pages/home/home_page.dart';
import 'package:tintuc/provider/new_provider.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key, this.id = 0});
  int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                PageTransition(
                  child: const HomePage(),
                  type: PageTransitionType.fade,
                ),
                (route) => false);
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text('$id'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: NewProvider().getNewByCategoryId(id, 16),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              print(snapshot);
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
            },
          ),
        ),
      ),
    );
  }
}
