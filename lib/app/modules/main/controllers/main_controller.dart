import 'package:forcewallet/app/service/rpc_service.dart';
import 'package:get/get.dart';

import 'package:forcewallet/app/database/store_model.dart';
import 'package:forcewallet/app/routes/app_pages.dart';

class MainController extends GetxController {
  var selectedIndex = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    var rpcService = Get.find<ForceRpcService>();
    await rpcService.initRpcService();
  }

  @override
  void onReady() {
    super.onReady();
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
