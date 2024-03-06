import 'package:flutter/material.dart';

import '../../main.dart';


showLoader() {
  showDialog(
    context: navigatorKey.currentContext!,
    barrierDismissible: false,
    useRootNavigator: true,
    // barrierColor: Colors.black,
    useSafeArea: true,
    builder: (BuildContext context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

hideLoader() {
  Navigator.pop(navigatorKey.currentContext!);
}
