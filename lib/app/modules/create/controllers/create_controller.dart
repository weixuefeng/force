import 'dart:ffi';

import 'package:flutter_trust_wallet_core/flutter_trust_wallet_core.dart';
import 'package:flutter_trust_wallet_core/trust_wallet_core_ffi.dart';
import 'package:forcewallet/app/modules/main/views/main_view.dart';
import 'package:get/get.dart';

import 'package:forcewallet/app/database/object_box.dart';
import 'package:forcewallet/app/database/store_model.dart';

class CreateController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void createWallet() async {
    var wallet = HDWallet();
    var storeKey = StoredKey.importHDWallet(
        wallet.mnemonic(), "name", "11111111", TWCoinType.TWCoinTypeNewChain);
    var newAddress = wallet.getAddressForCoin(TWCoinType.TWCoinTypeNewChain);
    var ethAddress = wallet.getAddressForCoin(TWCoinType.TWCoinTypeEthereum);
    var storeKeyInfo = StoredKeyInfo();
    storeKeyInfo.text = storeKey!.exportJson();

    var id = await ObjectBox.insertStoreKey(storeKeyInfo);

    var newWallet = generateNewAddress(newAddress, id);
    var ethWallet = generateEthAddress(ethAddress, id);
    ObjectBox.addWalletInfo(newWallet);
    ObjectBox.addWalletInfo(ethWallet);
    Get.off(() => MainView(), preventDuplicates: false);
  }

  StoredWalletInfo generateNewAddress(String hexAddress, int id) {
    StoredWalletInfo newWalletInfo = StoredWalletInfo();
    newWalletInfo.coinType = TWCoinType.TWCoinTypeNewChain;
    newWalletInfo.showAddress = hexAddress;
    newWalletInfo.parentId = id;
    newWalletInfo.originAddress = hexAddress;
    newWalletInfo.balance = "0";
    newWalletInfo.isContract = false;
    newWalletInfo.contractAddress = "";
    return newWalletInfo;
  }

  StoredWalletInfo generateEthAddress(String hexAddress, int id) {
    StoredWalletInfo ethWalletInfo = StoredWalletInfo();
    ethWalletInfo.coinType = TWCoinType.TWCoinTypeEthereum;
    ethWalletInfo.showAddress = hexAddress;
    ethWalletInfo.parentId = id;
    ethWalletInfo.originAddress = hexAddress;
    ethWalletInfo.balance = "0";
    ethWalletInfo.isContract = false;
    ethWalletInfo.contractAddress = "";
    return ethWalletInfo;
  }
}
