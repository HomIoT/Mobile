import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  List<dynamic> _systems = [];
  bool _authenticated = false;
  String _token = "";

  List<dynamic> get getSystems {
    return _systems;
  }

  bool get getAuthenticated {
    return _authenticated;
  }

  String get getToken {
    return _token;
  }

  void logout() {
    _authenticated = false;
    _token = "";

    notifyListeners();
  }

  void setSystems(List<dynamic> systems) {
    _systems = systems;
    notifyListeners();
  }

  void setAuthenticated(bool authenticated) {
    _authenticated = authenticated;
    notifyListeners();
  }

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }
}
