import 'package:get/get.dart';

import 'package:forcewallet/app/database/store_model.dart';
import 'package:forcewallet/app/routes/app_pages.dart';

class BrowserController extends GetxController {
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
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
}
