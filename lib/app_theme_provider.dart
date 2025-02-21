import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier{
  bool isDark=false;
  AppThemeProvider();

  void updateTheme(bool value){
    isDark= !isDark;
    isDark= value;
    notifyListeners();
  }

  getTheme(){
    return isDark;
  }
}