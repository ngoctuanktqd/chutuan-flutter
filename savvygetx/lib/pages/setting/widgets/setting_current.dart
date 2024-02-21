import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savvygetx/apps/ultils/functions.dart';
import 'package:savvygetx/managers/controllers/setting_controller.dart';
import 'package:savvygetx/stores/app_store.dart';

class SettingCurrent extends StatelessWidget {
  const SettingCurrent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingController>();
    return InkWell(
      onTap: controller.goToCurrencyPage,
      child: Row(
        children: [
          Expanded(
            child: Obx(() {
              return Row(
                children: [
                  showImageBase64(AppStore.to.currencyFlag),
                  getWidth(context, 0.02),
                  Expanded(
                    child: Text(
                      '${AppStore.to.currencyName} (${AppStore.to.currencyCode})',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              );
            }),
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Color(0xff878787),
          ),
        ],
      ),
    );
  }
}
