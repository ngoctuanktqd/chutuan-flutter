import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:tintuc/apps/router/router_name.dart';
import 'package:tintuc/pages/home/widgets/home_category_page.dart';
import 'package:tintuc/pages/setting/setting_page.dart';
import 'package:tintuc/provider/category_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  // List<int> listCate2 = [];
  // @override
  // void initState() {
  //   super.initState();
  //   // Perform one-time initialization tasks here
  //   List<int> listCate = (context).read<CategoryProvider>().listCheckbox;
  // }

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
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      drawer: Container(
        width: MediaQuery.sizeOf(context).width * 0.6,
        color: Colors.blue,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlutterLogo(
                      size: 120,
                    ),
                  ],
                ),
                const Gap(20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'App Tin Tức',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Gap(30),
                const Text(
                  'Trang Chủ',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                const Gap(20),
                const Text(
                  'Yêu Thích',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                const Gap(20),
                const Text(
                  'Đã Xem',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                const Gap(20),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                          child: const SettingPage(),
                          type: PageTransitionType.fade,
                        ),
                        (route) => false);
                  },
                  child: const Text(
                    'Setting',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
