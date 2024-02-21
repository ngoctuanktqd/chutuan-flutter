import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moviegetx/apps/ultills/consts.dart';
import 'package:moviegetx/apps/ultills/helpers.dart';

class MyListEmpty extends StatelessWidget {
  const MyListEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(48.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/icon_empty.svg'),
          getHeight(context, 0.05),
          Text(
            'Your List is Empty',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: MovieColor.primary_500,
                ),
          ),
          getHeight(context, 0.03),
          Text(
            'It seems that you haven\'t added any movies to the list',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
