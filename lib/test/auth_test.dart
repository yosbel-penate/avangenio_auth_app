import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import '../providers/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mockito/mockito.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Authentication Tests', () {
    test('Login and Logout', () async {
      AuthProvider authProvider = AuthProvider();
      //crear una instance de SharedPreferences para test
      final mockPrefs = MockSharedPreferences();
      SharedPreferences.setMockInitialValues({});
      // Login test
      await authProvider.login('corso', '123', 'hellp@um.cp');
      expect(authProvider.isAuthenticated, true);

      // Logout test
      authProvider.logout();
      expect(authProvider.isAuthenticated, false);
    });

    test('Save and Load User from SharedPreferences', () async {
      AuthProvider authProvider = AuthProvider();
      //crear una instance de SharedPreferences para test
      final mockPrefs = MockSharedPreferences();
      SharedPreferences.setMockInitialValues({});
      // Save user to SharedPreferences
      await authProvider.saveUserToPrefs();

      // Load user from SharedPreferences
      await authProvider.loadUserFromPrefs();

      expect(authProvider.isAuthenticated, true);
    });

    test('Remove User from SharedPreferences', () async {
      AuthProvider authProvider = AuthProvider();
      //crear una instance de SharedPreferences para test
      final mockPrefs = MockSharedPreferences();
      SharedPreferences.setMockInitialValues({});
      // Remove user from SharedPreferences
      await authProvider.removeUserFromPrefs();

      // Load user from SharedPreferences
      await authProvider.loadUserFromPrefs();

      expect(authProvider.isAuthenticated, false);
    });
  });
}
