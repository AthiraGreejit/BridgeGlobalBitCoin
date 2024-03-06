import 'package:flutter/material.dart';

import '../../main.dart';


showSnackBar(String message) {
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(SnackBar(
    content: Text(message, textAlign: TextAlign.start),
  ));
}
