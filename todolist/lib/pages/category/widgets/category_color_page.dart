import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/apps/ultils/consts.dart';
import 'package:todolist/provider/cate_provider.dart';

class CategoryColorPage extends StatefulWidget {
  CategoryColorPage({
    super.key,
    this.color = const Color(0xff3290e7),
    required this.id,
  });
  int id;
  Color color;

  @override
  State<CategoryColorPage> createState() => _CategoryColorPageState();
}

class _CategoryColorPageState extends State<CategoryColorPage> {
  // Color indexColor = widget.color;
  @override
  Widget build(BuildContext context) {
    print(widget.color);
    print(widget.id);
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              widget.color = const Color(0xff3290e7);
            });
            Provider.of<CateProvider>(context, listen: false)
                .setColorCate(widget.id, const Color(0xff3290e7));
          },
          child: Container(
            height: 21,
            width: 21,
            decoration: BoxDecoration(
              color: const Color(0xff3290e7),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xff3290e7), // Border color
                width: 2.0, // Border width
              ),
            ),
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: const Color(0xff3290e7),
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.color == const Color(0xff3290e7)
                      ? Colors.white
                      : Colors.transparent, // Border color
                  width: 2.0, // Border width
                ),
              ),
            ),
          ),
        ),
        getSizeboxWidth(context, 0.01),
        InkWell(
          onTap: () {
            setState(() {
              widget.color = const Color(0xfff05423);
            });
            Provider.of<CateProvider>(context, listen: false)
                .setColorCate(widget.id, const Color(0xfff05423));
          },
          child: Container(
            height: 21,
            width: 21,
            decoration: BoxDecoration(
              color: const Color(0xfff05423),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xfff05423), // Border color
                width: 2.0, // Border width
              ),
            ),
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: const Color(0xfff05423),
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.color == const Color(0xfff05423)
                      ? Colors.white
                      : Colors.transparent, // Border color
                  width: 2.0, // Border width
                ),
              ),
            ),
          ),
        ),
        getSizeboxWidth(context, 0.01),
        InkWell(
          onTap: () {
            setState(() {
              widget.color = const Color(0xfff3c637);
            });
            Provider.of<CateProvider>(context, listen: false)
                .setColorCate(widget.id, const Color(0xfff3c637));
          },
          child: Container(
            height: 21,
            width: 21,
            decoration: BoxDecoration(
              color: const Color(0xfff3c637),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xfff3c637), // Border color
                width: 2.0, // Border width
              ),
            ),
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: const Color(0xfff3c637),
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.color == const Color(0xfff3c637)
                      ? Colors.white
                      : Colors.transparent, // Border color
                  width: 2.0, // Border width
                ),
              ),
            ),
          ),
        ),
        getSizeboxWidth(context, 0.01),
        InkWell(
          onTap: () {
            setState(() {
              widget.color = const Color(0xff82ad44);
            });
            Provider.of<CateProvider>(context, listen: false)
                .setColorCate(widget.id, const Color(0xff82ad44));
          },
          child: Container(
            height: 21,
            width: 21,
            decoration: BoxDecoration(
              color: const Color(0xff82ad44),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xff82ad44), // Border color
                width: 2.0, // Border width
              ),
            ),
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: const Color(0xff82ad44),
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.color == const Color(0xff82ad44)
                      ? Colors.white
                      : Colors.transparent, // Border color
                  width: 2.0, // Border width
                ),
              ),
            ),
          ),
        ),
        getSizeboxWidth(context, 0.01),
        InkWell(
          onTap: () {
            setState(() {
              widget.color = const Color(0xff2d9185);
            });
            Provider.of<CateProvider>(context, listen: false)
                .setColorCate(widget.id, const Color(0xff2d9185));
          },
          child: Container(
            height: 21,
            width: 21,
            decoration: BoxDecoration(
              color: const Color(0xff2d9185),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xff2d9185), // Border color
                width: 2.0, // Border width
              ),
            ),
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: const Color(0xff2d9185),
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.color == const Color(0xff2d9185)
                      ? Colors.white
                      : Colors.transparent,
                  width: 2.0, // Border width
                ),
              ),
            ),
          ),
        ),
        getSizeboxWidth(context, 0.01),
        InkWell(
          onTap: () {
            setState(() {
              widget.color = const Color(0xffb59bdc);
            });
            Provider.of<CateProvider>(context, listen: false)
                .setColorCate(widget.id, const Color(0xffb59bdc));
          },
          child: Container(
            height: 21,
            width: 21,
            decoration: BoxDecoration(
              color: const Color(0xffb59bdc),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xffb59bdc), // Border color
                width: 2.0, // Border width
              ),
            ),
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: const Color(0xffb59bdc),
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.color == const Color(0xffb59bdc)
                      ? Colors.white
                      : Colors.transparent, // Border color
                  width: 2.0, // Border width
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
