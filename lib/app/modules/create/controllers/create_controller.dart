import 'package:flutter/foundation.dart';
import 'package:flutter_trust_wallet_core/flutter_trust_wallet_core.dart';
import 'package:flutter_trust_wallet_core/trust_wallet_core_ffi.dart';
import 'package:forcewallet/app/model/storekey_model.dart';
import 'package:get/get.dart';

import 'package:forcewallet/app/database/store_model.dart';
import 'package:forcewallet/app/modules/main/bindings/main_binding.dart';
import 'package:forcewallet/app/modules/main/views/main_view.dart';
import 'package:forcewallet/app/service/wallet_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CreateController extends GetxController {
  var name = "".obs;
  var password = "".obs;
  var confirmPassword = "".obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    everAll(
        [isLoading],
        (callback) => {
              print(isLoading.value.toString()),
              if (isLoading == true)
                {EasyLoading.show()}
              else
                {EasyLoading.dismiss()}
            });
  }

  @override
  void onClose() {
    isLoading(false);
  }

  createWallet() async {
    isLoading(true);
    try {
      var service = Get.find<WalletService>();
      var wallet = HDWallet();
      var params = StoreKeyParams(wallet.mnemonic(), name.value, password.value,
          TWCoinType.TWCoinTypeNewChain);
      var storeKeyJson = await compute(generate, params) as String;
      var newAddress =
          await getWalletAddress(wallet, TWCoinType.TWCoinTypeNewChain);
      var ethAddress =
          await getWalletAddress(wallet, TWCoinType.TWCoinTypeEthereum);
      var storeKeyInfo = StoredKeyInfo();
      storeKeyInfo.text = storeKeyJson;
      var id = await service.addStoreInfo(storeKeyInfo);
      var newWallet = generateNewAddress(newAddress, id);
      var ethWallet = generateEthAddress(ethAddress, id);
      var newWalletId = await service.addWalletInfo(newWallet);
      var ethWalletId = await service.addWalletInfo(ethWallet);
      Get.off(() => MainView(),
          preventDuplicates: false, binding: MainBinding());
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  generate(StoreKeyParams params) async {
    FlutterTrustWalletCore.init();
    var res = StoredKey.importHDWallet(
        params.mnemonic, params.name, params.password, params.coinType)?.exportJson();
    print(res.hashCode);
    return Future(() => res);
  }

  getWalletAddress(HDWallet wallet, int coinType) {
    return Future.value(wallet.getAddressForCoin(coinType));
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
