import 'package:flutter/material.dart';
import 'package:shoppinggetx/pages/home/home_page.dart';
import 'package:shoppinggetx/pages/settings/settings_page.dart';

class NavigatorBottomPage extends StatefulWidget {
  const NavigatorBottomPage({super.key});

  @override
  State<NavigatorBottomPage> createState() => _NavigatorBottomPageState();
}

class _NavigatorBottomPageState extends State<NavigatorBottomPage> {
  List<Widget> bodyScreen = [
    const HomePage(),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.pink,
    ),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.green,
    ),
    Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blue,
    ),
    const SettingsPage(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyScreen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Theme.of(context).colorScheme.tertiary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sync_alt),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}
