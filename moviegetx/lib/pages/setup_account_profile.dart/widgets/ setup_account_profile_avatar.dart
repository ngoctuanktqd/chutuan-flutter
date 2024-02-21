// ignore_for_file: must_be_immutable, file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/managers/controllers/setup_account_controller.dart';

class SetupAccountProfileAvatar extends StatelessWidget {
  SetupAccountProfileAvatar({super.key, this.controller});

  SetupAccountController? controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                controller!.state.avatarPath.value,
              ),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
          ),
          width: 140,
          height: 140,
          child: Stack(
            children: [
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: controller!.changeUserAvatar,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    child: Ink(
                      padding: const EdgeInsets.all(2.0),
                      decoration: const BoxDecoration(
                        color: MovieColor.primary_500,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      width: 30,
                      height: 30,
                      child: const Icon(
                        Icons.edit_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
