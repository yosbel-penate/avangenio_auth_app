import 'package:flutter/foundation.dart';

class UserModel extends ChangeNotifier {
  String username = '';
  String email = '';

  void updateUser(String username, String email) {
    this.username = username;
    this.email = email;
    notifyListeners();
  }

  void clearUser() {
    username = '';
    email = '';
    notifyListeners();
  }
}