import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppinggetx/apps/consts/helpers.dart';
import 'package:shoppinggetx/apps/widgets/button_custom.dart';
import 'package:shoppinggetx/apps/widgets/text_field_custom.dart';
import 'package:shoppinggetx/manager/controllers/checkout_controller.dart';

class CheckoutAddressPage extends StatefulWidget {
  const CheckoutAddressPage({super.key});

  @override
  State<CheckoutAddressPage> createState() => _CheckoutAdressPageState();
}

class _CheckoutAdressPageState extends State<CheckoutAddressPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CheckoutController>();
    return Column(
      children: [
        const Text('Full Name'),
        TextFieldCustom(
          controller: fullNameController,
          prefixIcon: Icons.person_2_rounded,
          hintText: 'Enter Your Full Name!',
        ),
        const Text('Email Address'),
        TextFieldCustom(
          controller: emailController,
          prefixIcon: Icons.email_rounded,
          hintText: 'Enter Your Email!',
        ),
        const Text('Phone'),
        TextFieldCustom(
          controller: phoneController,
          prefixIcon: Icons.phone_rounded,
          hintText: 'Enter Your Phonenumber!',
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                children: [
                  const Text('Zip code'),
                  TextFieldCustom(
                    controller: zipcodeController,
                    showPreicon: false,
                    hintText: 'Zip code',
                  ),
                ],
              ),
            ),
            getWidth(context, 0.03),
            Expanded(
              child: Column(
                children: [
                  const Text('City'),
                  TextFieldCustom(
                    controller: cityController,
                    showPreicon: false,
                    hintText: 'Enter Your City!',
                  ),
                ],
              ),
            ),
          ],
        ),
        const Text('Country'),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          decoration: const BoxDecoration(
            color: Color(0xffE8EFF3),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          width: double.infinity,
          child: DropdownButton(
            // alignment: AlignmentDirectional.bottomEnd,
            hint: const Text('Chosse Your Country'),
            items: <DropdownMenuItem>[
              DropdownMenuItem(
                value: 1,
                child: Text(
                  'Ha noi 1',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              DropdownMenuItem(
                value: 2,
                child: Text(
                  'Ha noi 2',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              DropdownMenuItem(
                value: 3,
                child: Text(
                  'Ha noi 3',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              DropdownMenuItem(
                value: 4,
                child: Text(
                  'Ha noi 4',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              DropdownMenuItem(
                value: 5,
                child: Text(
                  'Ha noi 5',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
            onChanged: (value) {
              print(value);
            },
          ),
        ),
        Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (value) {
                print(value);
              },
            ),
            const Expanded(
              child: Text('Save shipping address'),
            ),
          ],
        ),
        ButtonCustom(
          title: 'NEXT',
          function: () {
            controller.setCurrentStep(2);
          },
        ),
      ],
    );
  }
}
