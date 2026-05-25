class Web3InjectionScript {
  static const javascript = '''
  window.ethereum = window.ethereum || { isInjected: true, chainId: '0x1' };
  window.solana = window.solana || { isPhantom: false, isInjected: true };
  window.tronWeb = window.tronWeb || { defaultAddress: { base58: '' } };

  window.web3Bridge = {
    requestAccount: function(chain) {
      return window.flutter_inappwebview.callHandler('requestAccount', chain);
    },
    signMessage: function(chain, message) {
      return window.flutter_inappwebview.callHandler('signMessage', chain, message);
    }
  };
  ''';
}
