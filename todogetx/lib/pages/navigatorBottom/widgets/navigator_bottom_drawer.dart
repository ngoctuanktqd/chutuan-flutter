import 'package:flutter/material.dart';
import 'package:todogetx/apps/untils/const.dart';
import 'package:todogetx/pages/navigatorBottom/widgets/navigator_bottom_drawer_item.dart';
import 'package:todogetx/pages/navigatorBottom/widgets/navigator_bottom_drawer_item_expansion_title.dart';

class NavigatorBottomDrawer extends StatelessWidget {
  const NavigatorBottomDrawer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.6,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 3 / 1,
            child: Container(
              color: Colors.blue.shade300,
              child: const Center(
                child: Text(
                  'TO DO LIST',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  NavigatorBottomDrawerItem(
                    name: 'Star Task',
                    icon: Icons.star_rounded,
                  ),
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      title: NavigatorBottomDrawerItem(
                        name: 'Category',
                        icon: Icons.category_rounded,
                      ),
                      children: [
                        NavigatorBottomDrawerItemExpansionTile(
                          name: 'All',
                        ),
                        NavigatorBottomDrawerItemExpansionTile(
                          name: 'Work',
                        ),
                        NavigatorBottomDrawerItemExpansionTile(
                          name: 'Personal',
                        ),
                        NavigatorBottomDrawerItemExpansionTile(
                          name: 'Favorit',
                        ),
                        NavigatorBottomDrawerItemExpansionTile(
                          name: 'Birthday',
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          width: double.infinity,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.add_rounded,
                                color: TuConstantColor.subColor,
                              ),
                              getWidth(context, 0.05),
                              const Expanded(
                                child: Text('Create category'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  NavigatorBottomDrawerItem(
                    name: 'Themes',
                    icon: Icons.cleaning_services_rounded,
                  ),
                  NavigatorBottomDrawerItem(
                    name: 'Widgets',
                    icon: Icons.widgets_rounded,
                  ),
                  NavigatorBottomDrawerItem(
                    name: 'Donate',
                    icon: Icons.favorite_rounded,
                  ),
                  NavigatorBottomDrawerItem(
                    name: 'Family APP',
                    icon: Icons.dialpad_rounded,
                  ),
                  NavigatorBottomDrawerItem(
                    name: 'Feedback',
                    icon: Icons.edit_rounded,
                  ),
                  NavigatorBottomDrawerItem(
                    name: 'FAQ',
                    icon: Icons.quiz_rounded,
                  ),
                  NavigatorBottomDrawerItem(
                    name: 'Settings',
                    icon: Icons.settings_rounded,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
