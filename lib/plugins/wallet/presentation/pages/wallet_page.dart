import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/state/global_app_controller.dart';
import '../../../../core/wallet/wallet_service.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final walletService = Get.find<WalletService>();
    final global = Get.find<GlobalAppController>();

    return Scaffold(
      appBar: AppBar(title: Text('wallet.title'.tr)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () => walletService.createWallet(chain: 'ethereum'),
              child: const Text('Create Wallet'),
            ),
            ElevatedButton(
              onPressed: () => walletService.importWallet(mnemonic: 'sample mnemonic', chain: 'solana'),
              child: const Text('Import Wallet'),
            ),
            const SizedBox(height: 12),
            Obx(() => Text('Current: ${global.currentChain.value} - ${global.currentWalletAddress.value}')),
          ],
        ),
      ),
    );
  }
}
