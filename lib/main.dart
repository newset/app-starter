import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/i18n/app_translations.dart';
import 'core/plugins/plugin_manager.dart';
import 'core/routing/app_router.dart';
import 'core/state/global_app_controller.dart';
import 'core/storage/isar_service.dart';
import 'core/theme/theme_controller.dart';
import 'plugins/browser/web3_browser_plugin.dart';
import 'plugins/im/im_plugin.dart';
import 'plugins/settings/settings_plugin.dart';
import 'plugins/wallet/wallet_plugin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await IsarService.instance.init();

  Get.put(GlobalAppController(), permanent: true);
  Get.put(ThemeController(), permanent: true);

  final pluginManager = PluginManager();
  pluginManager.registerAll([
    WalletPlugin(),
    IMPlugin(),
    Web3BrowserPlugin(),
    SettingsPlugin(),
  ]);
  await pluginManager.bootstrap();
  Get.put(pluginManager, permanent: true);

  runApp(const StarterApp());
}

class StarterApp extends StatelessWidget {
  const StarterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final pluginManager = Get.find<PluginManager>();

    return Obx(
      () => GetMaterialApp(
        title: 'App Starter',
        debugShowCheckedModeBanner: false,
        translations: AppTranslations(pluginManager.translations),
        locale: themeController.locale.value,
        fallbackLocale: const Locale('en', 'US'),
        themeMode: themeController.themeMode.value,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        initialRoute: AppRouter.initialRoute,
        getPages: AppRouter.buildRoutes(pluginManager.routes),
      ),
    );
  }
}
