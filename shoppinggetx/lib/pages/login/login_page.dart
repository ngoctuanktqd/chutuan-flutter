import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/manager/controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff027335),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              color: Colors.transparent,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Grocery App',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Welcome back',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_2_rounded),
                      hintText: 'Enter your username!',
                      fillColor: Color(0xffE8EFF3),
                      filled: true,
                      hoverColor: Color(0xff027335),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    style: TextStyle(
                      backgroundColor: Color(0xffE8EFF3),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_rounded),
                      suffixIcon: Icon(Icons.visibility_rounded),
                      hintText: 'Enter your password!',
                      fillColor: Color(0xffE8EFF3),
                      filled: true,
                      hoverColor: Color(0xff027335),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    style: TextStyle(
                      backgroundColor: Color(0xffE8EFF3),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff027335),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      onPressed: () {
                        controller.goToNavigator();
                      },
                      child: const Text(
                        'SIGN IN',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        activeColor: const Color(0xff027335),
                        value: true,
                        onChanged: (value) {
                          print(value);
                          return;
                        },
                      ),
                      const Expanded(
                        child: Text('Keep Sign In'),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xff027335),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color(0xff027335),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Don’t have an account?',
                      style: TextStyle(
                        color: Color(0xff7D8FAB),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color(0xff027335),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      onPressed: () {
                        controller.goToSignUp();
                      },
                      child: const Text(
                        'CREATE AN ACCOUNT',
                        style: TextStyle(
                          color: Color(0xff027335),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
