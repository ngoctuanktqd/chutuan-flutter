import 'package:flutter/material.dart';
import 'package:todolist/apps/ultils/consts.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tColorConst.backgroundOnboarding,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.check_circle_rounded,
                            color: Color(0xff95a0fc),
                            size: 36,
                          ),
                        ),
                        getSizeboxWidth(context, 0.03),
                        Expanded(
                          flex: 5,
                          child: Container(
                            height: 15,
                            width: double.maxFinite,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color(0xff95a0fc),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 20,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff7babf7),
                            ),
                          ),
                        ),
                        getSizeboxWidth(context, 0.01),
                        Expanded(
                          flex: 5,
                          child: Container(
                            height: 15,
                            width: double.maxFinite,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color(0xff7babf7),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 20,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffee93a2),
                            ),
                          ),
                        ),
                        getSizeboxWidth(context, 0.01),
                        Expanded(
                          flex: 5,
                          child: Container(
                            height: 15,
                            width: double.maxFinite,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color(0xffee93a2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            getSizeboxHeight(context, 0.04),
            const Text(
              'To-Do List',
              style: TextStyle(
                color: Color(0xfff1f4fb),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
