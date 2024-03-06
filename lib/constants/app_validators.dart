import 'package:flutter/cupertino.dart';

class AppValidators {
  static FormFieldValidator<String> nameValidator = (value) {
    if (value == null || value.isEmpty ) {
      return 'Please fill';
    }
    else if ((value.isNotEmpty) && (value.length < 3)) {
      return 'Username must be at least 3 characters long';
    }
    return null;
  };
}
