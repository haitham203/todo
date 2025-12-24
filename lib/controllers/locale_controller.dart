import 'dart:ui';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocaleController extends GetxController {
  final locale = const Locale('en', 'US').obs;
  late Box settingsBox;

  @override
  void onInit() {
    super.onInit();
    settingsBox = Hive.box('settings');
    final saveLang = settingsBox.get('language', defaultValue: 'en');
    locale.value = saveLang == 'ar' ? const Locale('ar', 'SA') : const Locale('en', 'US');
  }

  void chanageToEnglish() {
    _updateLocale(const Locale('en', 'US'), 'en');
  }

  void chanageToArabic() {
    _updateLocale(const Locale('ar', 'SA'), 'ar');
  }

  void _updateLocale(Locale newLocale, String languageCode) {
    locale.value = newLocale;
    settingsBox.put('language', languageCode);
    Get.updateLocale(newLocale);
  }

  bool get isArabic => locale.value.languageCode == 'ar';
}
