import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:webcomics/apps/route/router_name.dart';
import 'package:webcomics/pages/moreInfo/more_info_page.dart';
import 'package:webcomics/pages/navigatorbottom/navigatorbottom_page.dart';

class RouterCustom {
  static Route conGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterName.navigatorBottom:
        return PageTransition(
          child: NavigatorBottomPage(),
          type: PageTransitionType.fade,
        );
      case RouterName.moreInfoPage:
        return PageTransition(
          child: const MoreInfoPage(),
          type: PageTransitionType.fade,
        );
      default:
        return PageTransition(
          child: NavigatorBottomPage(),
          type: PageTransitionType.fade,
        );
    }
  }
}
