import 'package:flutter/material.dart';
import 'package:todogetx/pages/navigatorBottom/widgets/navigator_bottom_drawer.dart';
import 'package:todogetx/pages/tasks/tasks_page.dart';

class NavigatorBottomPage extends StatefulWidget {
  const NavigatorBottomPage({super.key});

  @override
  State<NavigatorBottomPage> createState() => _NavigatorBottomPageState();
}

class _NavigatorBottomPageState extends State<NavigatorBottomPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 1;

  List<Widget> mainScreens = [
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
    ),
    const TasksPage(),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.green,
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blue,
    ),
  ];

  void bottomOnTap(vallue) {
    print(vallue);
    if (vallue > 0) {
      setState(() {
        currentIndex = vallue;
      });
    } else {
      print('Mo menu nao');
      _scaffoldKey.currentState?.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: mainScreens[currentIndex],
        drawer: const NavigatorBottomDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: bottomOnTap,
          currentIndex: currentIndex,
          selectedItemColor: const Color(0xff3e89e3),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
              ),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.task_rounded,
              ),
              label: 'Task',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today_rounded,
              ),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_rounded,
              ),
              label: 'Mine',
            ),
          ],
        ),
      ),
    );
  }
}
