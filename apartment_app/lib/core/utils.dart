import 'dart:developer' as dev;

import 'package:apartment_app/core/enums.dart';
import 'package:intl/intl.dart';

void logger(
  String message, {
  LogLevel level = LogLevel.info,
  String name = "log",
}) {
  dev.log(message, level: level.value, name: name);
}

String capitalize(String value) {
  return value
      .split(' ')
      .map((word) {
        return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
      })
      .join(' ');
}

String formattedDate(String date) {
  final parsedDate = DateTime.parse(date).toLocal();

  final formatted = DateFormat('dd MMM yyyy').format(parsedDate);
  return formatted;
}

String formatRent(num amount) {
  final formatter = NumberFormat.currency(
    locale: 'en_IN',
    symbol: '₹',
    decimalDigits: 0,
  );

  return formatter.format(amount);
}

String formatNumber(int number) {
  return number.toString().padLeft(2, "0");
}
