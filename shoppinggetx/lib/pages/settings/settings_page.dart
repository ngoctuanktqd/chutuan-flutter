import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/apps/router/router_name.dart';
import 'package:shoppinggetx/pages/settings/widgets/row_settings_page.dart';
import 'package:shoppinggetx/stores/app_store.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.grey.shade300,
                  ))),
                  width: double.infinity,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(80)),
                        child: Obx(() {
                          return Image.network(
                            AppStore.to.userInfoAvatar,
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          );
                        }),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Fresh Tomatoes',
                            style: TextStyle(
                              fontSize: 24,
                              color: Color(0xff293041),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.local_offer,
                                color: Color(0xffC29C1D),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Disc. 10%Off',
                                style: TextStyle(
                                  color: Color(0xffC29C1D),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 5),
                  width: double.infinity,
                  child: Column(
                    children: [
                      RowSettingsPage(
                        name: 'Voucher & Discount',
                        preIcon: const Icon(Icons.local_offer_rounded),
                      ),
                      RowSettingsPage(
                        name: 'Caffely Points',
                        preIcon: const Icon(Icons.generating_tokens_rounded),
                      ),
                      RowSettingsPage(
                        name: 'Caffely Rewards',
                        preIcon: const Icon(Icons.emoji_events_rounded),
                      ),
                      RowSettingsPage(
                        name: 'Favorit Coffee',
                        preIcon: const Icon(Icons.favorite_rounded),
                      ),
                      RowSettingsPage(
                        name: 'Saved Address',
                        preIcon: const Icon(Icons.place_rounded),
                      ),
                      RowSettingsPage(
                        name: 'Payment Methods',
                        preIcon: const Icon(Icons.paid_rounded),
                      ),
                      Row(
                        children: [
                          Text(
                            'General',
                            style: TextStyle(color: Colors.grey.shade300),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ],
                      ),
                      RowSettingsPage(
                        name: 'Personal Info',
                        preIcon: const Icon(Icons.person_2_rounded),
                        funtion: () {
                          Get.toNamed(RouterName.personInfo);
                        },
                      ),
                      RowSettingsPage(
                        name: 'Notification',
                        preIcon: const Icon(Icons.notifications_rounded),
                      ),
                      RowSettingsPage(
                        name: 'Security',
                        preIcon: const Icon(Icons.security_rounded),
                      ),
                      RowSettingsPage(
                        name: 'Language',
                        preIcon: const Icon(Icons.language_rounded),
                      ),
                      RowSettingsPage(
                        name: 'Darkmode',
                        preIcon: const Icon(Icons.visibility),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
