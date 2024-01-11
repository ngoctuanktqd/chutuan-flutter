import 'package:flutter/material.dart';
import 'package:shoppinggetx/apps/consts/consts.dart';
import 'package:shoppinggetx/apps/consts/helpers.dart';

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
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 14,
                    ),
              ),
              getWidth(context, 0.02),
              Text(
                'Louis A. 👋',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
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
              const Positioned(
                top: 10,
                left: 30,
                child: Text(
                  '6',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: TuConstColor.color_02,
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
