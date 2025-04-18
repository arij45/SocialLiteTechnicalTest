import 'package:flutter/material.dart';

class PostProvider with ChangeNotifier {
  String _filter = '';

  String get filter => _filter;

  void setFilter(String value) {
    _filter = value;
    notifyListeners();
  }
}

