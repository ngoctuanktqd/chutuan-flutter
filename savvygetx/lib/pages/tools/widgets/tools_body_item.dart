// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:savvygetx/apps/ultils/functions.dart';
import 'package:svg_flutter/svg.dart';

class ToolsBodyItem extends StatelessWidget {
  ToolsBodyItem({
    super.key,
    required this.svg,
    required this.name,
    required this.content,
    this.funtion,
  });
  String svg;
  String name;
  String content;
  Function()? funtion;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: funtion,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 25,
            horizontal: 13,
          ),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 10,
                offset: Offset(0, 2),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            children: [
              SvgPicture.asset(svg),
              getHeight(context, 0.01),
              Text(
                name,
                style: const TextStyle(
                  color: Color(0xFF595959),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              getHeight(context, 0.01),
              Text(
                content,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF8C8C8C),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
