import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/apps/ultils/consts.dart';
import 'package:todolist/provider/cate_provider.dart';

class CategoryCreatePage extends StatefulWidget {
  const CategoryCreatePage({
    super.key,
  });

  @override
  State<CategoryCreatePage> createState() => _CategoryCreatePageState();
}

class _CategoryCreatePageState extends State<CategoryCreatePage> {
  TextEditingController nameCate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: const Color(0xfffdfffe),
              title: const Text(
                'Tạo danh mục mới',
                style: tTextStyle.titleAlertDialog,
              ),
              content: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xfff2f6f7),
                ),
                child: TextField(
                  controller: nameCate,
                  maxLength: 90,
                  maxLines: 3,
                  style: const TextStyle(
                    backgroundColor: Color(0xfff2f6f7),
                  ),
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Nhập tên danh mục',
                  ),
                ),
              ),
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'HUỶ',
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
                    Provider.of<CateProvider>(context, listen: false)
                        .createCate(nameCate.text);
                    nameCate.clear();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'LƯU',
                    style: TextStyle(
                      color: Color(0xff7daef3),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Icon(
              Icons.add,
              color: Color(0xff7ba7e8),
            ),
            getSizeboxWidth(context, 0.01),
            const Text(
              'Tạo mới',
              style: TextStyle(
                color: Color(0xff4d84df),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
