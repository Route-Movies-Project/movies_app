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
}
