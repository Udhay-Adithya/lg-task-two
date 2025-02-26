import 'package:flutter/material.dart';

abstract class ThemeState {
  final ThemeData themeData;
  const ThemeState(this.themeData);
}

class LightThemeState extends ThemeState {
  const LightThemeState(super.themeData);
}

class DarkThemeState extends ThemeState {
  const DarkThemeState(super.themeData);
}
