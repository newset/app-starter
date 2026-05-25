import 'package:get/get.dart';

class GlobalAppController extends GetxController {
  final RxString currentWalletAddress = ''.obs;
  final RxString currentChain = 'ethereum'.obs;
  final RxBool loggedInIM = false.obs;

  void updateWallet({required String address, required String chain}) {
    currentWalletAddress.value = address;
    currentChain.value = chain;
  }
}
