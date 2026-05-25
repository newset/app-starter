import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) => _controller.runJavaScript(Web3InjectionScript.javascript),
        ),
      )
      ..loadRequest(Uri.parse('https://app.uniswap.org'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('browser.title')),
      body: WebViewWidget(controller: _controller),
    );
  }
}
