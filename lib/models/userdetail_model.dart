import 'package:flutter/material.dart';

import '../viewmodels/store_user_details_viewmodel.dart';

class UserDetails extends ChangeNotifier {
  String _username = UserDetailsSharedPreference.getUserName() ?? '';
  String _email = UserDetailsSharedPreference.getEmail() ?? '';
  String _address = UserDetailsSharedPreference.getAddress() ?? '';

  void setUsername(name) {
    _username = name;
    notifyListeners();
  }

  void setEmail(email) {
    _email = email;
    notifyListeners();
  }

  void setAddress(address) {
    _address = address;
    notifyListeners();
  }

  String getUsername() => _username;
  String getEmail() => _email;
  String getAddress() => _address;
}
