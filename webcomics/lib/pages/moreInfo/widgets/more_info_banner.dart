import 'package:flutter/material.dart';

class MoreInfoBannerPage extends StatelessWidget {
  const MoreInfoBannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            child: Image.asset(
              'assets/images/invite_friend.jpg',
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              'assets/images/invite_friend.jpg',
              height: 60,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
