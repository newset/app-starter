# Flutter Plugin-based App Starter

A base scaffold for modular Flutter applications.

## Features

- Plugin architecture for dynamic module loading/unloading (routes + i18n + bootstrap)
- Global state with GetX
- Light/Dark theme + locale switching
- i18n via GetX translations
- Multi-chain wallet service integration entry (`multi_chain_wallet`)
- Isar local database with two default collections:
  - `WalletEntity`
  - `AppConfigEntity`
- Tencent Cloud Chat SDK integration entry
- Web3 browser with injected JS providers (`ethereum`, `solana`, `tronWeb`), including Solana `connect/disconnect/signMessage/signTransaction` bridge over WebView JavaScript channel

## Structure

```text
lib/
  core/
    plugins/
    routing/
    state/
    theme/
    storage/
    wallet/
    im/
    web3/
    i18n/
  data/models/
  plugins/
    wallet/
    im/
    browser/
    settings/
```

## Next steps

1. Run `flutter pub get`
2. Run `dart run build_runner build --delete-conflicting-outputs`
3. Replace mock wallet logic with actual `multi_chain_wallet` calls.
4. Fill Tencent IM conversation and chat pages.
5. Bridge JS wallet methods from WebView into Dart channel handlers.
