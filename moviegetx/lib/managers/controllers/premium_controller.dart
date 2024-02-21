import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/routers/router_name.dart';
import 'package:moviegetx/apps/ultills/functions.dart';
import 'package:moviegetx/apps/ultills/my_key.dart';
import 'package:moviegetx/managers/states/premium_state.dart';
import 'package:moviegetx/models/payment_model.dart';
import 'package:moviegetx/models/plans_model.dart';
import 'package:moviegetx/services/shared_service.dart';
import 'package:moviegetx/stores/app_store.dart';

class PremiumController extends GetxController {
  final state = PremiumState();

  @override
  void onInit() async {
    state.premiumPlans = 0.obs;
    state.premiumPlansList = <PlansModel>[].obs;

    state.premiumPayment = <PaymentModel>[].obs;
    state.currentPayment = 'paypal'.obs;
    state.cardNameController = TextEditingController();
    state.cardNumberController = TextEditingController();
    state.cardExpiredController = TextEditingController();
    state.cardCVVController = TextEditingController();
    state.keyForm = GlobalKey<FormState>();
    // TODO: implement onInit
    super.onInit();
    await getListPayment();
    await getListPlans();
  }

  // Plans
  getListPlans() {
    state.premiumPlansList.add(
      PlansModel(name: 'month', price: 9.99),
    );
    state.premiumPlansList.add(
      PlansModel(name: 'month', price: 9.99),
    );
  }

  // Payment
  getListPayment() {
    print('payment: ${SharedService.to.getString(MyKey.listPayment)}');
    if (SharedService.to.getString(MyKey.listPayment) != '' &&
        SharedService.to.getString(MyKey.listPayment) != '""') {
      // Da co du lieu luu
      List paymentData =
          jsonDecode(SharedService.to.getString(MyKey.listPayment));
      List permiumPayment =
          paymentData.map((e) => PaymentModel.fromJson(e)).toList();
      state.premiumPayment.addAll(permiumPayment);
    } else {
      // chua co thi add nao
      state.premiumPayment.addAll(
        [
          PaymentModel(
            id: 'paypal',
            logo: 'assets/images/icon_paypal.svg',
            namePayment: 'Paypal',
            email: AppStore.to.userEmail,
          ),
          PaymentModel(
            id: 'google',
            logo: 'assets/images/icon_google.svg',
            namePayment: 'Google',
            email: AppStore.to.userEmail,
          ),
          PaymentModel(
            id: 'apple',
            logo: 'assets/images/icon_apple.svg',
            namePayment: 'Apple',
            email: AppStore.to.userEmail,
          ),
        ].toList(),
      );
      // Luu vao shared
      SharedService.to.setString(MyKey.listPayment, state.premiumPayment);
    }
  }

  setCurrentPayment(value) {
    state.currentPayment.value = value;
  }

  addCard() async {
    if (state.keyForm.currentState!.validate()) {
      showLoading();
      // Check xem da ton tai the chua
      List data = state.premiumPayment;
      final index = data.indexWhere(
          (element) => element.id == state.cardNumberController.text);
      if (index == -1) {
        closeLoading();
        // them the vao danh sach thanh toan
        state.premiumPayment.add(
          PaymentModel(
            id: state.cardNumberController.text,
            logo: 'assets/images/icon_card.svg',
            namePayment: state.cardNumberController.text,
            name: state.cardNameController.text,
            number: state.cardNumberController.text,
            expired: state.cardExpiredController.text,
            cvv: state.cardCVVController.text,
          ),
        );
        // Update vao shared
        SharedService.to.setString(MyKey.listPayment, state.premiumPayment);
        // Luu vao DB
        CollectionReference users =
            FirebaseFirestore.instance.collection('users');
        // print(users);
        // print(AppStore.to.userID);
        await users.doc(AppStore.to.userID).update(
          {
            'payment': jsonEncode(state.premiumPayment),
          },
        );
        // Ket thuc
        showSuccessMessage('Add Card Success!');
        Get.offAndToNamed(RouterName.premiumPayment);
      } else {
        closeLoading();
        showErrorMessage('Add Card Error! Please check againt');
      }
      // Them vao firebase
    }
  }

  // Chuyen huong
  goToPayment(int value) {
    state.premiumPlans.value = value;
    Get.toNamed(RouterName.premiumPayment);
  }

  goToPaymentNull() {
    Get.toNamed(RouterName.premiumPayment);
  }

  goToAddCard() {
    Get.toNamed(RouterName.premiumPaymentAddCard);
  }

  goToPaymentSummary() {
    Get.toNamed(RouterName.premiumPaymentSummary);
  }

  goToConfirm() {
    showSuccessPayment();
  }
}
