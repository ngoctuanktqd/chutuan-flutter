import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionState {
  late RxDouble money;
  late TextEditingController valueController;
  late GlobalKey<FormState> formKey;
  late RxInt type;
}
