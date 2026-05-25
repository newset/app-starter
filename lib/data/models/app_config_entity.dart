import 'package:isar/isar.dart';

part 'app_config_entity.g.dart';

@collection
class AppConfigEntity {
  Id id = Isar.autoIncrement;

  late String key;
  late String value;
}
