import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  List<dynamic> _systems = [];

  List<dynamic> get getSystems {
    return _systems;
  }

  void setSystems(List<dynamic> systems) {
    _systems = systems;
    notifyListeners();
  }
}
