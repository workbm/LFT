import 'package:flutter/material.dart';

class SeconnecterSinscrireProvider with ChangeNotifier {
  bool _isSeConnecter = true;
  bool get isSeconnecter => _isSeConnecter;

  void seConnecterFct(bool seConnecter) {
    _isSeConnecter = seConnecter;
    notifyListeners();
  }
}
