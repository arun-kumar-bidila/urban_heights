import 'dart:developer' as dev;

import 'package:apartment_app/core/enums.dart';

void logger(
  String message, {
  LogLevel level = LogLevel.info,
  String name = "log",
}) {
  dev.log(message, level: level.value, name: name);
}
