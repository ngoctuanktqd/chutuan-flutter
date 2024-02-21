// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:savvygetx/apps/ultils/functions.dart';
import 'package:savvygetx/managers/controllers/setting_controller.dart';
import 'package:savvygetx/models/currency_model.dart';

class CurrencyItem extends StatelessWidget {
  CurrencyItem({
    super.key,
    required this.item,
    required this.controller,
  });
  CurrencyModel item;
  SettingController controller;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.updateCurrentCurrency(item);
      },
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(
              color: Color(0xFFC7C7C7),
            ),
            top: BorderSide(
              width: 0.50,
              color: Color(0xFFC7C7C7),
            ),
            right: BorderSide(
              color: Color(0xFFC7C7C7),
            ),
            bottom: BorderSide(
              width: 0.50,
              color: Color(0xFFC7C7C7),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      showImageBase64(item.flag),
                      getWidth(context, 0.02),
                      Expanded(
                        child: Text(
                          '${item.country} (${item.countryCode})',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                  Text(
                    item.name,
                    style: const TextStyle(
                      color: Color(0xFF8C8C8C),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            getWidth(context, 0.02),
            Text(
              item.code,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
