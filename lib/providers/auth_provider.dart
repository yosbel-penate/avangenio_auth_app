import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  final UserModel _user = UserModel();
  bool _isAuthenticated = false;

  UserModel get user => _user;
  bool get isAuthenticated => _isAuthenticated;

  Future<void> login(String username, String password, String email) async {
    // Aquí deberías realizar la autenticación, por ejemplo, con un servicio API
    // En este ejemplo, simplemente asumimos que el inicio de sesión es exitoso
    if(username == 'corso' && password == '123'){
      // Simulamos la autenticación exitosa
      _user.updateUser(username, email);
      _isAuthenticated = true;
    }

    // Guardamos la información del usuario en SharedPreferences
    await saveUserToPrefs();

    notifyListeners();
  }

  void logout() {
    _user.clearUser();
    _isAuthenticated = false;

    removeUserFromPrefs();
    notifyListeners();
  }

  Future<void> saveUserToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _user.username);
    prefs.setString('email', _user.email);
  }

  Future<void> loadUserFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _user.updateUser(prefs.getString('username') ?? '', prefs.getString('email') ?? '');
    _isAuthenticated = prefs.getString('username') != null;
    notifyListeners();
  }

  Future<void> removeUserFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
    prefs.remove('email');
  }
}
