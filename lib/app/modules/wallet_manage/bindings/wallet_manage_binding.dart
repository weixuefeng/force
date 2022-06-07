import 'package:get/get.dart';

import '../controllers/wallet_manage_controller.dart';

class WalletManageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletManageController>(
      () => WalletManageController(),
    );
  }
}
