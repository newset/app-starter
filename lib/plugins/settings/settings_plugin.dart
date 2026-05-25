import 'package:get/get.dart';

import '../../core/plugins/app_plugin.dart';

class SettingsPlugin extends AppPlugin {
  @override
  String get id => 'settings';

  @override
  Future<void> onRegister() async {}

  @override
  Future<void> onUnregister() async {}

  @override
  List<GetPage> get routes => [];

  @override
  Map<String, Map<String, String>> get translations => {
        'en_US': {
          'settings.title': 'Settings',
          'settings.theme': 'Toggle Theme',
          'settings.language': 'Switch Language',
        },
        'zh_CN': {
          'settings.title': '设置',
          'settings.theme': '切换主题',
          'settings.language': '切换语言',
        },
      };
}
