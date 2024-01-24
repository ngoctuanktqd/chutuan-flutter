import 'package:flutter/material.dart';
import 'package:shoppinggetx/apps/consts/consts.dart';
import 'package:shoppinggetx/apps/consts/helpers.dart';
import 'package:shoppinggetx/stores/app_store.dart';

class HomeHeaderPage extends StatelessWidget {
  const HomeHeaderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Morning',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              getWidth(context, 0.02),
              Text(
                '${AppStore.to.userInfoUsername} 👋',
                style: Theme.of(context).textTheme.headlineSmall!,
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                height: 45,
                width: 100,
                decoration: const BoxDecoration(
                  color: TuConstColor.color_01,
                  borderRadius: BorderRadius.all(
                    Radius.circular(60),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 30,
                child: Text(
                  '6',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: TuConstColor.accent_01,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 5,
                      color: Colors.white,
                    ),
                  ),
                  child: const Icon(
                    Icons.notifications_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
