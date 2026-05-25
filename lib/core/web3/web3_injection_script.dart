class Web3InjectionScript {
  static const javascript = '''
(function() {
  if (window.__solanaInjected) return;
  window.__solanaInjected = true;

  const post = (payload) => {
    if (!window.SolanaBridge || !window.SolanaBridge.postMessage) {
      throw new Error('SolanaBridge channel not found');
    }
    return new Promise((resolve, reject) => {
      const requestId = `sol_${Date.now()}_${Math.random().toString(16).slice(2)}`;
      const callbackKey = `__solana_cb_${requestId}`;

      window[callbackKey] = (response) => {
        try {
          const parsed = typeof response === 'string' ? JSON.parse(response) : response;
          if (parsed.success) {
            resolve(parsed.data);
          } else {
            reject(new Error(parsed.error || 'Unknown Solana error'));
          }
        } finally {
          delete window[callbackKey];
        }
      };

      window.SolanaBridge.postMessage(JSON.stringify({ ...payload, requestId, callbackKey }));
    });
  };

  const provider = {
    isPhantom: false,
    isConnected: false,
    publicKey: null,

    connect: async function() {
      const result = await post({ action: 'connect' });
      this.publicKey = result.publicKey;
      this.isConnected = true;
      window.dispatchEvent(new Event('solana#connect'));
      return { publicKey: result.publicKey };
    },

    disconnect: async function() {
      await post({ action: 'disconnect' });
      this.publicKey = null;
      this.isConnected = false;
      window.dispatchEvent(new Event('solana#disconnect'));
    },

    signMessage: async function(message) {
      const encoded = typeof message === 'string' ? message : btoa(String.fromCharCode(...new Uint8Array(message)));
      return post({ action: 'signMessage', message: encoded });
    },

    signTransaction: async function(serializedTxBase64) {
      return post({ action: 'signTransaction', tx: serializedTxBase64 });
    }
  };

  window.solana = provider;
  window.ethereum = window.ethereum || { isInjected: true, chainId: '0x1' };
  window.tronWeb = window.tronWeb || { defaultAddress: { base58: '' } };
})();
  ''';
}
