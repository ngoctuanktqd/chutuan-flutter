import 'package:flutter/material.dart';
import 'package:todolist/pages/task/task_page.dart';

class NavigatorBottomPage extends StatefulWidget {
  const NavigatorBottomPage({super.key});

  @override
  State<NavigatorBottomPage> createState() => _NavigatorBottomPageState();
}

class _NavigatorBottomPageState extends State<NavigatorBottomPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  List<Widget> mainScreens = [
    Container(
      color: Colors.red,
      height: double.maxFinite,
      width: double.maxFinite,
    ),
    const TaskPage(),
    Container(
      color: Colors.blue,
      height: double.maxFinite,
      width: double.maxFinite,
    ),
    Container(
      color: Colors.red,
      height: double.maxFinite,
      width: double.maxFinite,
    ),
  ];

  int _selectedIndex = 1;
  void _onItemTapped(context, int index) {
    if (index != 0) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainScreens[_selectedIndex],
      drawer: Drawer(
        key: _key,
        width: MediaQuery.sizeOf(context).width * 0.8,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Nhiệm vụ',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Lịch',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tài khoản',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (index != 0) {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
        unselectedItemColor: const Color(0xffc5ccd4),
        selectedItemColor: const Color(0xff4881f2),
      ),
      floatingActionButton: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.add),
        color: Colors.white,
        iconSize: 36,
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xff7dabf6),
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
