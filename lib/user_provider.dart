import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  String _selectedUserName = '';

  String get selectedUserName => _selectedUserName;

  void setSelectedUserName(String userName) {
    _selectedUserName = userName;
    notifyListeners();
  }
}
