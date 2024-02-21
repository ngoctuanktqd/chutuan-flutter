import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/models/genre_model.dart';

class SetupAccountState {
  late RxList<GenreModel> listGenres = <GenreModel>[].obs;
  late RxList<GenreModel> listGenresChoose = <GenreModel>[].obs;
  late RxString avatarPath = ''.obs;
  late RxInt gender = 0.obs;
  late TextEditingController fullNameController;
  late TextEditingController nickNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late GlobalKey<FormState> keyForm;
}
