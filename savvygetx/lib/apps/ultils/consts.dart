import 'package:flutter/material.dart';

class SavvyConst {
  static const regularFont = FontWeight.w400;
  static const mediumFont = FontWeight.w500;
  static const boldFont = FontWeight.w600;
  static const largeFont = FontWeight.w900;
  // Caption1
  static const caption1Regular = TextStyle(
    fontSize: 12,
    fontWeight: regularFont,
  );
  static const caption1Medium = TextStyle(
    fontSize: 12,
    fontWeight: mediumFont,
  );
  static const caption1Bold = TextStyle(
    fontSize: 12,
    fontWeight: boldFont,
  );
  // Caption2
  static const caption2Regular = TextStyle(
    fontSize: 11,
    fontWeight: regularFont,
  );
  static const caption2Medium = TextStyle(
    fontSize: 11,
    fontWeight: mediumFont,
  );
  static const caption2Bold = TextStyle(
    fontSize: 11,
    fontWeight: boldFont,
  );
  // footnote
  static const footnoteRegular = TextStyle(
    fontSize: 13,
    fontWeight: regularFont,
  );
  static const footnoteBold = TextStyle(
    fontSize: 13,
    fontWeight: mediumFont,
  );
  // Subheadline
  static const subheadlineRegular = TextStyle(
    fontSize: 15,
    fontWeight: regularFont,
  );
  static const subheadlineBold = TextStyle(
    fontSize: 15,
    fontWeight: boldFont,
  );
  // Callout
  static const calloutRegular = TextStyle(
    fontSize: 16,
    fontWeight: regularFont,
  );
  static const calloutBold = TextStyle(
    fontSize: 16,
    fontWeight: boldFont,
  );
  // Boydy
  static const bodyRegular = TextStyle(
    fontSize: 16,
    fontWeight: regularFont,
  );
  static const bodyBold = TextStyle(
    fontSize: 16,
    fontWeight: boldFont,
  );
  // Headline
  static const headlineRegular = TextStyle(
    fontSize: 17,
    fontWeight: regularFont,
  );
  static const headlineBold = TextStyle(
    fontSize: 17,
    fontWeight: boldFont,
  );
  // title3
  static const title3Regular = TextStyle(
    fontSize: 20,
    fontWeight: regularFont,
  );
  static const title3Bold = TextStyle(
    fontSize: 20,
    fontWeight: boldFont,
  );
  // title2
  static const title2Regular = TextStyle(
    fontSize: 22,
    fontWeight: regularFont,
  );
  static const title2Bold = TextStyle(
    fontSize: 22,
    fontWeight: boldFont,
  );
  // title1
  static const title1Regular = TextStyle(
    fontSize: 28,
    fontWeight: regularFont,
  );
  static const title1Bold = TextStyle(
    fontSize: 28,
    fontWeight: boldFont,
  );
  // largeTitle
  static const largeTitleRegular = TextStyle(
    fontSize: 34,
    fontWeight: regularFont,
  );
  static const largeTitleBold = TextStyle(
    fontSize: 34,
    fontWeight: boldFont,
  );
  // helperHeader
  static const helperHeaderLarge = TextStyle(
    fontSize: 40,
    fontWeight: largeFont,
  );
  static const helperHeaderSmall = TextStyle(
    fontSize: 24,
    fontWeight: boldFont,
  );
  // helperLable
  static const helperLableLarge = TextStyle(
    fontSize: 18,
    fontWeight: boldFont,
  );
  static const helperLableSmall = TextStyle(
    fontSize: 14,
    fontWeight: regularFont,
  );
}

enum typeTransaction {
  income,
  expenses,
  tranfer,
}
