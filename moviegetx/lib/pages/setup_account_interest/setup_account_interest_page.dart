// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/apps/widgets/button_fill_custom.dart';
import 'package:moviegetx/managers/controllers/setup_account_controller.dart';
import 'package:moviegetx/models/genre_model.dart';

class SetupAccountInterestPage extends GetView<SetupAccountController> {
  const SetupAccountInterestPage({super.key});
  @override
  Widget build(BuildContext context) {
    List<GenreModel> listGenres = controller.state.listGenres;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose Your Interest',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  'Choose your interests and get the best movie recommendations. Don\'t worry, you can always change it later.',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              controller.obx(
                onLoading: const Center(
                  child: CircularProgressIndicator(),
                ),
                (state) {
                  List listChoose = controller.state.listGenresChoose;
                  return Wrap(
                    spacing: 8.0, // Khoảng cách giữa các container
                    runSpacing: 8.0, // Khoảng cách giữa các dòng
                    children: List.generate(
                      listGenres.length,
                      (index) {
                        return Material(
                          child: InkWell(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(100),
                            ),
                            onTap: () {
                              controller.setlistGenresChoose(listGenres[index]);
                            },
                            child: Obx(
                              () {
                                int indexChoose = listChoose.indexWhere(
                                    (element) =>
                                        element.id == listGenres[index].id);
                                return Ink(
                                  decoration: BoxDecoration(
                                    color: indexChoose == -1
                                        ? Colors.transparent
                                        : MovieColor.primary_500,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                    border: Border.all(
                                      width: 2,
                                      color: MovieColor.primary_500,
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 24),
                                  child: Text(
                                    listGenres[index].name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: indexChoose != -1
                                              ? Colors.white
                                              : MovieColor.primary_500,
                                        ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              getHeight(context, 0.02),
              Row(
                children: [
                  Expanded(
                    child: ButtonFillCustom(
                      function: controller.goToSkip,
                      gradient: MovieColor.gradientDart,
                      content: 'Skip',
                    ),
                  ),
                  getWidth(context, 0.02),
                  Expanded(
                    child: ButtonFillCustom(
                      function: controller.goToSetupProfile,
                      content: 'Continue',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
