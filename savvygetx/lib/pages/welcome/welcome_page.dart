import 'package:flutter/material.dart';
import 'package:savvygetx/apps/ultils/consts.dart';
import 'package:savvygetx/apps/ultils/functions.dart';

class WelComePage extends StatelessWidget {
  const WelComePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE9CA),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 96.0),
            child: Text(
              'Welcome to Savvy',
              style: SavvyConst.helperHeaderSmall.copyWith(
                color: const Color(0xFFFFA64F),
              ),
            ),
          ),
          getHeight(context, 0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Text(
              'Let’s get your finances in order',
              style: SavvyConst.largeTitleBold.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 36.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          getHeight(context, 0.02),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: AspectRatio(
                  aspectRatio: 1 / 1.2,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 110, horizontal: 56),
                    decoration: const ShapeDecoration(
                      color: Color(0xFFFFD203),
                      shape: OvalBorder(),
                    ),
                    child: Image.asset(
                      'assets/images/wellcome_egg.png',
                      width: 200,
                      height: 140,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 26),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(52),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Continue',
                            style: SavvyConst.title3Bold
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          getHeight(context, 0.02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 26),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(52),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Continue Anonymous',
                        style: SavvyConst.title3Bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          getHeight(context, 0.03),
          const Text(
            'ALREADY A MEMBER?',
            style: SavvyConst.caption1Medium,
          ),
        ],
      ),
    );
  }
}
