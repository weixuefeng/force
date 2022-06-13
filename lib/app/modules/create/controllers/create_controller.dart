import 'dart:ffi';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_trust_wallet_core/flutter_trust_wallet_core.dart';
import 'package:flutter_trust_wallet_core/trust_wallet_core_ffi.dart';
import 'package:get/get.dart';

import 'package:forcewallet/app/database/store_model.dart';
import 'package:forcewallet/app/modules/main/bindings/main_binding.dart';
import 'package:forcewallet/app/modules/main/views/main_view.dart';
import 'package:forcewallet/app/service/wallet_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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

  // create_new_task() async {
  //   EasyLoading.show();
  //   var service = Get.find<WalletService>();
  //   var result = await compute(createWallet, service).then((value) => {
  //     Get.off(() => MainView(), preventDuplicates: false, binding: MainBinding()),
  //     EasyLoading.dismiss()
  //   });
  // }

  void createWallet() async {
  // void createWallet(WalletService service) async {
    // FlutterTrustWalletCore.init();
    var service = Get.find<WalletService>();
    var wallet = HDWallet();
    var storeKey = StoredKey.importHDWallet(
        wallet.mnemonic(), "name", "11111111", TWCoinType.TWCoinTypeNewChain);
    var newAddress = wallet.getAddressForCoin(TWCoinType.TWCoinTypeNewChain);
    var ethAddress = wallet.getAddressForCoin(TWCoinType.TWCoinTypeEthereum);
    var storeKeyInfo = StoredKeyInfo();
    storeKeyInfo.text = storeKey!.exportJson();
    var id = await service.addStoreInfo(storeKeyInfo);
    var newWallet = generateNewAddress(newAddress, id);
    var ethWallet = generateEthAddress(ethAddress, id);
    var newWalletId = await service.addWalletInfo(newWallet);
    var ethWalletId = await service.addWalletInfo(ethWallet);
    Get.off(() => MainView(), preventDuplicates: false, binding: MainBinding());
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
