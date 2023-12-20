import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tintuc/apps/keys/mykey.dart';
import 'package:tintuc/apps/router/router_name.dart';
import 'package:tintuc/apps/store/share.dart';
import 'package:tintuc/pages/category/category_page.dart';
import 'package:tintuc/pages/home/home_page.dart';
import 'package:tintuc/pages/loading/loading_page.dart';
import 'package:tintuc/pages/new/new_page.dart';
import 'package:tintuc/pages/search/search_page.dart';
import 'package:tintuc/pages/setting/setting_page.dart';

class RouterCustom {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterName.loadingPage:
        return PageTransition(
          child: LoadingPage(),
          type: PageTransitionType.fade,
        );
      case RouterName.homePage:
        return PageTransition(
          child: const HomePage(),
          type: PageTransitionType.fade,
        );
      case RouterName.settingPage:
        return PageTransition(
          child: const SettingPage(),
          type: PageTransitionType.fade,
        );
      case RouterName.itemPage:
        return PageTransition(
          child: const SettingPage(),
          type: PageTransitionType.fade,
        );
      case RouterName.searchPage:
        return PageTransition(
          child: const SearchPage(),
          type: PageTransitionType.fade,
        );
      case RouterName.catePage:
        final cateSetting = settings.arguments as Map;
        // int id = cateSetting['id'] ?? 0;
        return PageTransition(
          child: CategoryPage(
            idCate: cateSetting['id'],
            nameCate: cateSetting['name'],
          ),
          type: PageTransitionType.fade,
        );
      case RouterName.newPage:
        final newSetting = settings.arguments as Map;
        // int id = cateSetting['id'] ?? 0;
        return PageTransition(
          child: NewPage(
            id: newSetting['id'],
            title: newSetting['title'],
          ),
          type: PageTransitionType.fade,
        );
      default:
        return PageTransition(
          child: LoadingPage(),
          type: PageTransitionType.fade,
        );
    }
  }

  Future<String> getHomePage() async {
    String data = await SharedPrefenceCustom.get(MyKey.categoryKey);
    // print(data);
    if (data.isNotEmpty || data != '') {
      return RouterName.settingPage;
    }
    return RouterName.homePage;
  }
}
