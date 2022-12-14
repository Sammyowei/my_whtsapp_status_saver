import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData themeData = ThemeData(
      backgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.green,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey),
      brightness: Brightness.light);
}
