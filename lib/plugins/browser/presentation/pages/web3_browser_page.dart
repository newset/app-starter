import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/state/global_app_controller.dart';
import '../../../../core/web3/web3_injection_script.dart';

class Web3BrowserPage extends StatefulWidget {
  const Web3BrowserPage({super.key});

  @override
  State<Web3BrowserPage> createState() => _Web3BrowserPageState();
}

class _Web3BrowserPageState extends State<Web3BrowserPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel('SolanaBridge', onMessageReceived: _handleSolanaBridge)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) => _controller.runJavaScript(Web3InjectionScript.javascript),
        ),
      )
      ..loadRequest(Uri.parse('https://app.uniswap.org'));
  }

  Future<void> _handleSolanaBridge(JavaScriptMessage message) async {
    final request = jsonDecode(message.message) as Map<String, dynamic>;
    final callbackKey = request['callbackKey'] as String;
    final action = request['action'] as String;

    try {
      final response = await _dispatchSolanaAction(action, request);
      await _sendResponse(callbackKey: callbackKey, success: true, data: response);
    } catch (e) {
      await _sendResponse(callbackKey: callbackKey, success: false, error: e.toString());
    }
  }

  Future<Map<String, dynamic>> _dispatchSolanaAction(String action, Map<String, dynamic> req) async {
    final global = Get.find<GlobalAppController>();

    switch (action) {
      case 'connect':
        final publicKey = global.currentWalletAddress.value.isEmpty
            ? 'DemoSolanaPublicKey111111111111111111111111111111'
            : global.currentWalletAddress.value;
        global.updateWallet(address: publicKey, chain: 'solana');
        return {'publicKey': publicKey};
      case 'disconnect':
        return {'ok': true};
      case 'signMessage':
        final msg = req['message'] as String? ?? '';
        final signature = base64Encode(utf8.encode('signed:$msg'));
        return {'signature': signature};
      case 'signTransaction':
        final tx = req['tx'] as String? ?? '';
        final signature = base64Encode(utf8.encode('tx-sign:$tx'));
        return {'signature': signature};
      default:
        throw UnsupportedError('Unsupported Solana action: $action');
    }
  }

  Future<void> _sendResponse({
    required String callbackKey,
    required bool success,
    Map<String, dynamic>? data,
    String? error,
  }) {
    final payload = jsonEncode({
      'success': success,
      'data': data ?? <String, dynamic>{},
      'error': error,
    });

    return _controller.runJavaScript(
      'window["$callbackKey"]($payload);',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('browser.title'.tr)),
      body: WebViewWidget(controller: _controller),
    );
  }
}
