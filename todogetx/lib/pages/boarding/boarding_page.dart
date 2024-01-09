import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todogetx/apps/untils/const.dart';
import 'package:todogetx/manager/controllers/boarding_controller.dart';

class BoardingPage extends GetView<BoardingController> {
  const BoardingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TuConstantColor.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              width: 160,
              height: 160,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          color: Color(0xff979ffd),
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 24,
                          decoration: const BoxDecoration(
                            color: Color(0xff979ffd),
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          color: Color(0xff7cabf0),
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 24,
                          decoration: const BoxDecoration(
                            color: Color(0xff7cabf0),
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          color: Color(0xffef92a4),
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 24,
                          decoration: const BoxDecoration(
                            color: Color(0xffef92a4),
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            getHeight(context, 0.1),
            const Text(
              'TO DO LIST',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            getHeight(context, 0.05),
            ElevatedButton(
              onPressed: () {
                controller.goToNavigatorBottom();
              },
              child: const Text('Getting Start!'),
            ),
          ],
        ),
      ),
    );
  }
}
