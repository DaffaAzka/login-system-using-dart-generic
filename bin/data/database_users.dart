
import '../entity/user.dart';
import '../validations/validate.dart';

class DatabaseUser {

  final List<User> _data = [];

  User? getData<T>(T value) {
    User? result;
    if(value is String) {
      for(User user in _data) {
        if(user.username == value) {
          result = user;
          break;
        }
      }
    } else if(value is int) {
      for(User user in _data) {
        if(user.id == value) {
          result = user;
          break;
        }
      }
    }
    return result;
  }

  set data(User value) {
    var user = getData(value.username);
    if(user == null) {
      _data.add(value);
    } else {
      Validates.usernameHasBeenUsed();
    }
  }
}