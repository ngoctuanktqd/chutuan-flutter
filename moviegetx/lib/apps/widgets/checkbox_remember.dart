import 'package:flutter/material.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';

class CheckboxRemmember extends StatelessWidget {
  const CheckboxRemmember({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: true,
          onChanged: (value) {
            // print(value);
          },
          activeColor: Colors.green, // Color of the checkmark when checked
          fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              // Color of the checkbox when not checked
              if (states.contains(MaterialState.selected)) {
                return MovieColor.primary_500; // Color when checked
              }
              return Colors.transparent; // Color when not checked
            },
          ),
          side: const BorderSide(
            color: MovieColor.primary_500,
            width: 2,
          ),
        ),
        getWidth(context, 0.02),
        Text(
          'Remember me',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
