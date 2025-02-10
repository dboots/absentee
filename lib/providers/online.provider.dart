import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnlineStatusProvider with ChangeNotifier {
  bool _isOnline = true;
  final String _key = 'online_status';
  
  OnlineStatusProvider() {
    _loadStatus();
  }

  bool get isOnline => _isOnline;

  Future<void> _loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isOnline = prefs.getBool(_key) ?? true;
    notifyListeners();
  }

  Future<void> toggleStatus() async {
    _isOnline = !_isOnline;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, _isOnline);
    notifyListeners();
  }
}