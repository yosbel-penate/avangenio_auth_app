import 'package:flutter_test/flutter_test.dart';
import '../providers/auth_provider.dart';

void main() {
  group('Authentication Tests', () {
    test('Login and Logout', () async {
      AuthProvider authProvider = AuthProvider();

      // Login test
      await authProvider.login('testuser', 'testpassword', 'hellp@um.cp');
      expect(authProvider.isAuthenticated, true);

      // Logout test
      authProvider.logout();
      expect(authProvider.isAuthenticated, false);
    });

    test('Save and Load User from SharedPreferences', () async {
      AuthProvider authProvider = AuthProvider();

      // Save user to SharedPreferences
      await authProvider.saveUserToPrefs();

      // Load user from SharedPreferences
      await authProvider.loadUserFromPrefs();

      expect(authProvider.isAuthenticated, true);
    });

    test('Remove User from SharedPreferences', () async {
      AuthProvider authProvider = AuthProvider();

      // Remove user from SharedPreferences
      await authProvider.removeUserFromPrefs();

      // Load user from SharedPreferences
      await authProvider.loadUserFromPrefs();

      expect(authProvider.isAuthenticated, false);
    });
  });
}
