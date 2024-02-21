// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savvygetx/apps/ultils/functions.dart';
import 'package:savvygetx/managers/controllers/wallet_controller.dart';
import 'package:savvygetx/models/wallet_type_model.dart';
import 'package:svg_flutter/svg.dart';

class WalletCreateItem extends StatelessWidget {
  WalletCreateItem({
    super.key,
    required this.item,
  });

  WalletTypeModel item;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WalletController>();
    return InkWell(
      onTap: () {
        controller.goToCreate(item);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(color: Color(0xFFE8E8E8)),
            top: BorderSide(color: Color(0xFFE8E8E8)),
            right: BorderSide(color: Color(0xFFE8E8E8)),
            bottom: BorderSide(width: 1, color: Color(0xFFE8E8E8)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(item.svg),
            getWidth(context, 0.02),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    item.content,
                    style: const TextStyle(
                      color: Color(0xFF575757),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
