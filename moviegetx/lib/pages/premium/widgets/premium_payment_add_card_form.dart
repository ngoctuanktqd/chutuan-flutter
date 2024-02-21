// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';
import 'package:moviegetx/apps/widgets/text_field_form_custom.dart';
import 'package:moviegetx/managers/controllers/premium_controller.dart';

class PremiumPaymentAddCardForm extends StatelessWidget {
  const PremiumPaymentAddCardForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PremiumController controller = Get.find<PremiumController>();
    return Form(
      key: controller.state.keyForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Card Name'),
          getHeight(context, 0.02),
          TextFormFieldCustom(
            controller: controller.state.cardNameController,
            hinText: 'Name Card',
            inputType: InputType.name,
          ),
          getHeight(context, 0.03),
          const Text('Card Number'),
          getHeight(context, 0.02),
          TextFormFieldCustom(
            controller: controller.state.cardNumberController,
            hinText: 'Card Number',
            inputType: InputType.phone,
            maxLength: 12,
            minLength: 12,
          ),
          getHeight(context, 0.03),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Expiry Date'),
                    getHeight(context, 0.02),
                    TextFormField(
                      controller: controller.state.cardExpiredController,
                      decoration: InputDecoration(
                        hintText: 'Enter Date (MM-YY)',
                        hintStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: MovieColor.grey_500,
                                ),
                        // Viền
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide.none,
                        ),
                        // Màu nền
                        filled: true,
                        fillColor: MovieColor.dark_2,
                        // Truy cập
                        focusColor: const Color(0xffe2122114).withOpacity(0.08),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: MovieColor.primary_500,
                          ),
                        ),
                        hoverColor: const Color(0xffe2122114).withOpacity(0.08),
                      ),
                      keyboardType: TextInputType.datetime,
                      validator: (value) {
                        // Add your validation logic here
                        if (value == null || value.isEmpty) {
                          return 'Please enter a date.';
                        }
                        // Add additional date validation if needed
                        return null;
                      },
                      onTap: () async {
                        DateTime currentDate = DateTime.now();
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: currentDate,
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2050),
                        );

                        if (selectedDate != null &&
                            selectedDate != currentDate) {
                          // Format the selected date and set it to the text field
                          String formattedDate =
                              '${selectedDate.month.toString().padLeft(2, '0')}/${selectedDate.year.toString().padLeft(2, '0')}';
                          // _dateController.text = formattedDate;
                          controller.state.cardExpiredController.text =
                              formattedDate;
                        }
                      },
                    )
                  ],
                ),
              ),
              getWidth(context, 0.04),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('CVV'),
                    getHeight(context, 0.02),
                    TextFormFieldCustom(
                      controller: controller.state.cardCVVController,
                      hinText: 'cvv',
                      inputType: InputType.phone,
                      maxLength: 3,
                      minLength: 3,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
