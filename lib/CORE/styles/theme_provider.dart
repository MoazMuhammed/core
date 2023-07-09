import 'package:core/CORE/shared_preferences/my_shared.dart';
import 'package:core/CORE/shared_preferences/my_shared_keys.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  int currentTheme = 0;

  ThemeMode get themeMode {
    if (currentTheme == 1) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  changeTheme(int theme) {
    MyShared.putInt(key: MySharedKeys.theme, value: theme);
    currentTheme = theme;
    notifyListeners();
  }

  initialize()async{
    currentTheme =  MyShared.getInt(key: MySharedKeys.theme);
    notifyListeners();
  }
}
