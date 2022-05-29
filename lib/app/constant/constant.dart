import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

// Primary
const Color kPrimaryColor = Color(0xff6EF81F);

// Home
const Color kHomeBottomTabColor = Colors.white;
// Ticket
const Color kTicketMainTextColor = Color(0xff6EF81F);

// Wallet
const Color kWalletKlaytnColor = Color(0xff272B40);
const Color kWalletBackgroundColor = Color(0xff272B40);
const Color kWalletKlayBoxBackgroundColor = Color(0xff141724);
const Color kWalletIconBoxColor = Color(0xff373C58);
const Color kWalletIconTextColor = Color(0xff7D8198);

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
  final formatCurrency =
      NumberFormat.simpleCurrency(locale: "ko_KR", name: "", decimalDigits: 0);
  return formatCurrency.format(price);
}
