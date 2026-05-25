import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/models/app_config_entity.dart';
import '../../data/models/wallet_entity.dart';

class IsarService {
  IsarService._();

  static final IsarService instance = IsarService._();
  Isar? _isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [WalletEntitySchema, AppConfigEntitySchema],
      directory: dir.path,
    );
  }

  Isar get db {
    if (_isar == null) throw StateError('Isar not initialized');
    return _isar!;
  }
}
