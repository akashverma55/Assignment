import 'package:flutter/material.dart';

class themeNotifier extends ChangeNotifier{
  bool isDark = false;

  void changeTheme(){
    isDark=!isDark;
    notifyListeners();
  }
}