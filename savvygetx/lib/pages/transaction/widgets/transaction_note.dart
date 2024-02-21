import 'package:flutter/material.dart';
import 'package:savvygetx/apps/ultils/functions.dart';
import 'package:svg_flutter/svg.dart';

class TransactionNote extends StatelessWidget {
  const TransactionNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide.none,
          top: BorderSide(width: 1, color: Color(0xFFE8E8E8)),
          right: BorderSide.none,
          bottom: BorderSide.none,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset('assets/images/icon_note.svg'),
          ),
          getWidth(context, 0.02),
          const Text(
            'Note',
            style: TextStyle(
              color: Color(0xFFC1C1C1),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
