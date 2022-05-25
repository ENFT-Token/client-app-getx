import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

// Color
const Color kPrimaryColor = Colors.lightGreen;
Color kPrimaryLightColor = Colors.lightGreen.shade400;
const Color kSystemGray = Color(0xff8E8E93);
const Color kSubItemColor = Color(0xffF2F2F2);
const Color kWarningBackgroundColor = Color(0xffFAF7EC);
const Color kWarningTextColor = Color(0xffDDBB5B);
const Color kDisableColor = Colors.grey;
const Color kDisableTextColor = Colors.white;

// Size
const double kDefaultPadding = 16.0;
const double kMatchTitleFontSize = 32.0;
const double kMatchSubTitleFontSize = 18.0;
const double kMatchOptionFontSize = 14.0;

// function
String currencyFormat(int price) {
  final formatCurrency = NumberFormat.simpleCurrency(
      locale: "ko_KR", name: "", decimalDigits: 0);
  return formatCurrency.format(price);
}