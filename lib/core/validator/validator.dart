class Validator {
  static String? validateName(value) {
    if (value.isEmpty) {
      return 'Enter Name';
    } else {
      return null;
    }
  }

  static String? validateAddress(value) {
    if (value.isEmpty) {
      return 'Enter Address';
    } else {
      return null;
    }
  }

  static String? validatePhone(value) {
    var pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Enter Phone';
    } else if (!regExp.hasMatch(pattern)) {
      return 'Phone Must be digits';
    } else {
      return null;
    }
  }

  static String? validateEmail(value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Enter Email';
    } else if (!regExp.hasMatch(value.toString().trim())) {
      return 'Invalid Email';
    } else {
      return null;
    }
  }

  static String? validatePassword(value) {
    if (value.isEmpty) {
      return 'Enter Passsword';
    } else if (value.length < 6) {
      return 'Password must be more than 6';
    } else {
      return null;
    }
  }

  static String? validateEmpty(value) {
    if (value.isEmpty) {
      return "It Can't be empty";
    } else {
      return null;
    }
  }
}
