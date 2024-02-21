import 'dart:convert';

import 'package:get/get.dart';
import 'package:savvygetx/apps/routers/router_name.dart';
import 'package:savvygetx/managers/connects/currency_connect.dart';
import 'package:savvygetx/managers/connects/language_connect.dart';
import 'package:savvygetx/managers/states/setting_state.dart';
import 'package:savvygetx/models/currency_model.dart';
import 'package:savvygetx/models/language_model.dart';
import 'package:savvygetx/stores/app_store.dart';

//class SettingController extends GetxController with StateMixin {}
class SettingController extends GetxController {
  final state = SettingState();
  @override
  void onInit() async {
    // ngon ngu
    state.listLanguage = <LanguageModel>[].obs;
    state.currentLanguage = AppStore.to.languageId.obs;
    await getListLanguage();
    // tien te
    state.listCurrency = <CurrencyModel>[].obs;
    await getListCurrent();
    // TODO: implement onInit
    super.onInit();
    print(state.listCurrency);
  }

  // Xu lys ngon ngu
  getListLanguage() async {
    final data = await LanguageConnect().list();
    List listData = jsonDecode(data);
    List result = listData.map((e) => LanguageModel.fromMap(e)).toList();
    // print(result);
    state.listLanguage.clear();
    state.listLanguage.addAll(result);
  }

  updateCurrentLanguage(LanguageModel item) {
    state.currentLanguage.value = item.id;
    AppStore.to.updateCurrentLanguage(item);
  }

  // xu ly tien te
  getListCurrent() async {
    final data = await CurrentConnect().list();
    List listData = jsonDecode(data);
    List result = listData.map((e) => CurrencyModel.fromMap(e)).toList();
    // print(result);
    state.listCurrency.clear();
    state.listCurrency.addAll(result);
  }

  updateCurrentCurrency(CurrencyModel item) {
    AppStore.to.updateCurrentCurrency(item);
    Get.back();
  }

  // chuyen huong
  goToCurrencyPage() {
    Get.toNamed(RouterName.settingCurrency);
  }
}
