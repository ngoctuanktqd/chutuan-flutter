import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savvygetx/apps/routers/router_name.dart';
import 'package:savvygetx/managers/connects/wallet_connect.dart';
import 'package:savvygetx/managers/states/wallet_state.dart';
import 'package:savvygetx/models/wallet_type_model.dart';
import 'package:savvygetx/pages/wallet/widgets/wallet_create_debt.dart';
import 'package:savvygetx/pages/wallet/widgets/wallet_create_saving.dart';
import 'package:savvygetx/pages/wallet/widgets/wallet_create_spending.dart';

//class WalletController extends GetxController with StateMixin {}
class WalletController extends GetxController {
  final state = WalletState();
  @override
  void onInit() async {
    state.listSpending = <WalletTypeModel>[].obs;
    state.listSaving = <WalletTypeModel>[].obs;
    state.listDebt = <WalletTypeModel>[].obs;
    state.indexTab = 0.obs;
    state.listTabScreen = <Widget>[].obs;

    // TODO: implement onInit
    super.onInit();
    await getListScreen();
    await getListWallet();
  }

  // xu ly wallet
  getListWallet() async {
    String responsive = await WalletConnect().list();
    List data = jsonDecode(responsive);
    List dataSpending = data
        .where((element) => element['type'] == 'spending')
        .map((e) => WalletTypeModel.fromMap(e))
        .toList();
    state.listSpending.addAll(dataSpending);
    List dataSaving = data
        .where((element) => element['type'] == 'saving')
        .map((e) => WalletTypeModel.fromMap(e))
        .toList();
    state.listSaving.addAll(dataSaving);
    List dataDebt = data
        .where((element) => element['type'] == 'debt')
        .map((e) => WalletTypeModel.fromMap(e))
        .toList();
    state.listDebt.addAll(dataDebt);
  }

  // Xu ly create wallet
  getListScreen() async {
    state.listTabScreen.addAll([
      const WalletCreateSpending(),
      const WalletCreateSaving(),
      const WalletCreateDebt(),
    ].toList());
  }

  setIndexTab(v) {
    state.indexTab.value = v;
  }

  // chuyen huong
  goToCreate(typeWallet) {
    Get.toNamed(RouterName.walletCreateNew, arguments: typeWallet);
  }
}
