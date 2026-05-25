import 'package:get/get.dart';

abstract class AppPlugin {
  String get id;

  List<GetPage<dynamic>> get routes;

  Map<String, Map<String, String>> get translations;

  Future<void> onRegister();

  Future<void> onUnregister();
}
