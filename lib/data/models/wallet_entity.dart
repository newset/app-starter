import 'package:isar/isar.dart';

part 'wallet_entity.g.dart';

@collection
class WalletEntity {
  Id id = Isar.autoIncrement;

  late String name;
  late String chain;
  late String address;
  String? encryptedMnemonic;
}
