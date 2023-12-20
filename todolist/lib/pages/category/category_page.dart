import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/apps/ultils/consts.dart';
import 'package:todolist/models/cate_model.dart';
import 'package:todolist/pages/category/widgets/category_color_page.dart';
import 'package:todolist/pages/category/widgets/category_create_page.dart';
import 'package:todolist/pages/category/widgets/category_delete_page.dart';
import 'package:todolist/provider/cate_provider.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quản lý Danh Mục',
          style: tTextStyle.titleAppbar,
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: double.maxFinite,
            color: const Color(0xffe1eefe),
            child: const Center(
              child: Text('Các danh mục hiển thị trên trang chủ'),
            ),
          ),
          getSizeboxHeight(context, 0.03),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.maxFinite,
            child: Consumer<CateProvider>(
              builder: (context, cateProvider, child) {
                List<CateModel> listCate = cateProvider.listCate;
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 20,
                      width: double.maxFinite,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: listCate[index].color,
                            ),
                          ),
                          getSizeboxWidth(context, 0.01),
                          Expanded(
                            child: Text(listCate[index].name),
                          ),
                          Text(listCate[index].countTask.toString()),
                          getSizeboxWidth(context, 0.02),
                          PopupMenuButton(
                            iconSize: 18,
                            padding: const EdgeInsets.all(0.0),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                          'Chỉnh sửa danh mục: ${listCate[index].name}',
                                          style: tTextStyle.titleAlertDialog,
                                        ),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 5,
                                                horizontal: 10,
                                              ),
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                color: Color(0xfff2f6f7),
                                              ),
                                              child: TextField(
                                                controller: null,
                                                maxLength: 90,
                                                maxLines: 3,
                                                style: const TextStyle(
                                                  backgroundColor:
                                                      Color(0xfff2f6f7),
                                                ),
                                                decoration: InputDecoration(
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  hintText:
                                                      listCate[index].name,
                                                ),
                                              ),
                                            ),
                                            getSizeboxHeight(context, 0.02),
                                            const Text(
                                              'Màu sắc thể loại',
                                              style:
                                                  tTextStyle.titleAlertDialog,
                                            ),
                                            const Text(
                                                'Màu sắc sẽ hiện thị trong giao diện lịch'),
                                            getSizeboxHeight(context, 0.02),
                                            CategoryColorPage(
                                              color: listCate[index].color,
                                              id: listCate[index].id,
                                            ),
                                          ],
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
                                              // Navigator.pop(context);
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
                                child: const Text('Chỉnh sửa'),
                              ),
                              const PopupMenuItem(
                                child: Text('Ẩn dấu'),
                              ),
                              PopupMenuItem(
                                onTap: () {
                                  categoryDeleteMethod(context,
                                      listCate[index].name, listCate[index].id);
                                  //
                                },
                                child: const Text('Xoá'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 20,
                    );
                  },
                  itemCount: listCate.length,
                );
              },
            ),
          ),
          getSizeboxHeight(context, 0.03),
          const CategoryCreatePage()
        ],
      ),
    );
  }
}
