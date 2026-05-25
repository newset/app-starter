import 'package:get/get.dart';

import '../../plugins/settings/presentation/pages/settings_home_page.dart';

class AppRouter {
  static const initialRoute = '/settings';

  static List<GetPage<dynamic>> buildRoutes(List<dynamic> pluginRoutes) {
    return [
      GetPage(name: '/settings', page: () => const SettingsHomePage()),
      ...pluginRoutes.cast<GetPage<dynamic>>(),
    ];
  }
}
