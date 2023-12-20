import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/apps/ultils/consts.dart';
import 'package:todolist/provider/cate_provider.dart';

Future<dynamic> categoryDeleteMethod(
    BuildContext context, String name, int id) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          'Xoá danh mục tên: $name ?',
          style: tTextStyle.titleAlertDialog,
        ),
        content: const Text(
          'Tất cả nhiệm vụ trong danh mục này sẽ bị xoá!',
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Huỷ',
              style: TextStyle(
                color: Color(0xffbcd2fb),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Provider.of<CateProvider>(context, listen: false).removeCate(id);
              Navigator.pop(context);
            },
            child: const Text(
              'Xoá',
              style: TextStyle(
                color: Color.fromARGB(255, 206, 48, 61),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    },
  );
}
