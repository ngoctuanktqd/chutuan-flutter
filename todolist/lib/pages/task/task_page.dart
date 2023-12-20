import 'package:flutter/material.dart';
import 'package:todolist/apps/router/router_name.dart';
import 'package:todolist/apps/ultils/consts.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  int typeTaskActive = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 32,
                width: double.maxFinite,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            height: double.maxFinite,
                            decoration: BoxDecoration(
                              color: typeTaskActive == index
                                  ? const Color(0xff7cacf8)
                                  : const Color(0xffe1eefe),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Center(
                              child: Text(
                                'Tất cả',
                                style: typeTaskActive == index
                                    ? tTextStyle.cateActive
                                    : tTextStyle.cate,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                        itemCount: 5,
                      ),
                    ),
                    PopupMenuButton(
                      color: Colors.white,
                      iconSize: 24,
                      padding: const EdgeInsets.all(0.0),
                      offset: const Offset(-18, 36),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: const Text('Quản lý danh mục'),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouterName.categoryPage,
                            );
                          },
                        ),
                        const PopupMenuItem(
                          child: Text('Tìm kiếm'),
                        ),
                        const PopupMenuItem(
                          child: Text('Sắp xếp công việc'),
                        ),
                        const PopupMenuItem(
                          child: Text('In'),
                        ),
                        const PopupMenuItem(
                          child: Text('Nâng cấp lên Pro'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
