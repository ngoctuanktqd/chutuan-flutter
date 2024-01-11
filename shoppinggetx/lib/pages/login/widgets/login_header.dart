import 'package:flutter/material.dart';

class LoginHeaderPage extends StatelessWidget {
  const LoginHeaderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
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
