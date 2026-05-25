import 'package:get/get.dart';

class AppTranslations extends Translations {
  AppTranslations(this.pluginKeys);

  final Map<String, Map<String, String>> pluginKeys;

  @override
  Map<String, Map<String, String>> get keys => pluginKeys;
}
