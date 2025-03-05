// ignore_for_file: unnecessary_null_comparison

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
    bool isStrongPassword =
        RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$').hasMatch(
      password!,
    );
    if (password == null || password.isEmpty) {
      return 'Please Enter Your Password';
    } else if (password.trim().length < 8) {
      return 'Password Should Be More Than 8 Characters';
    } else if (!isStrongPassword) {
      return 'Password must contain an uppercase letter, a number, and a special character';
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

    // Ensure the number starts with +20
    if (!value.startsWith("+20")) {
      return "Phone number must start with +20";
    }

    // Remove the "+20" prefix for further validation
    String numberWithoutCode = value.substring(3); // Remove +20

    // Egyptian mobile number regex (must start with 010, 011, 012, or 015 and have 8 more digits)
    final RegExp egyptianPhoneRegex = RegExp(r'^(10|11|12|15)[0-9]{8}$');

    if (!egyptianPhoneRegex.hasMatch(numberWithoutCode)) {
      return "Enter a valid Egyptian mobile number (e.g. +201012345678)";
    }

    return null;
  }
}
