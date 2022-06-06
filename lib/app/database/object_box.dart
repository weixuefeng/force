import 'package:forcewallet/app/database/store_model.dart';
import 'package:forcewallet/objectbox.g.dart';

class ObjectBox {
  late final Store store;

  ObjectBox._create(this.store) {
    // Add any additional setup code, e.g. build queries.
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore();
    return ObjectBox._create(store);
  }

  static Future<int> insertStoreKey(StoredKeyInfo info) async {
    final store = await openStore();
    final box = store.box<StoredKeyInfo>();
    final storeKey = box.put(info);
    store.close();
    return storeKey;
  }

  static Future<bool> deleteStoreKey(StoredKeyInfo info) async {
    final store = await openStore();
    final box = store.box<StoredKeyInfo>();
    final bool = box.remove(info.id);
    store.close();
    return bool;
  }

  static Future<int> updateStoreKey(StoredKeyInfo info) async {
    final store = await openStore();
    final box = store.box<StoredKeyInfo>();
    final storeKey = box.put(info);
    store.close();
    return storeKey;
  }

  static Future<int> addWalletInfo(StoredWalletInfo info) async {
    final store = await openStore();
    final box = store.box<StoredWalletInfo>();
    final storeKey = box.put(info);
    store.close();
    return storeKey;
  }

  static Future<List<StoredWalletInfo>> queryWallets() async {
    final store = await openStore();
    final box = store.box<StoredWalletInfo>();
    final storeWalletInfos = box.getAll();
    store.close();
    return storeWalletInfos;
  }
}
