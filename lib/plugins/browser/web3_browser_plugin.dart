import 'package:get/get.dart';

import '../../core/plugins/app_plugin.dart';
import 'presentation/pages/web3_browser_page.dart';

class Web3BrowserPlugin extends AppPlugin {
  @override
  String get id => 'web3_browser';

  @override
  Future<void> onRegister() async {}

  @override
  Future<void> onUnregister() async {}

  @override
  List<GetPage> get routes => [GetPage(name: '/browser', page: () => const Web3BrowserPage())];

  @override
  Map<String, Map<String, String>> get translations => {
        'en_US': {'browser.title': 'Web3 Browser'},
        'zh_CN': {'browser.title': 'Web3 浏览器'},
      };
}
