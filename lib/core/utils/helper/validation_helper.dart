import 'package:flutter/material.dart';

class ValidationHelper {
  static String? isValidEmail(String? email) {
    final bool isValid =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
            .hasMatch(email!);
    if (email == null || email.isEmpty) {
      return 'Please Enter Your Email';
    } else if (!isValid) {
      return 'Please Enter A Valid Email';
    }
    return null;
  }

  // Password validation
  static String? isValidPassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please Enter Your Password';
    } else if (password.trim().length < 8) {
      return 'Password Should Be More Than 8 Characters';
    }
    return null;
  }

  static String? isValidConfirmPassword(
    String? confirmPassword,
    TextEditingController textEditingController,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Confirm Password is required";
    }
    if (confirmPassword != textEditingController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  static String? validateEgyptianPhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }

    // Egyptian mobile number regex
    final RegExp egyptianPhoneRegex = RegExp(r'^(010|011|012|015)[0-9]{8}$');

    if (!egyptianPhoneRegex.hasMatch(value)) {
      return "Enter a valid Egyptian mobile number (e.g. 01012345678)";
    }

    return null;
  }
}
