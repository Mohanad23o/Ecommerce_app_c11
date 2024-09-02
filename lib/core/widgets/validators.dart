class AppValidators {
  AppValidators._();

  static String? validateEmail({required String? val}) {
    if (val == null || val.trim().isEmpty) {
      return 'Please Fill This Field';
    }
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(val);
    if (!emailValid) {
      return 'Please Enter A Valid Email';
    }
    return null;
  }

  static String? validatePassword({required String? val, required int length}) {
    if (val == null || val.trim().isEmpty) {
      return 'Please Fill This Field.';
    }
    if (val.length < length) {
      return 'Password Should Be More Than $length Characters.'; // Add return statement
    }
    return null;
  }

  static String? validateUserName({required String? val}) {
    if (val == null || val.trim().isEmpty) {
      return 'Please Fill This Field.';
    }

    final bool userNameValidate = RegExp(r'^[\w\s]{3,}$').hasMatch(val);

    if (!userNameValidate) {
      return "Invalid Username. Make sure that the username contains at least 3 characters and does not contain special characters like !, -, @, #, etc.";
    }

    return null;
  }

  static String? validatePhoneNum({required String? val}) {
    if (val == null || val.trim().isEmpty) {
      return 'Please Fill This Field.';
    }
    final bool phoneNumValidate = RegExp(r'^01[0125][0-9]{8}$').hasMatch(val);
    if (val.length > 11) {
      return 'Enter A Valid phone Number From 11 Digits.';
    }
    if (!phoneNumValidate) {
      return 'Enter A Valid phone Number.';
    }
    return null;
  }

  static String? validateConfirmPassword(
      {required String? val, required String? password}) {
    if (val == null || val.trim().isEmpty) {
      return 'Please Fill This Field.';
    }
    if (val != password) {
      return "Password Doesn't Match.";
    }
    return null;
  }
}
