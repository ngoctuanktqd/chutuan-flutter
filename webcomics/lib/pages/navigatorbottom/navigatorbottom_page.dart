// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:webcomics/pages/moreInfo/more_info_page.dart';

class NavigatorBottomPage extends StatelessWidget {
  NavigatorBottomPage({super.key});

  List bodyScreens = [
    const MoreInfoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyScreens[0],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore_rounded,
            ),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.view_carousel_rounded,
            ),
            label: 'Genres',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.military_tech_rounded,
            ),
            label: 'Ranks',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmarks_rounded,
            ),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pending_rounded,
            ),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
