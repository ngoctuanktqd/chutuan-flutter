import 'package:flutter/material.dart';

class SignUpHeaderPage extends StatelessWidget {
  const SignUpHeaderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(20.0),
        color: Colors.transparent,
        child: Text(
          'Grocery App',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
