// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/managers/controllers/profile_controller.dart';

class ProfilePremium extends StatelessWidget {
  ProfilePremium({
    super.key,
    required this.controller,
  });
  ProfileController controller;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: controller.goToPremium,
        borderRadius: const BorderRadius.all(
          Radius.circular(32),
        ),
        child: Ink(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: MovieColor.primary_500,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(32),
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/images/premium.png',
                width: 50,
                height: 44,
              ),
              getWidth(context, 0.01),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Join Premium!',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: MovieColor.primary_500,
                              ),
                    ),
                    getHeight(context, 0.01),
                    Wrap(
                      children: [
                        Text(
                          'Enjoy watching Full-HD movies, without restrictions and without ads',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              getWidth(context, 0.01),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: MovieColor.primary_500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
