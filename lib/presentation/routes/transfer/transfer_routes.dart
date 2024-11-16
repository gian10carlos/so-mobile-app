import 'package:flutter/material.dart';
import 'package:so_mobile_app/presentation/screens/__screens__.dart';
import 'package:so_mobile_app/presentation/screens/transfer/amount_message_screen.dart';
import 'package:so_mobile_app/presentation/screens/voucher/voucher_screen.dart';

final Map<String, WidgetBuilder> TransferRouteMap = {
  '/transfer': (context) => const TransferScreen(),
  '/amountmessage': (context) => const AmountMessageScreen(),
  '/voucher': (context) => const VoucherScreen(),
};
