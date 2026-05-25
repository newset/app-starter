import 'package:get/get.dart';

import '../../core/im/im_service.dart';
import '../../core/plugins/app_plugin.dart';
import 'presentation/pages/im_page.dart';

class IMPlugin extends AppPlugin {
  @override
  String get id => 'im';

  @override
  Future<void> onRegister() async {
    Get.put(IMService(), permanent: true);
  }

  @override
  Future<void> onUnregister() async {}

  @override
  List<GetPage> get routes => [GetPage(name: '/im', page: () => const IMPage())];

  @override
  Map<String, Map<String, String>> get translations => {
        'en_US': {'im.title': 'IM'},
        'zh_CN': {'im.title': '即时通信'},
      };
}
