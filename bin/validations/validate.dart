
class ValidationException implements Exception {
  String message;
  ValidationException(this.message);
}

class Validates {

//  Function to validate whether the username has been used or not.
  static void usernameHasBeenUsed() {
    throw ValidationException("Username has been used!");
  }

//  Function to validate username, id, and password.
  static void usernameAndPasswordIsEmpty<T>(T t1, String s2) {

    if(t1 is String) {
      if(t1 == "") {
        throw ValidationException("Username cannot be empty!");
      }
    } else if(t1 is int) {
      if(t1.isNegative) {
        throw ValidationException("Id cannot be negative!");
      }
    }
    if (s2.length <= (1 - 8) || s2 == "") {
      throw ValidationException("Password must be at least 8 characters!");
    }

  }

}