import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:tintuc/apps/router/router_name.dart';
import 'package:tintuc/pages/home/widgets/home_category_page.dart';
import 'package:tintuc/pages/home/widgets/home_drawer.dart';
import 'package:tintuc/pages/setting/setting_page.dart';
import 'package:tintuc/provider/category_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          InkWell(
            child: const Icon(Icons.search),
            onTap: () {
              Navigator.pushNamed(context, RouterName.searchPage);
            },
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      drawer: const HomeDrawerPage(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Consumer<CategoryProvider>(
            builder: (context, categoryProvider, child) {
              List<int> listCate = categoryProvider.listCheckbox;
              return Column(
                children: [
                  for (var idCate in listCate) HomeCategoryPage(id: idCate),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
