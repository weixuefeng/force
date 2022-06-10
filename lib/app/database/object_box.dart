import 'dart:convert';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:forcewallet/app/database/store_model.dart';
import 'package:forcewallet/app/service/wallet_service.dart';
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

  static Future<void> initNetworkConfig() async {
    final store = await openStore();
    var configStore = store.box<NetworkConfig>();
    var json = await DefaultAssetBundle.of(Get.context!)
        .loadString('assets/config/network_config.json');
    print(json);
    var networkConfigs = jsonDecode(json) as List<dynamic>;
    networkConfigs.forEach((element) {
      var networkConfig = NetworkConfig.fromJson(element);
      configStore.put(networkConfig);
    });
    store.close();
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

  static Future<List<StoredKeyInfo>> queryStoredinfos() async {
    final store = await openStore();
    final box = store.box<StoredKeyInfo>();
    final storedKeyInfos = box.getAll();
    store.close();
    return storedKeyInfos;
  }

  static Future<StoredKeyInfo> queryStoredinfo(int id) async {
    final store = await openStore();
    final box = store.box<StoredKeyInfo>();
    final storedKeyInfos = box.get(id);
    store.close();
    return storedKeyInfos!;
  }

  static Future<int> clear() async {
    final store = await openStore();
    final box = store.box<StoredKeyInfo>();
    var int = box.removeAll();
    final box2 = store.box<StoredWalletInfo>();
    var int2 = box2.removeAll();
    store.close();
    return int2;
  }

  /// network config
  static Future<int> addNetworkConfig(NetworkConfig config) async {
    final store = await openStore();
    final box = store.box<NetworkConfig>();
    final netId = box.put(config);
    store.close();
    return netId;
  }

  static Future<List<NetworkConfig>> queryNetworkConfigByCoinType(
      int coinType) async {
    final store = await openStore();
    final box = store.box<NetworkConfig>();
    final networkConfigs =
        box.query(NetworkConfig_.coinType.equals(coinType)).build().find();
    store.close();
    return networkConfigs;
  }
}
