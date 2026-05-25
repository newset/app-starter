import 'package:get/get.dart';

import '../../core/plugins/app_plugin.dart';
import '../../core/wallet/wallet_service.dart';
import 'presentation/pages/wallet_page.dart';

class WalletPlugin extends AppPlugin {
  @override
  String get id => 'wallet';

  @override
  Future<void> onRegister() async {
    Get.put(WalletService(), permanent: true);
  }

  @override
  Future<void> onUnregister() async {}

  @override
  List<GetPage> get routes => [GetPage(name: '/wallet', page: () => const WalletPage())];

  @override
  Map<String, Map<String, String>> get translations => {
        'en_US': {'wallet.title': 'Wallet'},
        'zh_CN': {'wallet.title': '钱包'},
      };
}
