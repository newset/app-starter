import 'package:get/get.dart';

import '../state/global_app_controller.dart';

class WalletService extends GetxService {
  Future<String> createWallet({required String chain}) async {
    // TODO: call multi_chain_wallet SDK real API.
    const mockAddress = '0x1234...abcd';
    Get.find<GlobalAppController>().updateWallet(address: mockAddress, chain: chain);
    return mockAddress;
  }

  Future<void> importWallet({required String mnemonic, required String chain}) async {
    // TODO: call multi_chain_wallet SDK import API.
    Get.find<GlobalAppController>().updateWallet(address: 'imported-address', chain: chain);
  }
}
