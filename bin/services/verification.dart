
import '../data/database_users.dart';
import '../entity/user.dart';
import '../validations/validate.dart';
import 'dart:math';

class Verification {
  static String myID = "";
  static DatabaseUser db = DatabaseUser();
  Random random = Random();

  bool signUp(String username, String password) {
    try {
      Validates.usernameAndPasswordIsEmpty(username, password);
      var randomID = random.nextInt(10000);
      db.data = User(randomID, username, password);
      print("Success Create User By Id $randomID and ${db.getData(username)}");
      return true;
    } on ValidationException catch(e) {
      print(e.message);
      return false;
    }
  }

  bool signIn<T>(T username, String password) {
    try {
      Validates.usernameAndPasswordIsEmpty(username, password.toString());
      var data = db.getData(username);
      if (data?.password == password) {
        print("Welcome back ${data?.username}");
        return true;
      }
      return false;
    } on ValidationException catch(e) {
      print(e.message);
      return false;
    }

  }
}