import 'package:flutter_trust_wallet_core/trust_wallet_core_ffi.dart';
import 'package:get/get.dart';

import 'package:forcewallet/app/database/object_box.dart';
import 'package:forcewallet/app/database/store_model.dart';

class WalletService extends GetxService {
  final RxList<StoredKeyInfo> mStoredKeyInfos = <StoredKeyInfo>[].obs;
  final RxList<StoredWalletInfo> mWalletInfos = <StoredWalletInfo>[].obs;
  final RxMap<int, List<StoredWalletInfo>> mStoredWalletMap =
      <int, List<StoredWalletInfo>>{}.obs;
  final mCurrentWalletId = 0.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> initData() async {
    var keyInfo = await ObjectBox.queryStoredinfos();
    mStoredKeyInfos.addAll(keyInfo);
    var walletInfos = await ObjectBox.queryWallets();
    mWalletInfos.addAll(walletInfos);
    setDefaultCurrentWallet();
    walletInfos.forEach((element) {
      mStoredWalletMap[element.parentId] ??= [];
      mStoredWalletMap[element.parentId]!.add(element);
    });
    var list = await ObjectBox.queryNetworkConfigByCoinType(
        TWCoinType.TWCoinTypeNewChain);
    if (list.isEmpty) {
      await ObjectBox.initNetworkConfig();
    }
  }

  void getAllStoreInfo() {}

  void getAllWalletInfo() {}

  Future<int> addWalletInfo(StoredWalletInfo walletInfo) async {
    var id = await ObjectBox.addWalletInfo(walletInfo);
    mWalletInfos.value.add(walletInfo);
    mStoredWalletMap[walletInfo.parentId] ??= [];
    mStoredWalletMap[walletInfo.parentId]!.add(walletInfo);
    setDefaultCurrentWallet();
    return id;
  }

  Future<int> addStoreInfo(StoredKeyInfo storeInfo) async {
    var id = await ObjectBox.insertStoreKey(storeInfo);
    mStoredKeyInfos.add(storeInfo);
    return id;
  }

  Future<void> clear() async {
    mStoredKeyInfos.clear();
    mWalletInfos.clear();
    mStoredWalletMap.clear();
    setCurrentWalletId(0);
    await ObjectBox.clear();
  }

  void deleteStoreInfo() {}

  void setDefaultCurrentWallet() {
    if (mCurrentWalletId.value == 0 && mWalletInfos.value.isNotEmpty) {
      setCurrentWalletId(mWalletInfos.value[0].parentId);
    }
  }

  void setCurrentWalletId(int id) {
    mCurrentWalletId.value = id;
  }
}
