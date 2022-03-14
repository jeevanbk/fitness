import 'package:flutter/material.dart';

/// If dark is null then by default the light value will be returned
extension ThemeData<T> on BuildContext {
  T themeValue({required T light, T? dark}) {
    return Theme.of(this).brightness == Brightness.light
        ? light
        : dark ?? light;
  }
}
