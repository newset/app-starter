import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/theme_controller.dart';

class SettingsHomePage extends StatelessWidget {
  const SettingsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeController>();
    return Scaffold(
      appBar: AppBar(title: Text('settings.title'.tr)),
      body: ListView(
        children: [
          ListTile(title: const Text('Wallet'), onTap: () => Get.toNamed('/wallet')),
          ListTile(title: const Text('IM'), onTap: () => Get.toNamed('/im')),
          ListTile(title: const Text('Web3 Browser'), onTap: () => Get.toNamed('/browser')),
          ListTile(
            title: Text('settings.theme'.tr),
            onTap: controller.toggleTheme,
          ),
          ListTile(
            title: Text('settings.language'.tr),
            onTap: () {
              final next = controller.locale.value.languageCode == 'en'
                  ? const Locale('zh', 'CN')
                  : const Locale('en', 'US');
              controller.changeLocale(next);
            },
          ),
        ],
      ),
    );
  }
}
