import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todolist/apps/router/router_name.dart';
import 'package:todolist/pages/category/category_page.dart';
import 'package:todolist/pages/navigatorbottom/navigator_bottom.dart';
import 'package:todolist/pages/onboarding/onboarding.dart';
import 'package:todolist/pages/task/task_page.dart';

class RouterCustom {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterName.onBoarding:
        return PageTransition(
            child: const OnBoardingPage(), type: PageTransitionType.fade);
      case RouterName.navigatorBottom:
        return PageTransition(
            child: const NavigatorBottomPage(), type: PageTransitionType.fade);
      case RouterName.taskPage:
        return PageTransition(
            child: const TaskPage(), type: PageTransitionType.fade);
      case RouterName.categoryPage:
        return PageTransition(
            child: const CategoryPage(), type: PageTransitionType.fade);
      default:
        return PageTransition(
            child: const OnBoardingPage(), type: PageTransitionType.fade);
    }
  }
}
