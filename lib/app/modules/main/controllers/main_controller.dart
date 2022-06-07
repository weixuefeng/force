import 'package:get/get.dart';

import 'package:forcewallet/app/database/store_model.dart';
import 'package:forcewallet/app/routes/app_pages.dart';

class MainController extends GetxController {
  RxList<StoredWalletInfo> walletInfos = <StoredWalletInfo>[].obs;
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    print("main onInit");
  }

  @override
  void onReady() {
    super.onReady();
    print("main onReady");
    var a = Get.arguments as List<StoredWalletInfo>;
    a.forEach((element) {
      walletInfos.add(element);
    });
  }

  @override
  void onClose() {
    print("main close");
    super.onClose();
  }

  void openWalletDetail(StoredWalletInfo info) {
    Get.toNamed(Routes.WALLET, arguments: info);
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
