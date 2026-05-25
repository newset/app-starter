import 'app_plugin.dart';

class PluginManager {
  final List<AppPlugin> _plugins = [];

  void registerAll(List<AppPlugin> plugins) {
    _plugins.addAll(plugins);
  }

  Future<void> bootstrap() async {
    for (final plugin in _plugins) {
      await plugin.onRegister();
    }
  }

  List get routes => _plugins.expand((p) => p.routes).toList();

  Map<String, Map<String, String>> get translations {
    final all = <String, Map<String, String>>{};
    for (final plugin in _plugins) {
      plugin.translations.forEach((locale, map) {
        all.putIfAbsent(locale, () => {});
        all[locale]!.addAll(map);
      });
    }
    return all;
  }
}
