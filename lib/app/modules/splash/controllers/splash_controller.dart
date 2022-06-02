import 'package:flutter_trust_wallet_core/flutter_trust_wallet_core.dart';
import 'package:forcewallet/app/modules/create/views/create_view.dart';
import 'package:forcewallet/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../database/database_manager.dart';
import '../../home/views/home_view.dart';

class SplashController extends GetxController {
  var content = "".obs;

  List<StoredKey> storeKeys = [];

  @override
  void onInit() {
    super.onInit();
    FlutterTrustWalletCore.init();
    DataBaseManager.init();
  }

  @override
  void onReady() {
    super.onReady();
    print("get wallet check");
    getAllWallets();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getAllWallets() async {
    var wallets = await DataBaseManager.getAllWallets();
    if (wallets != null && wallets.length > 0) {
      wallets.forEach((wallet) {
        var json = wallet['content'];
        content.value = json;
        var storeKey = StoredKey.importJson(json);
        storeKeys.add(storeKey!);
      });
      Get.toNamed(Routes.HOME, arguments: storeKeys);
    } else {
      Get.toNamed(Routes.CREATE);
    }
  }
}
