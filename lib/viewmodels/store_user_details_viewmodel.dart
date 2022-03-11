import 'package:shared_preferences/shared_preferences.dart';

class UserDetailsSharedPreference {
  static late SharedPreferences _sharedPreferences;
  static const String _keyUsername = 'username';
  static const String _keyEmail = 'email';
  static const String _keyAddress = 'address';

  static Future<SharedPreferences> init() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  static Future<bool> saveUsername(String name) async {
    return await _sharedPreferences.setString(_keyUsername, name);
  }

  static String? getUserName() => _sharedPreferences.getString(_keyUsername);

  static Future<bool> saveAddress(String address) async {
    return await _sharedPreferences.setString(_keyAddress, address);
  }

  static String? getAddress() => _sharedPreferences.getString(_keyAddress);

  static Future<bool> saveEmail(String email) async {
    return await _sharedPreferences.setString(_keyEmail, email);
  }

  static String? getEmail() => _sharedPreferences.getString(_keyEmail);
}
