import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final Rx<ThemeMode> themeMode = ThemeMode.system.obs;
  final Rx<Locale> locale = const Locale('en', 'US').obs;

  void toggleTheme() {
    themeMode.value = themeMode.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
  }

  void changeLocale(Locale nextLocale) {
    locale.value = nextLocale;
  }
}
