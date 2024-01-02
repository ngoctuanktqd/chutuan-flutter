import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tintuc/models/category_model.dart';
import 'package:tintuc/provider/category_provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            // Navigator.pushReplacement(
            //   context,
            //   PageTransition(
            //       child: const HomePage(), type: PageTransitionType.fade),
            // );
            Navigator.pop(context);
            // Navigator.pushAndRemoveUntil(
            //     context,
            //     PageTransition(
            //       child: const HomePage(),
            //       type: PageTransitionType.fade,
            //     ),
            //     (route) => false);
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: (context).read<CategoryProvider>().getAllCategory(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData) {
              return const Text('No data!');
            }

            List<CategoryModel> data = snapshot.data as List<CategoryModel>;

            return GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3 / 1,
              ),
              // shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.primaries[index],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(data[index].name),
                        Consumer<CategoryProvider>(
                          builder: (context, myProvider, child) {
                            return Checkbox(
                              value: myProvider.listCheckbox
                                  .contains(data[index].id),
                              onChanged: (_) {
                                myProvider.addCheck(data[index].id);
                              },
                              shape: const CircleBorder(),
                              activeColor: Colors.blue,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
