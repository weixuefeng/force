import 'package:get/get.dart';

import 'package:forcewallet/app/database/object_box.dart';
import 'package:forcewallet/app/database/store_model.dart';
import 'package:forcewallet/app/routes/app_pages.dart';

class HomeController extends GetxController {
  var storedInfos = <StoredKeyInfo>[].obs;
  var walletInfoMap = <int, List<StoredWalletInfo>>{}.obs;
  var selectedIndex = 0.obs;
  var mCurrentWalletId = 0.obs;
  var selectedChain = 0.obs; /// 0: ALL, 1: NEW, 2: ETH

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    var walletInfos = await ObjectBox.queryWallets();
    walletInfos.forEach((element) {
      walletInfoMap[element.parentId] ??= [];
      walletInfoMap[element.parentId]!.add(element);
    });
    print(walletInfoMap);
    var storedKeyInfos = await ObjectBox.queryStoredinfos();
    storedKeyInfos.forEach((element) {
      storedInfos.add(element);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void openWalletDetail(StoredWalletInfo info) {
    Get.toNamed(Routes.WALLET, arguments: info);
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  void onChainTapped(int index) {
    selectedChain.value = index;
  }

  void setCurrentWalletId(int id) {
    mCurrentWalletId.value = id;
  }
}
