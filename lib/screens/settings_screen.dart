import 'package:flutter/material.dart';
import 'package:flutter_todo_v2/controllers/locale_controller.dart';
import 'package:flutter_todo_v2/controllers/theme_controller.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final localeController = Get.find<LocaleController>();

    return Scaffold(
      appBar: AppBar(title: Text('settings'.tr)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'theme'.tr,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            child: Obx(
              () => SwitchListTile(
                title: Text(
                  themeController.isDark.value
                      ? 'dark_mode'.tr
                      : 'light_mode'.tr,
                ),
                subtitle: Text('theme'.tr),
                secondary: Icon(
                  themeController.isDark.value
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined,
                ),
                value: themeController.isDark.value,
                onChanged: (_) => themeController.toggleTheme(),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'language'.tr,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                Obx(
                  () => RadioListTile<String>(
                    title: const Text('English'),
                    value: 'en',
                    groupValue: localeController.locale.value.languageCode,
                    onChanged: (_) => localeController.chanageToEnglish(),
                  ),
                ),
                const Divider(height: 1),
                Obx(
                  () => RadioListTile<String>(
                    title: const Text('العربية'),
                    value: 'ar',
                    groupValue: localeController.locale.value.languageCode,
                    onChanged: (_) => localeController.chanageToArabic(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 48,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'هيثم',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'made_by'.tr,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
