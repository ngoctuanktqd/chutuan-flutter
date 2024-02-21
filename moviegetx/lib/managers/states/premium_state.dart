import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PremiumState {
  late RxInt premiumPlans;
  late RxList premiumPlansList;
  late RxList premiumPayment;
  late RxString currentPayment;
  late TextEditingController cardNameController;
  late TextEditingController cardNumberController;
  late TextEditingController cardExpiredController;
  late TextEditingController cardCVVController;
  late GlobalKey<FormState> keyForm;
}
