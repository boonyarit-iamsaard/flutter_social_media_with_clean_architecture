import 'package:flutter/material.dart';

class SocialMediaAppTheme {
  ThemeData theme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black87,
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.white),
        titleSmall: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}
